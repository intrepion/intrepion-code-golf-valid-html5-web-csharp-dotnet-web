FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /source

COPY CodeGolfValidHtml5App.sln .
COPY CodeGolfValidHtml5Library/*.csproj ./CodeGolfValidHtml5Library/
COPY CodeGolfValidHtml5Tests/*.csproj ./CodeGolfValidHtml5Tests/
COPY CodeGolfValidHtml5Web/*.csproj ./CodeGolfValidHtml5Web/
RUN dotnet restore

COPY CodeGolfValidHtml5Library/. ./CodeGolfValidHtml5Library/
COPY CodeGolfValidHtml5Tests/. ./CodeGolfValidHtml5Tests/
COPY CodeGolfValidHtml5Web/. ./CodeGolfValidHtml5Web/
WORKDIR /source/CodeGolfValidHtml5Web
RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app ./
EXPOSE 80
ENTRYPOINT ["dotnet", "CodeGolfValidHtml5Web.dll"]
