package com.dps.mediator;

/**
 * @author dengchao
 * @date 2018/12/27 11:48
 * 具体同事类B继承自Colleague,此刻就可以与中介者mediator进行通信了
 */
public class ColleagueB extends Colleague {

    public ColleagueB(String name, Mediator mediator) {
        super(name, mediator);
    }
    public void getMessage(String message){
        System.out.println("同事B"+name+"获得信息:"+message);
    }

    /**
     * 同事B与中介者通信
     * @param message
     */
    public void contact(String message){
        mediator.contact(message, this);
    }
}