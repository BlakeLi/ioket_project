package com.ietok.project.service.service;

import com.ietok.project.entity.Reward;

import java.util.List;

public interface RewardService {
    boolean addReward(Reward reward);
    boolean updateReward(Reward reward);

    Reward getRewardById(Reward reward);
    List<Reward> getRewards();
    List<Reward> getRewardsByE_id(Reward reward);
    List<Reward> getRewardsByDateAndE_id(Reward reward);
}
