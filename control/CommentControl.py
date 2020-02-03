from models.CommentModel import Comment
from flask import session
from exts import db


class Comment_Control:
    @staticmethod
    def get_comment(request, question_id):
        content = request.form.get("comment")
        if content:
            user_id = session.get("user_id")
            com = Comment(content=content, question_id=question_id, author_id=user_id)
            try:
                db.session.add(com)
                db.session.commit()
                return "ok"
            except Exception as e:
                print(e)
                db.session.rollback()
                return "fall"
        else:
            return "mn"
