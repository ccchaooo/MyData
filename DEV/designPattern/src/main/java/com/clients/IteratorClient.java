package com.clients;

import com.dps.iterator.ConcreteAggregate;
import com.dps.iterator.Iterator;
import com.dps.iterator.List;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class IteratorClient implements Client {

    public void clientInterface() {
        List list=new ConcreteAggregate();
        list.add("a");
        list.add("b");
        list.add("c");
        list.add("d");
        Iterator it=list.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }
    }
}
