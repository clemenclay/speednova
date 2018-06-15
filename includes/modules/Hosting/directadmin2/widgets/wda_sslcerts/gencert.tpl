<div class="control-group">
    <label for="domains" id="lblDomains">
        Common Name<span class="extra">*</span></label>
    </label>
    <div class="row">
        <div class="span3">
            <input type="text" name="domain" value="{$domain}"/>
        </div>
        <div class="span5">
            <div class="help-block">
                Select domain that you are trying to secure
            </div>
        </div>
    </div>
</div>
<div class="control-group">
    <label for="city" id="lblCity"><span>City</span><span class="extra">*</span></label>
    <div class="row">
        <div class="span3">
            <input type="text" class="form-control" name="city" id="city" value="{$submit.city}" >
        </div>
        <div class="span5">
            <div class="help-block">Provide the complete name for the city or locality. Do not use abbreviations.</div>
        </div>
    </div>
</div>
<div class="control-group">
    <label for="state" id="lblState"><span>State</span><span class="extra">*</span></label>
    <div class="row">
        <div class="span3">
            <input type="text" class="form-control" name="state" id="state" value="{$submit.state}">

        </div>
        <div class="span5">
            <div class="help-block">Provide the complete name for the state or province. Do not use abbreviations.</div>
        </div>
    </div>
</div>
<div class="control-group">
    <label for="country" id="lblCountry"><span>Country</span><span class="extra">*</span></label>
    <div class="row">
        <div class="span3">
            <select class="form-control" name="country" id="country">
                <option value="">Choose a country.</option>
                {foreach from=$countrylist item=country key=iso}
                    <option value="{$iso}" {if $submit.country == $iso}selected="selected"{/if}>{$country}</option>
                {/foreach}
            </select>

        </div>
        <div class="span5">
            <span class="help-block">Choose the country of origin for the certificate’s “Company”.</span>
        </div>
    </div>
</div>
<div class="control-group">
    <label for="company" id="lblCompany"><span>Company</span><span class="extra">*</span></label>
    <div class="row">
        <div class="span3">
            <input type="text" class="form-control" name="company" id="company" value="{$submit.company}">
        </div>
        <div class="span5">
            <div class="help-block">Provide the legally-registered name for your business. 
                If your company name includes symbols other than a period or comma, 
                check with your certificate authority to confirm that they are acceptable.</div>
        </div>
    </div>
</div>
<div class="control-group">
    <label for="companydivision" id="lblCompanyDivision">Company Division</label>
    <div class="row">
        <div class="span3">
            <input type="text" class="form-control" name="companydivision" id="companydivision" value="{$submit.companydivision}">

        </div>
        <div class="span5">
            <div class="help-block">Provide the name of the division or group within the above company. If the division includes symbols other than a period or comma, check with your certificate authority to confirm that they are acceptable.</div>
        </div>
    </div>
</div>
<div class="control-group">
    <label for="email" id="lblEmail">Email</label>
    <div class="row">
        <div class="span3">
            <input type="text" class="form-control" name="email" id="email" value="{$submit.email}">

        </div>
        <div class="span5">
            <span class="help-block">Provide a valid email address where you can be contacted for verification of domain ownership.</span>
        </div>
    </div>
</div>

<div class="control-group">
    <input type="hidden" value="csr" name="item" id="hidItem">
    <input type="hidden" value="Certificate Signing Request" name="itemname" id="hidItemname">
    <input type="submit" title="Click to generate the certificate signing request." value="Generate" class="btn btn-flat-primary btn-primary" id="submit-button">
</div>
{securitytoken}