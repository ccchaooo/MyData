package com.dps.proxy.dynamic.jdk.jdkserviceimpl;

import com.dps.proxy.dynamic.jdk.JdkService;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/29 11:37
 */
@Service
public class UserServiceImpl implements JdkService {
    @Override
    public void add() {
        System.out.println("This is add service");
    }
}
