FROM python:3.6.8
WORKDIR /app
COPY ./bookreviews/requirements.txt ./bookreviews/
RUN pip3 install -r ./bookreviews/requirements.txt
ENTRYPOINT ["/usr/local/bin/gunicorn", "--workers=4", "--bind=0.0.0.0:8001", "--chdir=bookreviews", "application:app"]
COPY . .
