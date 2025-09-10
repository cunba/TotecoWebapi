# Imagen base SDK para compilar
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar archivos del proyecto
COPY . .

# Restaurar dependencias
RUN dotnet restore

# Publicar la aplicación
RUN dotnet publish -c Release -o /app

# Imagen base para runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app .

# Puerto interno de la API
EXPOSE 5540

ENTRYPOINT ["dotnet", "TotecoApi.dll"]
