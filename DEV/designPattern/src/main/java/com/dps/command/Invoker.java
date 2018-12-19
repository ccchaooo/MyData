package com.dps.command;

/**
 * @author dengchao
 * @date 2018/12/19 14:24
 * 调用者 仅实现命令的传递
 */
public class Invoker {
    private Command command;

    /**
     * 接受命令
     * @param _command
     */
    public void setCommand(Command _command){
        this.command = _command;
    }

    /**
     *执行命令
     */
    public void action(){
        this.command.execute();
    }
}
