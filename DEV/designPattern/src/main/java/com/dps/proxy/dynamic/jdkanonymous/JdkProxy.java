package com.dps.proxy.dynamic.jdkanonymous;
import org.springframework.stereotype.Service;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * @author dengchao
 * @date 2018/11/29 14:10
 * 匿名内部类实现jdk动态代理 即使 统一接口 Subject 未被实现,也可以提前完成此类。
 *
 * JDK动态代理局限性:
 * 通过反射类Proxy和InvocationHandler回调接口实现的jdk动态代理，要求委托类必须实现一个接口。
 * 但事实上并不是所有类都有接口，对于没有实现接口的类，便无法使用该方方式实现动态代理。
 */
@Service
public class JdkProxy {
    private Subject proxy;

    private Subject target ;

    /**
     * @param subjectImpl
     * 此方法内部实现了jdk动态代理
     */
    public void setProxy(Subject subjectImpl) {
        target = subjectImpl;
        this.proxy = (Subject) Proxy.newProxyInstance(
                //获取类加载器
                target.getClass().getClassLoader(),
                //获取所有方法
                target.getClass().getInterfaces(),
                //匿名内部类
                new InvocationHandler() {
                    /**
                     * @param proxy  代理类
                     * @param method 每一个被代理的方法
                     * @param args 方法参数
                     * @return
                     * @throws Throwable
                     * 此invoke将会被循环调用,对每一个执行的方法进行代理
                     */
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        System.out.println("开始对 " + method.getName() + " 进行代理");
                        //执行目标对象方法
                        Object returnValue = method.invoke(target, args);

                        /*-- 此处可以对方法进行属性的修改 --*/

                        System.out.println("对 " + method.getName() + " 的代理已完成!");
                        return returnValue;
                    }
                });
    }

    public Subject getProxy() {
        return proxy;
    }
}
