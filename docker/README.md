# Ansible

Image which can be used to run any playbook. Currently only supports basic playbooks

Steps:
- Pull the image from DockerHub<br>
- run the following command from the directory where playbook is present:

```shell
docker run -it -v $(pwd):/ansible ishanjainn/ansible-runner <playbook-name.yml>
```   
