package com.dps.chainofresponsibility;

/**
 * 经理
 * @author dengchao
 * @date 2018/12/20 11:26
 */
public class Manager extends Handler{

    public Manager(Handler handler) {
        super(handler);
    }

    @Override
    public void handleRequest(Request request) {
        if (request.getBreakDay() < 10) {
            System.out.println("经理批准你去休息了");
        } else {
            System.out.println("经理无权处理");
            super.getHandler().handleRequest(request);
        }
    }

}