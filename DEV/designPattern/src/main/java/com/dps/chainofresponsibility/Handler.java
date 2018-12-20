package com.dps.chainofresponsibility;

/**
 * 抽象父类
 * @author dengchao
 * @date 2018/12/20 11:25
 */
public abstract class Handler {

    private Handler handler;

    public Handler(Handler handler) {
        super();
        this.handler = handler;
    }

    public abstract void handleRequest(Request request);

    public Handler getHandler() {
        return handler;
    }

    public void setHandler(Handler handler) {
        this.handler = handler;
    }
}