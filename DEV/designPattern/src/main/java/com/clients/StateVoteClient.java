package com.clients;

import com.dps.state.votedemo.VoteManager;
import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/3 11:31
 * 模板方法模式客户端代码
 */
@Service
public class StateVoteClient implements Client{

    public void clientInterface() {
        VoteManager vm = new VoteManager();
        for (int i = 0; i < 9; i++) {
            vm.vote("u1", "A");
        }
    }
}
