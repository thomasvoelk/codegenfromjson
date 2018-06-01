<@pp.dropOutputFile />
<#macro formatValue value type><#if type == "String">"${value}"<#else> ${value}</#if></#macro>
<#assign package = "your.pckge"/>
<#list dataelements as dataelement>
    <#if "WAEHRUNG_ISOCOD"?split(",")?seq_contains(dataelement.shortName)> <#-- specify for which datelements you want to create an enum -->
        <#assign className = dataelement.shortName?replace("_", " ")?capitalize?replace(" ", "")> <#-- Poor man's camel case -->
        <#assign dataType = "String"/> <#-- we need some conditional assignments if we want to use other data types -->
        <@pp.changeOutputFile name=package?replace(".", "/")+"/"+className+".java" />
package ${package};

public enum ${className} {

        <#compress>
            <#list dataelement.singleValues as value>
                ${value}(<@formatValue value="${value}" type="${dataType}"/>)<#sep>,
            </#list>;
        </#compress>


    private ${dataType} value;

    ${className}(${dataType} value) {
        this.value = value;
    }
}
    </#if>
</#list>