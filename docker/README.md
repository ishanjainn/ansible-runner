# ansible-runner

This Image can be used to run basic ansible playbooks which don't require extra collections apart from the ones avaiable with default ansible installation

### Steps:
- Pull the image from DockerHub<br>
- Run the below command to execute an ansible playbook from the docker container

```shell
docker run -it -v $(pwd):/ansible ishanjainn/ansible-runner <playbook-name.yml>
```   
