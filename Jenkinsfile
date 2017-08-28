#!/usr/bin/env groovy

node(label: 'demo') {
  checkout scm
  stage('verify-gpg-sigs') {
    sh('if git log --pretty="format:%G?" | grep -qv "G"; then echo "Incorrectly signed commit"; exit 1; fi')
  }
  stage('build-img') {
    sh('make')
  }
  stage('sign-img'){
    withDockerRegistry([credentialsId: 'hub-creds']) {
      withCredentials([string(credentialsId: 'DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE', variable: 'DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE')]) {  
        sh('docker trust sign eiaisjenkins/jenkinsworld:latest') 
      }
    }
  }
}
