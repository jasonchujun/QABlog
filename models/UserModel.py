from exts import db
from werkzeug.security import generate_password_hash, check_password_hash


class User(db.Model):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    telephone = db.Column(db.String(11), nullable=False, unique=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    password = db.Column(db.String(100), nullable=False)
    level = db.Column(db.Integer, nullable=False, default=1)

    def __init__(self, **kwargs):
        telephone = kwargs.get("telephone")
        username = kwargs.get("username")
        password = kwargs.get("password")
        level = kwargs.get("level")
        self.telephone = telephone
        self.username = username
        self.level = level
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)
