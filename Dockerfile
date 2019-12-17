FROM python:3.6.8
WORKDIR /bookreviews
COPY ./bookreviews/requirements.txt .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["/usr/local/bin/gunicorn", "--workers=4", "--bind=0.0.0.0:8001", "application:app"]
COPY ./bookreviews/ .
