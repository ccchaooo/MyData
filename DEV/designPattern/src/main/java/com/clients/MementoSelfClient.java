package com.clients;

import com.dps.snapshot.historyonselfpattern.MementoIF;
import com.dps.snapshot.historyonselfpattern.Originator;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class MementoSelfClient implements Client {

    public void clientInterface() {
        Originator o = new Originator();
        //修改状态
        o.changeState("state 0");
        //创建备忘录
        MementoIF memento = o.createMemento();
        //修改状态
        o.changeState("state 1");
        //按照备忘录恢复对象的状态
        o.restoreMemento(memento);
    }
}
