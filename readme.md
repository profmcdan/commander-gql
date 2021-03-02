### Generate Certificates
```
$ mkdir conf.d
$ dotnet dev-certs https --clean
$ dotnet dev-certs https -ep ./conf.d/https/dev_cert.pfx -p madison
$ dotnet dev-certs https --trust
```

### Sample docker-compose file
```
api:
    container_name: mad.api
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+80
      - ASPNETCORE_HTTPS_PORT=44311
      - ASPNETCORE_Kestrel__Certificates__Default__Password=madison
      - ASPNETCORE_Kestrel__Certificates__Default__Path=/https/dev_cert.pfx
    ports:
      - "50420:80"
      - "44361:443"
    volumes:
      - ./conf.d/https/:/https/
    networks:
      - mad_network

...


$ docker-compose down # Down any previous setup
$ docker-compose up --build -d # Build and run containers
$ docker-compose ps # Check status of api..make sure its "up"
$ docker-compose logs -f api # Check logs
```
