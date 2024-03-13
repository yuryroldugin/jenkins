environment {
    registry = "quay.io/rin_whoami/docker-kubernetes"
    registryCredential = ‘quay’
}

node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build(registry)
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        docker.image(registry).withRun('-p 8082:80') {c ->
        sh "curl localhost:8082"
        }
    }

//    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
//        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
//            app.push("${env.BUILD_NUMBER}")
//            app.push("latest")
//        }
//    }
}
