FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs
COPY . module7/
WORKDIR /module7
RUN dotnet build
WORKDIR /module7/DotnetTemplate.Web
RUN npm install
RUN npm run build
ENTRYPOINT dotnet run