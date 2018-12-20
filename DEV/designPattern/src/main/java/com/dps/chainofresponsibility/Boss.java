package com.dps.chainofresponsibility;

/**
 * 老板
 * @author dengchao
 * @date 2018/12/20 11:29
 */
public class Boss extends Handler {

    public Boss(Handler handler) {
        super(handler);
    }

    @Override
    public void handleRequest(Request request) {
        System.out.println("BOSS 批准你去休息。小心点吧！");
    }

}