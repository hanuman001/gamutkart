pipeline {
	environment {
        //This variable need be tested as string
        doError = '1'
    }
	agent any 
  satges {
  	stage('Clone'){
  		steps{
  			git url: 'https://github.com/Rajendra333/gamutkart.git'
  		}
  	}
  	stage('Build'){
  		steps{
  			bat 'mvn clean package'
  		}
  	}
  	stage('Test'){
  		steps{
  			bat 'mvn test'
  		}
  	}
  	stage('Sonar'){
  		steps{
  			bat 'mvn sonar:sonar'
  		}
  	}
  	stage('Error'){
  		when {
  			expression { doError == '1'}
  		}
        steps{
         	echo "Failure"
         	error "Failure test . It's Works "
        }
  	}
  	stage('Sucess'){
  		when{
  			expression { doError == '0'}
  		}
  		steps{
  			echo "ok"
  		}
  	}
  	post {
  		always {
  			echo 'I will say Hello again'

  			emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'rajendra.r2t@gmail.com'], [$class: 'rajendrachowdary40@gmail.com']],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
  		}
  	}

  	stage('Deploy'){
  		steps{
  			bat 'del "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\gamutkart.war " && xcopy "C:\\Program Files (x86)\\Jenkins\\workspace\\gamutkart_master@script\\target\\gamutkart.war" "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps"'

  		}
  	}	
  }
  
}