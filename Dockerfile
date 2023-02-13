FROM python:3.12.0a5-alpine

RUN mkdir /code

WORKDIR /code

COPY . /code

RUN pip install -r requirements.txt

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["sh", "entrypoint.sh"]

