<@pp.dropOutputFile />
<#macro formatValue value type>
    <#-- puts values of type String in quotes, leaves values of other types untouched-->
    <#compress>
    <#if type == "String">
        "${value}"
    <#else>
        ${value}
    </#if>
    </#compress>
</#macro>
<#macro formatEnumConstant constant businessFormat>
    <#-- prepends numerical constants with a _ to avoid syntax errors-->
    <#compress>
        <#if businessFormat == "NUM">
            _${constant}
        <#else>
            ${constant}
        </#if>
    </#compress>
</#macro>
<#assign package = "your.pckge"/>
<#list dataelements as dataelement>
    <#if "WAEHRUNG_ISOCOD,EDI_JOB_STATUS"?split(",")?seq_contains(dataelement.shortName)> <#-- specify for which datelements you want to create an enum -->
        <#assign className = dataelement.shortName?replace("_", " ")?capitalize?replace(" ", "")> <#-- Poor man's camel case -->
        <#assign dataType = "String"/> <#-- we need some conditional assignments if we want to use other data types like int -->
        <@pp.changeOutputFile name="/" + package?replace(".", "/") + "/"+className + ".java" />
package ${package};

public enum ${className} {

        <#compress>
            <#list dataelement.singleValues as value>
                <@formatEnumConstant constant="${value}" businessFormat="${dataelement.businessFormat}"/>(<@formatValue value="${value}" type="${dataType}"/>)<#sep>,
            </#list>;
        </#compress>


    private ${dataType} value;

    ${className}(${dataType} value) {
        this.value = value;
    }
}
    </#if>
</#list>