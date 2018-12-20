package com.dps.chainofresponsibility;

/**
 * 总经理
 * @author dengchao
 * @date 2018/12/20 11:28
 */
public class TopManager extends Handler {

    public TopManager(Handler handler) {
        super(handler);
    }

    @Override
    public void handleRequest(Request request) {
        if (request.getBreakDay() < 20) {
            System.out.println("总经理批准你去休息");
        } else {
            System.out.println("总经理无权处理");
            super.getHandler().handleRequest(request);
        }
    }

}