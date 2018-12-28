package com.clients;

import com.dps.visitor.mozidemo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class VisiterMoziClient implements Client {
    @Autowired
    DynamicDispatch dynamicDispatch;
    @Autowired
    StaticDispatch staticDispatch;

    public void clientInterface() {
        staticDispatch.dosth();
        dynamicDispatch.dosth();
    }
}
