package com.clients;

import com.dps.facad.Facade;
import com.dps.template.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 11:31
 * 模板方法模式客户端代码
 */
@Service
public class FacedClient implements Client{
    @Autowired
    Facade facade;

    public void clientInterface() {
        facade.test();
    }
}
