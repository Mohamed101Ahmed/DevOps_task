# Use the official .NET SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project file and restore the dependencies
COPY my-app.csproj .
RUN dotnet restore

# Copy the rest of the application files and build the application
COPY . .
RUN dotnet publish -c Release -o out

# Start with a new image that only includes the .NET runtime (no SDK)
FROM mcr.microsoft.com/dotnet/aspnet:5.0

# Set the working directory in the final image
WORKDIR /app

# Copy the published application from the build image to the final image
COPY --from=build /app/out .

# Expose the port your ASP.NET application listens on (change the port number if needed)
EXPOSE 80

# Set the command to run your ASP.NET application when the container starts
ENTRYPOINT ["dotnet", "my-app.dll"]
