pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'mvn install'
      }
    }

    stage('deploy') {
      steps {
        sh '''sh \'sh  \\\'del "\\\\\\\\home\\\\\\\\ec2-user\\\\\\\\apache-tomcat-8.5.47\\\\\\\\gamutkart.war	 " && xcopy "root\\\\\\\\.jenkins\\\\\\\\workspace\\\\\\\\gamutkart_master\\\\\\\\target\\\\\\\\gamutkart.war" "\\\\\\\\home\\\\\\\\ec2-user\\\\\\\\apache-tomcat-8.5.47\\\\\\\\gamutkart.war"\\\'\'
'''
      }
    }

  }
}