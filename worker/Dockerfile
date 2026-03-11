# --platform=${BUILDPLATFORM} ensures the build runs on the same architecture as your host
# (important because .NET doesn’t support QEMU emulation well).
# ARG variables let Docker know what platform/architecture you’re building for.


# Build stage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o /app --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/runtime:7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "Worker.dll"]



