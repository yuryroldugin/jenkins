podTemplate(inheritFrom: 'default')
{
  node(POD_LABEL){
    stage('List Configmaps') {
      withKubeConfig([credentialsId: 'jenkins']) {
        sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'
        sh 'chmod u+x ./kubectl'
        sh './kubectl get all'
      }
    }
  }
}
