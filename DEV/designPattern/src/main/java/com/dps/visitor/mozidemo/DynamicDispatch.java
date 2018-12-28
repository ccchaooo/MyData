package com.dps.visitor.mozidemo;

import org.springframework.stereotype.Component;

/**
 * @author dengchao
 * @date 2018/12/28 17:08
 */
@Component
public class DynamicDispatch {
    /**
     * 运行测试
     */
    public void dosth(){
        System.out.println("DynamicDispatch: 方法的调用则是根据对象的真实类型");
        Horse h = new BlackHorse();
        h.eat();
        System.out.println("变量h的静态类型是Horse，而真实类型是BlackHorse。如果上面最后一行的eat()方法调用的是BlackHorse类的eat()方法，那么上面打印的就是“黑马吃草”；相反，如果上面的eat()方法调用的是Horse类的eat()方法，那么打印的就是“马吃草”。\n" +
                "\n" +
                "　　所以，问题的核心就是Java编译器在编译时期并不总是知道哪些代码会被执行，因为编译器仅仅知道对象的静态类型，而不知道对象的真实类型；而方法的调用则是根据对象的真实类型，而不是静态类型。这样一来，上面最后一行的eat()方法调用的是BlackHorse类的eat()方法，打印的是“黑马吃草”。");
    }
}
