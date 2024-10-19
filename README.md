### A powershell script to generate the projects required for clean architecture on windows

run the script with the project name as a parameter
```
.\Generator.ps1 ProjectName
```

you can add the script to the powershell profile by running the following command
```
code $profile
```
this will open the powershell profile in vs code assuming that you have already setup the correct path for vs code.

then you can add the following line to the powershell profile
```
Set-Alias -Name gen-ca -Value D:\Path\To\CleanArchTemplateGenerator\Generator.ps1
```
specifying the path to the script.

once done you can reload the powershell window and run the command
```
gen-ca ProjectName
```
to generate the solution and the projects. and cd into the folder.