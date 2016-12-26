FROM microsoft/aspnetcore-build
RUN groupadd mygroup && useradd -m -g mygroup myuser
WORKDIR /home/myuser
run mkdir app
WORKDIR app
COPY project.json .
RUN dotnet restore

# copy and build everything else
USER myuser
COPY . .
RUN dotnet publish --output /home/myuser/out/. --configuration Release
WORKDIR /home/myuser/out
EXPOSE 80 5000
ENTRYPOINT ["dotnet", "app.dll"]
