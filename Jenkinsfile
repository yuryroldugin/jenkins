podTemplate(yaml: '''
    apiVersion: v1
    kind: Pod
    spec:
      containers:
      - name: docker
        image: docker:dind
        command:
        - sleep
        args:
        - 99d
''') {
  node(POD_LABEL) {
    stage('Get a Maven project') {
      git 'https://github.com/jenkinsci/kubernetes-plugin.git'
      container('docker') {
        stage('Build a Maven project') {
          sh 'docker run hello-world'
        }
      }
    }


  }
}
