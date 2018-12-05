package com.clients;

import com.dps.factory.abfactory.FactoryProducer;
import com.dps.factory.abfactory.PcFactory;
import com.dps.factory.abfactory.factory.DellFactory;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class FactoryAbClient implements Client {


    public String clientInterface(String type) {
        PcFactory pcf = (PcFactory) FactoryProducer.getFactory(type);
        return pcf.createKeboy().sayHi() + "--" + pcf.createMouse().sayHi()+ " 参数需求{type = DELL OR HP}";
    }
}
