# Devops
Devops repo for UE5 projects which contains different scripts and templates

 - Add this repo as submodule (with name Devops) to your UE5 project near .uproject file. (git submodule add git@github.com:AnthonyNauman/Devops.git Devops)
 - Run Setup/setup.bat file. It copies template files to scripts folder and some files to project directory.
 - Set needed variables in DevopsData\config.bat file which are needed to run scripts correctly.
 - Set variables in jenkins.properties file and set path to it to jenkins job parameter PROP_PATH
