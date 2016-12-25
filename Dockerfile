FROM microsoft/dotnet:1.0-sdk-projectjson
#WORKDIR /app
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
#RUN dotnet publish -c Release -o out
