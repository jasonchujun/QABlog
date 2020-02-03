from models.QuestionModel import Question
from models.CommentModel import Comment
from exts import db
from sqlalchemy import func


class Admin_Control:
    @staticmethod
    def get_com_info():
        questions = Question.query.order_by(db.desc("create_time")).all()
        count = db.session.query(Comment.question_id, func.count(Comment.question_id)).select_from(Comment).group_by(
            Comment.question_id).all()
        print(count)
        for item in questions:
            for n in count:
                if item.id == n[0]:
                    item.count = n[1]
        return questions

    @staticmethod
    def del_question(que_id):
        try:
            que = Question.query.filter_by(id=que_id).first()
            db.session.delete(que)
            db.session.commit()
            return "ok"
        except Exception as e:
            print(e)
            db.rollback()
            return "fall"
