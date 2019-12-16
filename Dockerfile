FROM python:3.6.8
WORKDIR /app
COPY ./bookreviews/requirements.txt .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["/usr/local/bin/python", "./bookreviews/app.py"]
COPY . .
