# Software Reengineering Course - Fork bc-xml-security  

The aim of this project is the analysis, reverse engineering and refactoring of an 
existing application.

The C# solution under consideration fits the basic project requirements:

* 19K lines of code (LOC) 
* open source, hosted on github with MIT License 
* not extremely complex (but further from trivial) 
* builds and runs without troubles 
* test cases and working examples 

The application is called [bc-xml-security](https://github.com/kmvi/bc-xml-security)
and is an implementation of some XML Security Standards using 
[Bouncy Castle](http://www.bouncycastle.org/csharp/).


## Sonarqube

```sh
StartSonar.bat
```


```sh
StartSonar.bat
```

```sh
cd C:\code\bc-xml-security\refactoring
SonarScanner.MSBuild.exe begin /k:"org.sonarqube:sonarqube-scanner-msbuild" /n:"Example of SonarQube Scanner for MSBuild Usage" /v:"1.0"
"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" /t:Rebuild
SonarScanner.MSBuild.exe end
```