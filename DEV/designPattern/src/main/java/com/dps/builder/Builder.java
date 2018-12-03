package com.dps.builder;

/**
 * @author dengchao
 * @date 2018/12/3 15:33
 * 建造者类的接口
 */
public interface Builder {
    void buildPart1();
    void buildPart2();
    Product retrieveResult();
}
