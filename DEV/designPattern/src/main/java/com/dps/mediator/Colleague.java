package com.dps.mediator;

/**
 * @author dengchao
 * @date 2018/12/27 11:47
 */
public class Colleague {
    protected String name;
    protected Mediator mediator;

    public Colleague(String name, Mediator mediator) {
        this.name = name;
        this.mediator = mediator;
    }
}