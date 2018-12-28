package com.dps.mediator;

/**
 * @author dengchao
 * @date 2018/12/27 11:47
 * 具体同事类A继承自Colleague,此刻就可以与中介者mediator进行通信了
 */
public class ColleagueA extends Colleague {

    public ColleagueA(String name, Mediator mediator) {
        super(name, mediator);
    }
    public void getMessage(String message){
        System.out.println("同事A"+name+"获得信息"+message);
    }

    /**
     * 同事A与中介者通信
     * @param message
     */
    public void contact(String message){
        mediator.contact(message, this);
    }
}
