
FROM python:3.7.9

RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/requirements.txt
RUN pip install -r requirements.txt
COPY . /code/

ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd         

ENV ENVIRONMENT="production"
ENV PYTHONPATH="/code"
ENV DATABASE_URL="postgresql://postgres:postgres@tododb:5432/postgres"

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh

EXPOSE 8000 2222
ENTRYPOINT ["init.sh"]