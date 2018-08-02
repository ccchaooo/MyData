# encoding: utf-8
from wsgiref.simple_server import make_server
from hello import application
httpd = make_server('', 8010, application)
print("8010 is on ")
httpd.serve_forever
