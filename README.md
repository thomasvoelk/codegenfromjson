# Generate Java Enum classes from JSON data

## pom.xml
Just include the **exec-maven-plugin** in your build to run the FreeMarker-based file PreProcessor (**fmpp**) during the _generate-sources_ phase.

Check out the [fmpp documentation][1] to learn what the commandline arguments do or the [plugin documentation][2] if you want to know more about the plugin parameters.


##enum.ftl
Enums will be generated based on this [Freemarker][3] template. Modify it as you need.

The line
`<#list dataelements as dataelement>`
iterates over the JSON data that is defined in the configuration `config.fmpp.

##config.fmpp
Configure the directory filename of your input file here. The line `dataelements: json(Datenelemente.json, UTF-8)` creates a variable that can be used in the Freemarker template that contains the object(s) defined in your data source.  


[1]: http://fmpp.sourceforge.net/commandline.html#sect9
[2]: https://www.mojohaus.org/exec-maven-plugin/java-mojo.html
[3]: https://freemarker.apache.org
