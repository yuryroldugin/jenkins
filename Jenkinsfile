podTemplate(containers: [
    containerTemplate(name: 'docker', image: 'docker', command: 'sleep', args: '99d'),
  ]) {

  node(POD_LABEL) {
        stage('Get a project') {
            git 'https://github.com/jenkinsci/kubernetes-plugin.git'
            container('docker') {
                stage('Build a Maven project') {
                    sh 'mvn -B -ntp clean install'
                }
            }
        }
     }
   }
