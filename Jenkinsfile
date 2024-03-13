podTemplate(containers: [
    containerTemplate(name: 'php', image: 'php', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
        stage('Get a project') {
            git 'https://github.com/yuryroldugin/jenkins.git'
            container('php') {
                stage('Show a project') {
                    sh 'ls -a'
                }
            }
        }
   }
}
