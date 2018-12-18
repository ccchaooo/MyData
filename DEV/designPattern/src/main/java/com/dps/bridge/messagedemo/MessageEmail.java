package com.dps.bridge.messagedemo;

/**
 * @author dengchao
 * @date 2018/12/18 14:50
 * 邮件短消息的实现类
 */
public class MessageEmail implements MessageImplementor {

    @Override
    public void send(String message, String toUser) {
        System.out.println("使用邮件短消息的方法，发送消息'"+message+"'给"+toUser);
    }

}