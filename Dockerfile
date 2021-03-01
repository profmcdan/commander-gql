#FROM microsoft/dotnet:2.1-sdk
FROM mcr.microsoft.com/dotnet/sdk:5.0

#COPY bin/Release/net5.0/publish/ App/
#WORKDIR /App
#ENTRYPOINT ["dotnet", "NetCore.Docker.dll"]

COPY . /app
WORKDIR /app

RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
EXPOSE 80/tcp
RUN chmod +x ./entrypoint.sh
CMD /bin/bash ./entrypoint.sh