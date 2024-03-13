podTemplate(yaml: '''
    apiVersion: v1
    kind: Pod
    spec:
      containers:
      - name: docker
        image: docker
        command:
        - sleep
        args:
        - 99d
        volumeMounts:
        - mountPath: /var/run/docker.sock
          name: docker-sock
        volumes:
        - name: docker-sock
          hostPath:
            path: /var/run/docker.sock    

''')

