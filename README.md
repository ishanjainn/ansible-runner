# ansible-runner
A kubernetes runner to run ansible playbooks using kubernetes CronJobs and configMaps.
This project covers all aspects of CI pipeline including ansible-build check, kubernetes-build check, Security scans for Docker Image using GitHub Actions. This project has auto dependency updates enabled using Renovate.

------
[![Docker-Release](https://github.com/ishanjainn/ansible-runner/actions/workflows/docker-release.yml/badge.svg)](https://github.com/ishanjainn/ansible-runner/actions/workflows/docker-release.yml)
[![Kubernetes-Build](https://github.com/ishanjainn/ansible-runner/actions/workflows/kubernetes-build.yml/badge.svg)](https://github.com/ishanjainn/ansible-runner/actions/workflows/kubernetes-build.yml)
[![Ansible-Build](https://github.com/ishanjainn/ansible-runner/actions/workflows/ansible-build.yml/badge.svg)](https://github.com/ishanjainn/ansible-runner/actions/workflows/ansible-build.yml)
[![Security-Check](https://github.com/ishanjainn/ansible-runner/actions/workflows/security-check.yml/badge.svg)](https://github.com/ishanjainn/ansible-runner/actions/workflows/security-check.yml)
[![Renovate](https://github.com/ishanjainn/ansible-runner/actions/workflows/renovate.yml/badge.svg)](https://github.com/ishanjainn/ansible-runner/actions/workflows/renovate.yml)
