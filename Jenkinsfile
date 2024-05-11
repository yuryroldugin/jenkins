node {
    withEnv(['registry=jump.k8s.flane.ru/library/docker-kubernetes']) {

    def app

    stage('Git checkout') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build( registry )
    }
  
    stage('Test image') {
        /* We'd better run a set of tests against the image */
        docker.image( registry )withRun( '-p 8082:80' ) {c ->
        sh "curl localhost:8082"
        }
    }
    stage('Push image') {
        docker.withRegistry('https://jump.k8s.flane.ru', 'jump') {
            app.push()
        }
    }
  }
}

/* And now we'll deploy test app from the image */ 
podTemplate(inheritFrom: 'default')
{
  withEnv(['repo=https://github.com/yuryroldugin/jenkins.git']) {
  
  node(POD_LABEL) {
    stage('Deploy Application') {
      git url: repo, branch: 'main'
      withKubeConfig([credentialsId: 'jenkins']) {
        /* I'm too lazy to build my own container image for the Jenkins agent */
        sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.28.7/bin/linux/amd64/kubectl"'
        sh 'chmod u+x ./kubectl'
        sh './kubectl get all'
        sh './kubectl apply -f ./deployment.yaml'
        }
      }
    }
  }
}
