FROM microsoft/aspnetcore-build
WORKDIR /app
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
#RUN dotnet run
RUN dotnet publish --output /out/. --configuration Release
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
#RUN dotnet publish -c Release -o out
