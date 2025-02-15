$projectName = $args[0]

mkdir $projectName
cd .\$projectName
mkdir src
cd src


#creating the projects
dotnet new webapi -n $projectName".Api"  --use-controllers
dotnet new classlib -o $projectName".Contracts" 
dotnet new classlib -o $projectName".Application"
dotnet new classlib -o $projectName".Infrastrucure"
dotnet new classlib -o $projectName".Domain"

# adding the references
dotnet add $projectName".APi" reference $projectName".Application"
dotnet add $projectName".APi" reference $projectName".Contracts"
#referencing the infrastructure from API for the purpose of wiring the dependency injection IoC container
dotnet add $projectName".APi" reference $projectName".Infrastrucure"
dotnet add $projectName".Infrastrucure" reference $projectName".Application"
dotnet add $projectName".Application" reference $projectName".Domain"

#creating the solution
cd ..
dotnet new sln --name $projectName

#adding the projects to the solution
dotnet sln add (ls -r **/**.csproj) 

# ADDING PACKAGES
## adding dependency injection
dotnet add src/$projectName".Application" package Microsoft.Extensions.DependencyInjection
dotnet add src/$projectName".Infrastrucure" package Microsoft.Extensions.DependencyInjection


## adding MediatR
dotnet add src/$projectName".Application" package MediatR # same package can be used in the API layer cause API depends on Application
dotnet add src/$projectName".Application" package ErrorOr 


#building the project
dotnet build