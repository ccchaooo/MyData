package com.dps.chainofresponsibility;

/**
 * 请求
 * @author dengchao
 * @date 2018/12/20 11:22
 */
public class Request {

    private int breakDay;

    private String requestName;

    public Request(int breakDay, String requestName) {
        super();
        this.breakDay = breakDay;
        this.requestName = requestName;
    }

    public int getBreakDay() {
        return breakDay;
    }

    public void setBreakDay(int breakDay) {
        this.breakDay = breakDay;
    }

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }
}