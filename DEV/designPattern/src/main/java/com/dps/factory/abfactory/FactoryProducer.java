package com.dps.factory.abfactory;

import com.dps.factory.abfactory.factory.DellFactory;
import com.dps.factory.abfactory.factory.HpFactory;

/**
 * @author dengchao
 * @date 2018/12/5 14:38
 */
public class FactoryProducer {
    public static PcFactory getFactory(String choice){
        if(choice.equalsIgnoreCase("DELL")){
            return new DellFactory();
        } else if(choice.equalsIgnoreCase("HP")){
            return new HpFactory();
        }
        return null;
    }
}
