pipeline {
    agent any
    parameters {
        choice(
            name: 'NUMBER',
            choices: ['10','20','30','40','50','60','70','80','90'],
            description: 'Select the value for F(n) for the Fibonacci sequence.'
        )
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
        timestamps()
    }
    triggers {
        cron('@midnight')
    }
    stages {
        stage('Run with relative path') {
            steps {
                bat(".\\scripts\\fibonacci.bat %NUMBER%")
            }
        }
        stage('Run with full path') {
            steps {
                bat("%WORKSPACE%\\scripts\\fibonacci.bat %NUMBER%")
            }
        }
        stage('Change directory') {
            steps {
                dir("${env.WORKSPACE}\\scripts") {
                    bat("fibonacci.bat %NUMBER%")
                }
            }
        }
    }
}
