package com.ietok.project.service.implz;

import com.ietok.project.dao.RecruitDao;
import com.ietok.project.entity.Recruit;
import com.ietok.project.service.service.RecruitService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("recruitService")
public class RecruitServiceImplz implements RecruitService {
    @Resource
    private RecruitDao recruitDao;

    @Transactional

    @Override
    public List<Recruit> getPublishedRecruits() {
        return recruitDao.getPublishedRecruit();
    }
}
