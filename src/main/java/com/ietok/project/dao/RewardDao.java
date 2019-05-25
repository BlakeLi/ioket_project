package com.ietok.project.dao;

import com.ietok.project.entity.Reward;

import java.util.List;

public interface RewardDao {
    boolean addReward(Reward reward);
    boolean updateReward(Reward reward);

    Reward getRewardById(Reward reward);
    List<Reward> getRewards();
    List<Reward> getRewardsByE_id(Reward reward);
    List<Reward> getRewardsByDateAndE_id(Reward reward);

    List<Reward> getRewardsByDAndID(Reward reward);
}
