package com.dps.adapter.adapterdefault;

/**
 * @author dengchao
 * @date 2018/12/6 16:11
 * 由于鲁智深只实现了getName()和习武()方法，而没有实现任何其他的方法。
 * 因此，它根本就通不过Java语言编译器。鲁智深类只有实现和尚接口的所有的方法才可以通过Java语言编译器，但是这样一来鲁智深就不再是鲁智深了。以史为鉴，可以知天下。
 * 研究一下几百年前鲁智深是怎么剃度成和尚的，会对Java编程有很大的启发。不错，当初鲁达剃度，众僧说：“此人形容丑恶、相貌凶顽，不可剃度他"。
 * 但是长老却说：”此人上应天星、心地刚直。虽然时下凶顽，命中驳杂，久后却得清净。证果非凡，汝等皆不及他。”

 * 原来如此！看来只要这里也应上一个天星的话，问题就解决了！
 * 使用面向对象的语言来说，“应”者，实现也；“天星”者，抽象类也
 */
public abstract class 天星 implements 和尚 {
    @Override
    public void 吃斋(){}
    @Override
    public void 念经(){}
    @Override
    public void 打坐(){}
    @Override
    public void 撞钟(){}
    @Override
    public void 习武(){}
    @Override
    public String getName(){
        return null;
    }
}