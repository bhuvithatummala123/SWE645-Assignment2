// SWE 645 Assignment 2
// This Jenkins pipeline builds the survey Docker image and pushes it to Docker Hub.

pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'bhuvithat/swe645-survey'
        DOCKER_PATH = 'C:\\Users\\bhuvi\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe'
    }

    stages {

        stage('Build Docker Image') {
            steps {
                bat '"%DOCKER_PATH%" build -t %DOCKER_IMAGE%:%BUILD_NUMBER% .'
                bat '"%DOCKER_PATH%" tag %DOCKER_IMAGE%:%BUILD_NUMBER% %DOCKER_IMAGE%:latest'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-swe645',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {

                    powershell '''
    Write-Host "Docker username received by Jenkins: [$env:DOCKER_USERNAME]"
    Write-Host "Docker password length: $($env:DOCKER_PASSWORD.Length)"
    $env:DOCKER_PASSWORD | & "$env:DOCKER_PATH" login -u "$env:DOCKER_USERNAME" --password-stdin
'''

                    bat '"%DOCKER_PATH%" push %DOCKER_IMAGE%:%BUILD_NUMBER%'
                    bat '"%DOCKER_PATH%" push %DOCKER_IMAGE%:latest'
                }
            }
        }
    }
}