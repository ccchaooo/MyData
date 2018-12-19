package com.dps.command;

/**
 * @author dengchao
 * @date 2018/12/19 14:20
 * 抽象命令角色
 */
public abstract class Command {
    /**
     * 每个命令类都必须有一个执行命令的方法
     */
    public abstract void execute();
}

