from models.QuestionModel import Question
from models.CommentModel import Comment
from sqlalchemy import or_
from exts import db
from flask import session


class Question_Control:
    @staticmethod
    def search(request):
        search_str = request.args.get("q")
        if search_str:
            questions = Question.query.filter(or_(Question.content.contains(search_str),
                                                  Question.title.contains(search_str))).order_by(
                db.desc("create_time")).all()
            if questions:
                return questions
        return "nf"

    @staticmethod
    def get_detail(ques_id):
        question = Question.query.filter_by(id=ques_id).first()
        count = Comment.query.filter_by(question_id=ques_id).count()
        coms = Comment.query.order_by(db.desc("comment_time")).filter_by(question_id=ques_id).all()
        return question, count, coms

    @staticmethod
    def add_question(request):
        title = request.form.get("title").strip()
        content = request.form.get("content").strip()
        print(title)
        print(content)
        ques = Question(title=title, content=content, author_id=session.get("user_id"))
        try:
            db.session.add(ques)
            db.session.commit()
            return "ok"
        except Exception as e:
            print(e)
            db.session.rollback()
            return "fall"
