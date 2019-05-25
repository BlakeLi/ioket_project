package com.ietok.project.service.implz;

import com.ietok.project.dao.RewardDao;
import com.ietok.project.entity.Reward;
import com.ietok.project.service.service.RewardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("rewardService")
public class RewardServiceImplz implements RewardService {
    @Resource
    private RewardDao rewardDao;

    @Override
    public boolean addReward(Reward reward) {
        if(reward!=null&&reward.getE_id()!=null){
            return rewardDao.addReward(reward);
        }
        return false;
    }

    @Override
    public boolean updateReward(Reward reward) {
        if(reward!=null&&reward.getR_id()!=null){
            return rewardDao.updateReward(reward);
        }
        return false;
    }

    @Override
    public Reward getRewardById(Reward reward) {
        if(reward!=null&&reward.getR_id()!=null){
            return rewardDao.getRewardById(reward);
        }
        return null;
    }

    @Override
    public List<Reward> getRewards() {
        return rewardDao.getRewards();
    }

    @Override
    public List<Reward> getRewardsByE_id(Reward reward) {
        if(reward!=null&&reward.getE_id()!=null){
            return rewardDao.getRewardsByE_id(reward);
        }
        return null;
    }

    @Override
    public List<Reward> getRewardsByDateAndE_id(Reward reward) {
        if(reward!=null&&reward.getE_id()!=null){
            return rewardDao.getRewardsByDateAndE_id(reward);
        }
        return null;
    }

    @Override
    public List<Reward> getRewardsByDAndId(Integer e_id) {
        if(e_id==null){
            return null;
        }
        Reward reward = new Reward();
        reward.setE_id(e_id);
        return rewardDao.getRewardsByDAndID(reward);
    }
}
