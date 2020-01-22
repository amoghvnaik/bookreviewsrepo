import os, pymysql
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.ext.flask.middleware import XRayMiddleware


app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://"+os.getenv("MYSQL_USER")+":"+os.getenv("MYSQL_PASSWORD")+"@"+os.getenv("MYSQL_IP")+"/"+os.getenv("MYSQL_DB")
app.config["SECRET_KEY"] = os.getenv("MYSQL_KEY")
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)
login_manager.login_view = 'login'
xray_recorder.configure(service='myapp')
XRayMiddleware(app, xray_recorder)


from application import routes
