<@pp.dropOutputFile />
<#list dataelements as dataelement>
    <@pp.changeOutputFile name="/de/test/"+dataelement.name+".java" />
package de.test;

public enum ${dataelement.name} {
    INSTANCE(${dataelement.defaultValue});

    private int defaultValue;

    ${dataelement.name}(int defaultValue) {
        this.defaultValue = defaultValue;
    }
}
</#list>