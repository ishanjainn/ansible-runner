FROM python:3.10.4-slim

WORKDIR /ansible

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

ENTRYPOINT ["ansible-playbook"]
