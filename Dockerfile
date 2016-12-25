FROM microsoft/aspnetcore-build
WORKDIR /app
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
#RUN dotnet run
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
#RUN dotnet publish -c Release -o out
