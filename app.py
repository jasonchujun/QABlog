from flask import Flask, render_template, request, flash, redirect, url_for, session, g
from models.QuestionModel import Question
from models.UserModel import User
from decorators import login_required
from control.CommentControl import Comment_Control
from control.UserControl import User_Control
from control.QuestionControl import Question_Control
from control.AdminControl import Admin_Control
from exts import db
import pymysql

pymysql.install_as_MySQLdb()
app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:123456@127.0.0.1/QABlog"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.secret_key = "jason flask"

db.init_app(app)


@app.route('/')
def index():
    context = Question.query.order_by(db.desc("create_time")).paginate(page=1, per_page=7).items
    return render_template("index.html", context=context)


@app.route("/admin")
def admin():
    questions = Admin_Control.get_com_info()
    return render_template("admin.html", questions=questions)


@app.route("/delete/<que_id>")
def admin_del(que_id):
    res = Admin_Control.del_question(que_id)
    if res == "ok":
        return redirect(url_for("admin"))
    else:
        flash("删除失败")
    return redirect(url_for("admin"))


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "GET":
        return render_template("login.html")
    else:
        res = User_Control.do_login(request)
        if res == "user":
            return redirect(url_for("index"))
        elif res == "admin":
            return redirect(url_for("admin"))
        else:
            flash("账号密码不符")
    return render_template("login.html")


@app.route("/regist", methods=["GET", "POST"])
def regist():
    if request.method == "GET":
        return render_template("regist.html")
    else:
        res = User_Control.do_regis(request)
        if res == "exit":
            flash("电话已存在！")
        elif res == "ok":
            return redirect(url_for("login"))
        elif res == "fall":
            flash("注册失败")
        elif res == "ns":
            flash("两次密码输入不同!")
        else:
            flash("信息不完整")
    return render_template("regist.html")


@app.route("/search")
def search():
    res = Question_Control.search(request)
    if res != "nf":
        return render_template("index.html", context=res)
    else:
        flash("没有找到相关内容")
    return render_template("index.html")


@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("login"))


@app.route("/detail/<ques_id>")
def detail(ques_id):
    que, count, coms = Question_Control.get_detail(ques_id)
    return render_template("detail.html", question=que, count=count, comments=coms)


@app.route("/comment/<question_id>", methods=["POST"])
@login_required
def comment(question_id):
    res = Comment_Control.get_comment(request, question_id)
    if res == "ok":
        return redirect(url_for("detail", ques_id=question_id))
    elif res == "fall":
        flash("添加评论失败")
    else:
        flash("评论内容不能为空")
    return redirect(url_for("detail", ques_id=question_id))


@app.route("/ques", methods=["GET", "POST"])
@login_required
def question():
    if request.method == "GET":
        return render_template("ques.html")
    else:
        res = Question_Control.add_question(request)
        if res == "ok":
            return redirect(url_for("index"))
        else:
            flash("问题发表失败")
    return render_template("ques.html")


@app.before_request
def my_before_request():
    user_id = session.get("user_id")
    if user_id:
        user = User.query.filter_by(id=user_id).first()
        if user:
            g.user = user


@app.context_processor
def my_context_processor():
    if hasattr(g, "user"):
        return {"user": g.user}
    return {}


if __name__ == '__main__':
    app.run()
