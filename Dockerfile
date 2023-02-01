FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine

COPY . /app

WORKDIR /app

RUN dotnet build -c Release

RUN dotnet publish HelloWorldDocker -c Release -o publish

# Listen on port 8080 on all network interfaces
ENV ASPNETCORE_URLS=http://+:8080

EXPOSE 8080

# dotnet entrypoint for the service
CMD [ "dotnet", "publish/HelloWorldDocker.dll" ]
