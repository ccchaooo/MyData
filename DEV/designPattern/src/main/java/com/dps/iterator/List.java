package com.dps.iterator;

/**
 * @author dengchao
 * @date 2018/12/14 09:53
 * 定义容器角色(Aggregate)
 */
public interface List {
    //定义集合可以进行的操作
    public void add(Object obj);
    public Object get(int index);
    public Iterator iterator();
    public int getSize();
}