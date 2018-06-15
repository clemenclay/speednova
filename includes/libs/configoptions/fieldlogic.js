;/*
 docs: todo
 {cartfieldlogic} smarty function can be used to include this script once
 fieldLogicLoaded event is triggered on document when this script loads (only once)
 $.fieldLogic can be used to redefine element geters/setters
 - getContainer - get parent of target to show/hide
 - getTarget - get target input
 - setValue - set target input value and eg. handle slider
 - getValue - get current element value 
 - dropValue - clear target value on hide
 */
(function ($, window, document, undefined) {
    var opt = {
        fields: [],
        conditions: [],
        fieldOptions: [],
        index: -1,
        ajax: false
    },
    fl = {
        init: function (options, condition) {
            if (opt.statelock) {
                opt.statelock = false;
                fl.checkAll();
                $.fieldLogic.reset();
            }
            opt.fields.push(this.toArray())
            opt.fieldOptions.push($.extend($.fieldLogic, options));
            opt.conditions.push([]);
            
            opt.index = opt.fields.length - 1;
            if (condition)
                fl.push(condition);
            
            var elements = this;
            
            elements.unbind('.fieldLogic').bind('change.fieldLogic', function (event) {
                fl.checkAll();
            }).each(function () {
                var handler = $(this).prop('onchange');
                $(this).removeProp('onchange');
                $(this).change(handler);
            })
            whenReady();
        },
        update: function (options, condition) {
            opt.fieldOptions[opt.index] = $.extend(opt.fieldOptions[opt.index], options);
            if (condition)
                opt.conditions[opt.index].push(condition);
        },
        checkAll: function () {
            //clear old forms that are not present in dom
            var body = $('body')[0];
            for (var i = 0; i< opt.fields.length; i++) {
                if(!body.contains(opt.fields[i][0])){
                    opt.conditions.splice(i, 1);
                    opt.fieldOptions.splice(i, 1);
                    opt.fields.splice(i, 1);
                    i--;
                }
            }
            
            for (var i = 0, l = opt.fields.length; i < l; i++) {
                opt.index = i;
                fl.checkField.call(opt.fields[i]);
            }
        },
        checkField: function () {
            var conditions = opt.conditions[opt.index],
                options = opt.fieldOptions[opt.index],
                value = options.getValue.call(this, cond, options),
                exclude = [],
                recheck = [];
            for (var i = 0; i < conditions.length; i++) {
                var cond = conditions[i],
                    target = typeof cond.target == 'function' ? cond.target() : options.getTarget(cond),
                    container = typeof cond.container == 'function' ? cond.container() : options.getContainer(cond);

                cond.condition_type = cond.condition_type || 'eq';
                //console.log(cond.condition, cond.condition_type, value, typeof cond.condition, typeof value );
                if ((cond.condition_type == 'eq' && parseInt(value) == parseInt(cond.condition))
                    || (cond.condition_type == 'less' && parseFloat(value) < parseFloat(cond.condition))
                    || (cond.condition_type == 'more' && parseFloat(value) > parseFloat(cond.condition))) {
                    //console.log(cond.condition, cond.condition_type, value, cond.target, cond.action, 'oke', container);
                    if (cond.action == 'hide') {
                        options.dropValue.call(target, cond, options);
                        container.hide();
                    } else if (cond.action == 'show') {
                        options.setValue.call(target, cond, options);
                        container.show();
                    } else if (cond.action == 'setval') {
                        typeof cond.value == 'function' ? cond.value.call(target, cond) : options.setValue.call(target, cond);
                    }
                    exclude.push(container[0]);
                } else if (exclude.indexOf(container[0]) < 0) {
                    //console.log(cond.condition, cond.condition_type, value, cond.target, cond.action, 'nope', container);
                    if (cond.action == 'hide') {
                        container.show();
                        options.setValue.call(target, cond, options);
                        exclude.push(container[0]);
                    } else if (cond.action == 'show') {
                        container.hide();
                        options.dropValue.call(target, cond, options);
                        exclude.push(container[0]);
                    }
                }
                if (cond.action == 'setval' && recheck.indexOf(target[0]) < 0) {
                    target.unbind('change.fieldLogicTarget').bind('change.fieldLogicTarget', function () {
                        $(this).fieldLogic();
                    });
                }
            }
            return this;
        },
        get: function () {
            if (opt.index >= 0)
                return opt.conditions[opt.index];
            return opt.fields;
        },
        push: function (cond) {
            if (opt.index >= 0) {
                if (cond instanceof Array) {
                    cond.splice(0, 0, opt.conditions[opt.index].length, 0);
                    Array.prototype.splice.apply(opt.conditions[opt.index], cond);
                } else if (typeof cond == 'object') {
                    opt.conditions[opt.index].push(cond);
                }
            }
        },
    };

    $.fn.fieldLogic = function (options) {

        opt.index = getIndex(this);
        if (typeof fl[options] == 'function') {
            return fl[options].apply(this, Array.prototype.slice.call(arguments, 1)) || this;
        } else if (typeof options == 'object') {
            if (opt.index < 0) {
                fl.init.apply(this, arguments);
            } else {
                fl.update.apply(this, arguments);
            }
        } else if (opt.index > 0)
            fl.checkField.apply(this, arguments);
        else
            fl.checkAll();
        return this;

        function getIndex(elm) {
            var elements = elm.toArray();
            if (elements.length < 1)
                return -1;
            for (var i = 0; i < opt.fields.length; i++) {
                var match = 1;
                for (var x = 0; x < elements.length; x++) {
                    if (opt.fields[i][x] == undefined || opt.fields[i][x] != elements[x]) {
                        match = 0;
                        break;
                    }
                }
                if (!match || opt.fields[i][x + 1] != undefined)
                    continue;
                return i;
            }
            return -1;
        }
    };
    function FieldLogic() {
    }
    FieldLogic.prototype = {
        getContainer: function (cond, options) {
            return $(cond.container).length ? $(cond.container) : ($(cond.target).length ? $(cond.target).parent() : $());
        },
        getTarget: function (cond, options) {
            if (!$(cond.target).length) {
                if (cond.target.substr(0, 1) == '.')
                    var newtarget = '#' + cond.target.substr(1);
                else
                    var newtarget = '.' + cond.target.substr(1);
                if (!$(newtarget).length) {
                    if (typeof console.warn == 'function')
                        console.warn('field not found ' + cond.target);
                    return $();
                }
                cond.target = newtarget;
            }
            return $(cond.target);
        },
        setValue: function (cond, options) {
            var target = $(this)
            if (!target.filter('input, textarea, select').length) {
                if (!target.find('input, textarea, select').length) {
                    return false;
                }
                target = target.find('input, textarea, select');
            }


            if (cond.action != 'setval') {

                var s = target.siblings('input, select, textarea'),
                    queue = [];
                if (typeof s.addBack == 'function')
                    s = s.addBack()
                else
                    s = s.andSelf();

                s.each(function () {
                    var self = $(this);
                    //window.console.log(target);
                    if (self.data('lastValue')) {
                        queue.push({
                            target: this, 
                            args: [
                                $.extend({}, cond, {action: 'setval', value: self.data('lastValue')}),
                                options
                            ]
                        });
                        self.data('lastValue', null);
                    }
                });
                $.each(queue, function () {
                    options.setValue.apply(this.target, this.args);
                });
                return;
            }

            var value = cond.value,
                tval = parseFloat(target.val());

            if (isNaN(tval) || tval < parseFloat(value)) {
                target.val(value);
                var sliders = target.siblings('.slides, .ui-slider');
                sliders.each(function () {
                    var slider = $(this);
                    var val = parseFloat(slider.slider('value'));
                    if (!isNaN(val) && val != value) {
                        slider.slider('value', value);
                        slider.siblings('[id$=_value_indicator]').html(value);
                    }
                })
            }
        },
        getValue: function (cond, options) {
            var that = $(this),
                checkedtype = that.is('input[type=radio], input[type=checkbox]');
            return checkedtype ? that.filter(':checked').val() : that.val();
        },
        dropValue: function (cond, options) {
            $(this).each(function () {
                var that = $(this);
                if(that.data('lastValue'))
                    return;
                
                if (that.is('input[type=radio], input[type=checkbox]')) {
                    var checked = that.siblings('input:checked');
                    that.data('lastValue', null).siblings('input').data('lastValue', null);
                    checked.data('lastValue', 1);

                    that.prop('checked', false).removeAttr('checked').siblings('input').prop('checked', false).removeAttr('checked');
                } else {
                    that.data('lastValue', that.val())
                    that.val('');
                }
            })

        },
        reset: function () {
            opt = {
                fields: [],
                conditions: [],
                fieldOptions: [],
                index: -1,
                lock: false,
                statelock: false
            }
        }
    }
    
    var whenReady_t;
    function whenReady(){
        
        if(jQuery.isReady){
            clearTimeout(whenReady_t);
            whenReady_t = setTimeout(fl.checkAll, 50);
        }else{
            $(document).off('ready.fieldLogic').one('ready.fieldLogic', fl.checkAll);
        }
    }
    
    if (!$.fieldLogic) {
        $.fieldLogic = new FieldLogic();
        $(document).trigger('fieldLogicLoaded', $.fieldLogic)
    }
    $(document).ajaxStart(function (event, xhr, settings) {
        opt.ajax = true;
    })
    $(document).ajaxStop(function (event, xhr, settings) {
        opt.ajax = false;
    });
})(jQuery, window, document);
