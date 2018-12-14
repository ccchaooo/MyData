package com.dps.iterator;

/**
 * @author dengchao
 * @date 2018/12/14 09:51
 * 定义具体迭代器角色
 */

public class ConcreteIterator implements Iterator {
    private List list = null;
    private int index;

    public ConcreteIterator(List list) {
        super();
        this.list = list;
    }

    @Override
    public boolean hasNext() {
        if (index >= list.getSize()) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public Object next() {
        Object object = list.get(index);
        index++;
        return object;
    }

}