def notifySlack(String buildStatus = 'STARTED') {
    // Build status of null means success.
    buildStatus = buildStatus ?: 'SUCCESS'

    def color

    if (buildStatus == 'STARTED') {
        color = '#D4DADF'
    } else if (buildStatus == 'SUCCESS') {
        color = '#BDFFC3'
    } else if (buildStatus == 'UNSTABLE') {
        color = '#FFFE89'
    } else {
        color = '#FF9FA1'
    }

    def msg = "${buildStatus}: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:\n${env.BUILD_URL}"

    slackSend(channel: '#g7devops', color: color, message: msg)
}

node {
    try {
        
        // Get Artifactory server instance, defined in the Artifactory Plugin administration page.
		 def server = Artifactory.server "devopscs.jfrog.io"
		 // Create an Artifactory Maven instance.
		 def rtMaven = Artifactory.newMavenBuild()
		 def buildInfo
		 rtMaven.tool = "maven"
		 
        
 stage('Clone sources') {
  git url: 'https://github.com/anushanari1010/g7webapp.git'
 }
 
 


 stage("build & SonarQube analysis") {

		  withSonarQubeEnv('sonarqube') {
		   sh 'cd /var/lib/jenkins/workspace/G7-Pipeline-Through-Code/'
		   sh 'mvn clean install'
		   sh 'mvn clean package sonar:sonar "-Dsonar.host.url=http://18.223.30.20:9000/sonar/" "-Dsonar.login=f694f1b93e962eb520e00b90152f49c4047cb0f9" "-Dsonar.sources=/var/lib/jenkins/workspace/G7-Pipeline-Through-Code/" "-Dsonar.tests=." "-Dsonar.projectKey=DevOpsProject" "-Dsonar.projectName=DevOpsProject" "-Dsonar.projectVersion=1.0" "-Dsonar.test.inclusions=**/test/java/servlet/createpage_junit.java" "-Dsonar.exclusions=**/test/java/servlet/createpage_junit.java" "-Dsonar.login=admin" "-Dsonar.password=admin"'
		  }

 }

 stage('Maven compile') {
  buildInfo = rtMaven.run pom: 'pom.xml', goals: 'compile'
 }


stage('deploy to qa'){
 deploy adapters: [tomcat7(credentialsId: 'tomcat', path: '', url: 'http://18.188.28.239:8080/')], contextPath: '/G7QAWebapp', war: '**/*.war'
}


 stage('Functional Test') {
  buildInfo = rtMaven.run pom: 'functionaltest/pom.xml', goals: 'compile test'
  
  // Archive the built artifacts
   //archive includes: 'pkg/*.gem'

    // publish html
   publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '\\functionaltest\\target\\surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
      
 }
 
  stage('Blazemeter Performace Testing') {
 blazeMeterTest credentialsId: 'Blazemeter', testId: '7904505.taurus', workspaceId: '468378'
}

stage('deploy to prod'){
 deploy adapters: [tomcat7(credentialsId: 'tomcat', path: '', url: 'http://52.14.116.234:8080/')], contextPath: '/G7Webapp', war: '**/*.war'
}


 stage('Sanity Test and Slack Notification') {
  buildInfo = rtMaven.run pom: 'Acceptancetest/pom.xml', goals: 'test'
  
  // Archive the built artifacts
   //archive includes: 'pkg/*.gem'

    // publish html
   publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '\\Acceptancetest\\target\\surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
      
 }

  stage('Artifactory configuration') {
		  // Tool name from Jenkins configuration
		  rtMaven.tool = "maven"
		  // Set Artifactory repositories for dependencies resolution and artifacts deployment.
		  rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
		  rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
 }

 stage('Publish build info') {
  server.publishBuildInfo buildInfo
 }
 
        notifySlack()

        // Existing build steps.
    } catch (e) {
        currentBuild.result = 'FAILURE'
        throw e
    } finally {
        notifySlack(currentBuild.result)
    }
}
