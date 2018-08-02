# encoding: utf-8
def application(environ, start_response):
  start_response('200 OK', [('Content-Type', 'text/html')])
  return [b'<h1>Hello, web!</h1>']
# WSGI接口定义非常简单，它只要求Web开发者实现一个函数，就可以响应HTTP请求。
# environ：一个包含所有HTTP请求信息的dict对象；
# start_response：一个发送HTTP响应的函数。
