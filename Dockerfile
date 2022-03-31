FROM python:3.9-alpine

RUN mkdir /code

WORKDIR /code

COPY . /code

RUN pip install -r requirements.txt

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["sh", "entrypoint.sh"]

