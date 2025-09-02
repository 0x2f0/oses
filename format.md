# Format for writing tools install scripts. 

# variable and info
Here are the headers that will be parsed to render the installable tools list.
Make sure to wrap all these headers in comment.

## Headers and meta info
Contains the meta information about the tools or packages that are 
going to be installed. 
The variable definition beins with a 
"--meta--" tag and ends with "--meta--" tag.

Here is a list of available variable to use.
1. name:
   Display name of the tool that will be rendered in the installation list. 
1. desc:
   Description of the tool.
1. source: 
   Link to the project source.
1. deps:
   List of dependences that should be preinstalled to correctly install the tools. 
   it should contain the comma seperated list dependencies.
1. platform:
   The platform that the current configuration tool supports.
   And if it is specified in the deps folder than it will be skipped according to 
   the platform.


Example:
```sh
    # list_name: 
    # description: description of the tool name. 
```

## Tools:
Tools are the items that will be displayed in the selection screen.
To configure how they look and behave the following (#Headers and meta info)[meta variables] can be used.

`name`,`desc` and `deps`.

## Deps:
All the deps required for tools to be installed,should be kept inside the 
deps directory inside the install directory. They will also follow a similar pattern to the Headers and meta info 
section.
