package com.clients;

import com.dps.state.simple.*;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 11:31
 * 模板方法模式客户端代码
 */
@Service
public class StateSimpleClient implements Client{

    public void clientInterface() {
        //创建状态
        State state = new ConcreteStateB();
        //创建环境
        Context context = new Context();
        //将状态设置到环境中
        context.setState(state);
        //请求
        context.request("test");    }
}
