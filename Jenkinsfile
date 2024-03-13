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
        tty: true
        volumeMounts:
        - mountPath: /var/run/docker.sock
          name: docker-sock
        volumes:
        - name: docker-sock
          hostPath:
            path: /var/run/docker.sock
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
