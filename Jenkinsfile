pipeline {
    agent any

    environment {
        DOTNET_CLI_HOME = "/tmp/dotnet_cli_home"
        XDG_DATA_HOME = "/tmp"
    }

    stages {
        stage('npm') {
            agent {
                docker { image 'node:17-bullseye' }
            }
            steps {
                dir("DotnetTemplate.Web"){
                    sh 'npm install'
                    sh 'npm t'
                    sh 'npm run lint'
                }
            }
        }
        stage('dotnet') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:6.0' }
            }
            steps {
                sh 'dotnet build'
                sh 'dotnet test'
            }
        }
    }
}