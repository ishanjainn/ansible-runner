FROM python:3.9.4-slim

WORKDIR /ansible

COPY ./docker/requirements.txt requirements.txt

RUN pip install -r requirements.txt

ENTRYPOINT ["ansible-playbook"]
