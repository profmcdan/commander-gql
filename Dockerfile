#FROM microsoft/dotnet:2.1-sdk
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

RUN dotnet tool install --global dotnet-ef --version 5.0.3
ENV PATH="${PATH}:/root/.dotnet/tools"

COPY . /app

RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]

RUN chmod +x ./entrypoint.sh
CMD /bin/bash ./entrypoint.sh

# OK

#COPY . /app
#WORKDIR /app

#RUN ["dotnet", "restore"]
#RUN ["dotnet", "build"]
#EXPOSE 80/tcp


