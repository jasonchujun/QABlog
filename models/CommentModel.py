from exts import db
from datetime import datetime


class Comment(db.Model):
    __tablename__ = "comment"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    content = db.Column(db.Text, nullable=False)
    comment_time = db.Column(db.DateTime, default=datetime.now, nullable=False)
    question_id = db.Column(db.Integer, db.ForeignKey("question.id"))
    author_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    question = db.relationship("Question", backref="comment")
    author = db.relationship("User", backref="comment")
