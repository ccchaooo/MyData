package com.clients;

import com.dps.chainofresponsibility.*;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/11/30 15:14
 */
@Service
public class ChainosClient implements Client {

    public void clientInterface() {
        Request request = new Request(40, "请假休息");
        Handler boos = new Boss(null);
        Handler topManager = new TopManager(boos);
        Handler manager = new Manager(topManager);
        manager.handleRequest(request);
    }
}
