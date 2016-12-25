FROM microsoft/aspnetcore-build
WORKDIR /app
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
RUN dotnet publish --output /out/. --configuration Release
WORKDIR /out
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
