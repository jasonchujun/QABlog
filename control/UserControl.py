from models.UserModel import User
from flask import session
from exts import db


class User_Control:
    @staticmethod
    def do_login(request):
        tel = request.form.get("telephone")
        pwd = request.form.get("password")
        user = User.query.filter_by(telephone=tel).first()
        if user and user.check_password(pwd) and (user.level == 1):
            session["user_id"] = user.id
            session.permanent = True
            return "user"
        elif user and user.check_password(pwd) and (user.level == 0):
            session["user_id"] = user.id
            session.permanent = True
            return "admin"
        else:
            return False

    @staticmethod
    def do_regis(request):
        tel = request.form.get("telephone")
        un = request.form.get("username")
        pwd1 = request.form.get("password1")
        pwd2 = request.form.get("password2")
        if tel and un and pwd1 and pwd2:
            if User.query.filter_by(telephone=tel).first():
                return "exit"
            else:
                if pwd1 == pwd2:
                    user = User(telephone=tel, username=un, password=pwd1)
                    try:
                        db.session.add(user)
                        db.session.commit()
                        return "ok"
                    except Exception as e:
                        print(e)
                        db.session.rollback()
                        return "fall"
                else:
                    return "ns"
        else:
            return "nf"
