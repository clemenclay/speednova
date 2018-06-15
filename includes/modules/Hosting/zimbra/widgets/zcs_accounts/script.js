$(function () {
    function quotaWidth() {
        $('.quotaDiv').each(function () {
            var self = $(this);
            self.find('span').width(self.children().eq(1).width());
        });
    }
    quotaWidth();
    
    $('.service-quota').each(function () {
        var self = $(this),
            data = self.data();

        if (data.limit) {
            var usedmb = Math.round(data.usage / 1024 / 1024),
                usage = Math.round(((data.usage / 1024 / 1024) / data.limit) * 100),
                assigned = data.assigned ? Math.round((data.assigned / data.limit) * 100) : 0;

            assigned = assigned + usage < 100 ? assigned : 100 - usage;
            var left = data.limit - usedmb;

            if (usage)
                self.append('<div style="width:' + usage + '%" class="usage" data-toggle="tooltip" title="Used ' + usage + '%">' + usedmb + ' MB </div>')

            if (assigned + usage < 100)
                self.append('<div style="width:' + (100 - (assigned + usage)) + '%" class="free" data-toggle="tooltip" title="Base free quota ' + (100 - (assigned + usage)) + '%">' + left + 'MB</div>')

            self.append('<div style="width:' + assigned + '%" class="assigned" data-toggle="tooltip" title="Free assigned quota ' + assigned + '%">' + data.assigned + ' MB</div>')
        }
    });

    var m = $('.modal');
    m.each(function () {
        var self = $(this);
        self.detach().appendTo('body');
        self.find('.xclose').click(function () {
            self.modal('hide');
            return false;
        });

        self.find('#inputEmail').on('keyup input', function (e) {
            if (e.type == 'keyup' && (e.keyCode == 37 || e.keyCode == 38 || e.keyCode == 39 || e.keyCode == 40))
                return false;

            var i = $(this),
                cursor = getInputSelection(i[0]),
                r = new RegExp('@.*$|' + i.data('domain') + '$|[^a-zA-Z0-9.+-_~]+', 'g'),
                val = i.val().replace(r, ''),
                start = cursor.start > val.length ? val.length : cursor.start;

            i.val(val + '@' + i.data('domain'));

            setInputSelection(i[0], start, start);
        })
    })

    $('#accountlist').on('click', '.iquota', function (e) {
        var q = $('#iquota'),
            data = $(this).data(),
            s = $('#slider');


        q.find('.parent').val(data.domainid).next().val(data.id);
        q.find('.cos').val(data.cosid);
        q.find('.iqota-mailbox').text($(this).data('name'));

        s.slider("option", {
            min: parseInt(data.min),
            max: parseInt(data.limit) + parseInt(s.data('limit')),
            value: data.limit
        });
        s.slider('option', 'stop').call(s, e, {
            value: s.slider('value')
        });

        q.modal();
        return false;
    })

    $('#newacc').click(function (e) {
        e.preventDefault();
        var acc = $('#accoount'),
            data = $(this).data(),
            s = $('#slider');
        //acc.find('input, select').val('');
        acc.find('.parent').val(data.domainid);
        acc.find('.parentac').val('');

        if (acc.find('#wdo').val() != 'account') {
            acc.find('input,select,textarea').val('');
            //s.slider('value', 1).slider('option', 'stop').call(s, e, {
            //    value: s.slider('value')
            //});
        }

        acc.find('#wdo').val('account');

        acc.find('#inputEmail').data('domain', data.domain).prop('placeholder', 'example@' + data.domain).prop('readonly', false);
        acc.find('#selectCos').children().each(function () {
            return zcsCOSLimit.call(this, data.cosid)
        }).end().val('')//.parents('.control-group').eq(0).show();
        acc.modal();
        return false;
    })

    $('#accountlist').on('click', '.edit', function (e) {
        e.preventDefault();
        var acc = $('#accoount'),
            data = $(this).data(),
            s = $('#slider');

        acc.find('.parent').val(data.domainid);
        acc.find('.parentac').val(data.id);

        acc.find('#inputFirst').val(data.firstname);
        acc.find('#inputLast').val(data.lastname);
        //acc.find('#inputQuota').val(data.quota);
        acc.find('#wdo').val('editaccount');

        acc.find('#inputEmail').data('domain', '').val(data.name).prop('readonly', true);
        acc.find('#selectCos').children().each(function () {
            return zcsCOSLimit.call(this, data.cosid)
        }).end().val(data.cosid);
        //acc.find('#selectCos').parents('.control-group').eq(0).hide();
        acc.modal();
        return false;
    });

    function zcsCOSLimit(accos) {
        var self = $(this),
            cosid = self.attr('value'),
            cos = $('#cos_' + cosid),
            limit = (cos.length && parseInt(cos.val()) || 0) + (cosid == accos && 1 || 0)
        if (!cosid.length)
            return;
        if (limit > 0) {
            self.prop('disabled', false);
        } else
            self.prop('disabled', true);
        self.text(self.text().replace(/\(-?\d+/, '(' + limit));
    }

    (function () {
        var s = $('#slider'),
            val = $('#inputQuota'),
            ind = $('#quotaIndicator');
        if (typeof (s.slider) != 'function') {
            s.hide();
            val.show();
            return false;
        }

        var maxval = parseInt(s.data('limit'));
        s.width(200).slider({
            min: 1, max: maxval, value: val.val() || 1, step: 1, range: "min", animate: true,
            stop: function (e, ui) {
                val.val(ui.value).trigger('change');
                ind.text(ui.value);
            },
            slide: function (e, ui) {
                ind.text(ui.value);
            }
        });
    })()

    $("#zcsdomain").change(function () {
        var self = $(this);
        $('#newacc').data('domainid', self.val()).data('domain', self.children(':selected').text().trim());
        $('#accountlist').addLoader();
        $.post(window.location.url, {wdo: 'list', domain_id: self.val()}, function (data) {
            data = parse_response(data);
            $('#accountlist').html(data);
            quotaWidth();
            $('#accountlist [data-toggle="tooltip"]').tooltip();
        });
    });
    $('#newacc').data('domainid', $("#zcsdomain").val()).data('domain', $("#zcsdomain").children('[value=' + $("#zcsdomain").val() + ']').text().trim());

    var handle_password = function () {
        var that = $(this),
            val = that.val(),
            btn = $('#buttonSubmit'),
            cos = $('#accoount #selectCos').val(),
            title = [];

        var password = pass_complexity[cos] || pass_complexity.default;
        if (val.length != 0) {

            if (val.length < password.zimbraPasswordMinLength)
                title.push('Password is to short, minimum ' + password.zimbraPasswordMinLength + ' characters');

            if (val.length > password.zimbraPasswordMaxLength)
                title.push('Password is to long, maximum ' + password.zimbraPasswordMaxLength + ' characters');

            if (val.replace(/[^\d~!@#$%^&*_\-+=`|\(){}[\]:;"'<>,.?\/]/g, '').length < password.zimbraPasswordMinDigitsOrPuncs)
                title.push('At least ' + password.zimbraPasswordMinDigitsOrPuncs + ' symbols or digits reqired');

            if (val.replace(/[^a-z]/g, '').length < password.zimbraPasswordMinLowerCaseChars)
                title.push('At least ' + password.zimbraPasswordMinLowerCaseChars + ' lower case characters reqired');

            if (val.replace(/[^A-Z]/g, '').length < password.zimbraPasswordMinUpperCaseChars)
                title.push('At least ' + password.zimbraPasswordMinUpperCaseChars + ' upper case characters reqired');

            if (val.replace(/[^\d]/g, '').length < password.zimbraPasswordMinNumericChars)
                title.push('At least ' + password.zimbraPasswordMinNumericChars + ' numeric characters reqired');

            if (val.replace(/[^~!@#$%^&*_\-+=`|\(){}[\]:;"'<>,.?\/]/g, '').length < password.zimbraPasswordMinPunctuationChars)
                title.push('At least ' + password.zimbraPasswordMinPunctuationChars + ' punctuation characters reqired');

        }
        if (title.length) {
            that.parent().addClass('error');
            btn.prop('disabled', true).fadeTo(200, 0.5);
            updateTitle(that, title.join('. '))
        } else {
            btn.prop('disabled', false).fadeTo(200, 1);
            that.parent().removeClass('error').fadeTo(200, 1);
            updateTitle(that);
        }
    };

    $('#inputPassword').bind('keyup input change', handle_password).keyup().parent().addClass('control-group');
    $('#selectCos').on('change', function (e) {
        handle_password.call($('#accoount #inputPassword')[0], e);
    })

    $('[data-toggle="tooltip"]').tooltip();

    function getInputSelection(el) {
        var start = 0, end = 0, normalizedValue, range,
            textInputRange, len, endRange;

        if (typeof el.selectionStart == "number" && typeof el.selectionEnd == "number") {
            start = el.selectionStart;
            end = el.selectionEnd;
        } else {
            range = document.selection.createRange();

            if (range && range.parentElement() == el) {
                len = el.value.length;
                normalizedValue = el.value.replace(/\r\n/g, "\n");

                textInputRange = el.createTextRange();
                textInputRange.moveToBookmark(range.getBookmark());

                endRange = el.createTextRange();
                endRange.collapse(false);

                if (textInputRange.compareEndPoints("StartToEnd", endRange) > -1) {
                    start = end = len;
                } else {
                    start = -textInputRange.moveStart("character", -len);
                    start += normalizedValue.slice(0, start).split("\n").length - 1;

                    if (textInputRange.compareEndPoints("EndToEnd", endRange) > -1) {
                        end = len;
                    } else {
                        end = -textInputRange.moveEnd("character", -len);
                        end += normalizedValue.slice(0, end).split("\n").length - 1;
                    }
                }
            }
        }

        return {
            start: start,
            end: end
        };
    }

    var timeout = false;
    function updateTitle(elm, title) {
        if (title) {
            if (timeout)
                clearTimeout(timeout);
            timeout = setTimeout(function () {
                elm.attr('title', title);
                if (typeof jQuery.fn.tooltip == 'function')
                    elm.tooltip({placement: 'right', animation: false}).tooltip('fixTitle').tooltip('enable');
                if ($('.tooltip:visible').length) {
                    elm.tooltip('show');
                }

            }, 100);
        } else {
            elm.removeAttr('title');
            if (typeof jQuery.fn.tooltip == 'function')
                elm.tooltip('hide').tooltip('disable');
        }
    }

    function offsetToRangeCharacterMove(el, offset) {
        return offset - (el.value.slice(0, offset).split("\r\n").length - 1);
    }

    function setInputSelection(el, startOffset, endOffset) {
        if (typeof el.selectionStart == "number" && typeof el.selectionEnd == "number") {
            el.selectionStart = startOffset;
            el.selectionEnd = endOffset;
        } else {
            var range = el.createTextRange();
            var startCharMove = offsetToRangeCharacterMove(el, startOffset);
            range.collapse(true);
            if (startOffset == endOffset) {
                range.move("character", startCharMove);
            } else {
                range.moveEnd("character", offsetToRangeCharacterMove(el, endOffset));
                range.moveStart("character", startCharMove);
            }
            range.select();
        }
    }
})