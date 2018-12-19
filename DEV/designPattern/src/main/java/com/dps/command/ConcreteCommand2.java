package com.dps.command;

/**
 * @author dengchao
 * @date 2018/12/19 14:21
 * 具体的命令ConcreteCommand2
 */
public class ConcreteCommand2 extends Command {
    /**
     * 对哪个Receiver类进行命令处理
     */
    private Receiver receiver;

    /**
     * 构造函数传递接收者
     * @param _receiver 接收者
     */
    public ConcreteCommand2(Receiver _receiver) {
        this.receiver = _receiver;
    }

    /**
     *必须实现一个命令
     */
    @Override
    public void execute() {
        //业务处理
        this.receiver.doSomething();
    }
}