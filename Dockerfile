FROM microsoft/aspnetcore-build
RUN groupadd -r mygroup && useradd -r -g mygroup myuser.
USER myuser
WORKDIR /home/myuser/app
RUN pwd
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
RUN dotnet publish --output /home/myuser/out/. --configuration Release
WORKDIR /home/myuser/out
EXPOSE 80 5000
ENTRYPOINT ["dotnet", "app.dll"]
