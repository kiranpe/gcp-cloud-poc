FROM python:3.11-alpine

RUN pip install --upgrade pip

RUN apk add --update curl wget

RUN addgroup -S kiran && adduser -S kiran -G kiran

WORKDIR /app

RUN chown -R kiran:kiran /app

USER kiran

#RUN pip install django gunicorn martor
RUN pip install flask

COPY --chown=kiran:kiran webapp .

ENTRYPOINT [ "python", "-m", "flask", "run", "--host=0.0.0.0" ]

HEALTHCHECK none
