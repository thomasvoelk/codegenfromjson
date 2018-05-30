<@pp.dropOutputFile />
<#list dataelements as dataelement>
    <@pp.changeOutputFile name="/de/test/"+dataelement.name+".java" />
package de.test;

public enum ${dataelement.name} {

    <#list dataelement.values as value>
        ${value.name}(<#if dataelement.type == "String">"</#if>${value.value}<#if dataelement.type == "String">"</#if>)<#sep>,</#sep>
    </#list>;

    private ${dataelement.type} value;

    ${dataelement.name}(${dataelement.type} value) {
        this.value = value;
    }
}
</#list>