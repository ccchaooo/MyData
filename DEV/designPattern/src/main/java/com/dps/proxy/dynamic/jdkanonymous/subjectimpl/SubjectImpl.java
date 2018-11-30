package com.dps.proxy.dynamic.jdkanonymous.subjectimpl;

import com.dps.proxy.dynamic.jdkanonymous.Subject;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 14:07
 * 目标对象(委托类)实现了某一接口
 */
@Service
public class SubjectImpl implements Subject {
    @Override
    public void sing() {
        System.out.println("执行委托类的sing方法");
    }

    @Override
    public void talk() {
        System.out.println("执行委托类的talk方法");
    }
}
