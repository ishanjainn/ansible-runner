# ansible-runner

Image which can be used to run basic ansible playbooks which do not need extra collections apart from the ones avaiable with default ansible installation

### Steps:
- Pull the image from DockerHub<br>
- run the following command from the directory where playbook is present:

```shell
docker run -it -v $(pwd):/ansible ishanjainn/ansible-runner <playbook-name.yml>
```   
