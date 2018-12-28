package com.clients;

import com.dps.mediator.ColleagueA;
import com.dps.mediator.ColleagueB;
import com.dps.mediator.ConcreteMediator;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class MediatorClient implements Client {

    public void clientInterface() {
        // 定义中介者
        ConcreteMediator mediator = new ConcreteMediator();
        // 定义具体同事类
        ColleagueA colleagueA = new ColleagueA("张三", mediator);
        ColleagueB colleagueB = new ColleagueB("李四", mediator);
        // 中介者知晓每一个具体的Colleague类
        mediator.setCollA(colleagueA);
        mediator.setCollB(colleagueB);
        colleagueA.contact("我是A，我要和同事B说说工作的事情");
        colleagueB.contact("我是B,我下午有时间,下午商量吧");
    }
}
