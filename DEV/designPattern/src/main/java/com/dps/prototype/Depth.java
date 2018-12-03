package com.dps.prototype;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dengchao
 * @date 2018/12/1 22:39
 * 如果要克隆就必须实现Cloneable接口
 */
public class Depth implements Cloneable{
    private String name;
    private String sex;
    private List<String> list;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public List<String> getList() {
        return list;
    }
    public void setList(List<String> list) {
        this.list = list;
    }
    //可能会抛出不支持克隆异常，原因是没有实现Cloneable接口
    @Override
    protected Depth clone(){
        try{
            Depth depth = (Depth) super.clone();
            //本体的引用类型应该复制一份给克隆体,而不仅仅是复制引用。
            //本体和克隆体的list对象相互独立。
            depth.setList(new ArrayList<String>(this.list));
            return depth;
        }catch(CloneNotSupportedException e){
            e.printStackTrace();
            return null;
        }
    }
}