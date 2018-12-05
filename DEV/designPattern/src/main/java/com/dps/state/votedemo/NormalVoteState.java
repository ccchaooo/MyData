package com.dps.state.votedemo;

import org.springframework.stereotype.Service;

/**
 * @author dengchao
 * @date 2018/12/5 16:57
 */
public class NormalVoteState implements VoteState {
    @Override
    public void vote(String user, String voteItem, VoteManager voteManager) {
        //正常投票，记录到投票记录中
        voteManager.getMapVote().put(user, voteItem);
        System.out.println("恭喜投票成功");
    }
}
