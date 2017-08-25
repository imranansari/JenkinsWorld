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
    sh('docker trust sign eiais/JenkinsWorld:latest') 
  }
}
