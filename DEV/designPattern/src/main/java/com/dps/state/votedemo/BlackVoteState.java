package com.dps.state.votedemo;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/5 16:58
 */
public class BlackVoteState implements VoteState {
    @Override
    public void vote(String user, String voteItem, VoteManager voteManager) {
        //记录黑名单中，禁止登录系统
        System.out.println("进入黑名单，将禁止登录和使用本系统");
    }
}
