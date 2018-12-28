package com.clients;

import com.dps.bridge.messagedemo.*;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class BridgeClient implements Client {

    public void clientInterface() {
        //创建具体的实现对象
        MessageImplementor impl = new MessageSMS();
        //创建普通消息对象
        AbstractMessage message = new CommonMessage(impl);
        message.sendMessage("加班申请速批","李总");

        //将实现方式切换成邮件，再次发送
        impl = new MessageEmail();
        //创建加急消息对象
        message = new UrgencyMessage(impl);
        message.sendMessage("加班申请速批","李总");
    }
}
