package com.dps.prototype;

/**
 * @author dengchao
 * @date 2018/12/1 22:39
 * 如果要克隆就必须实现Cloneable接口
 */
public class Demo implements Cloneable{
    //可能会抛出不支持克隆异常，原因是没有实现Cloneable接口
    @Override
    protected Demo clone(){
        try{
            return (Demo) super.clone();
        }catch(CloneNotSupportedException e){
            e.printStackTrace();
            return null;
        }
    }
}
