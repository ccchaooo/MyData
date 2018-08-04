# -*- coding: utf-8 -*-
from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy

import  os
#print os.environ.keys()
#print os.environ.get('FLASKR_SETTINGS')

#加载配置文件内容
# print "加载配置文件内容"
app = Flask(__name__)
app.config.from_object('blog2.setting')
app.config.from_envvar('FLASKR_SETTINGS')

#创建数据库对象
# print "创建数据库对象"
db = SQLAlchemy(app)

#只有在app对象之后声明，用于导入model否则无法创建表
# print "只有在app对象之后声明，用于导入model否则无法创建表"
from blog2.model.User import User
from blog2.model.Category import Category

#只有在app对象之后声明，用于导入view模块
# print "只有在app对象之后声明，用于导入view模块"
from blog2.controller import blog_manage

#登陆管理
# print "登陆管理"
login_manager = LoginManager()
login_manager.init_app(app)
# print login_manager
login_manager.login_view = "login"


@login_manager.user_loader
def load_user(userid):
    return User.query.get(int(userid))


