package com.ietok.project.service.implz;

import com.ietok.project.dao.FifsDao;
import com.ietok.project.dao.RecruitDao;
import com.ietok.project.entity.Fifs;
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
    @Resource
    private FifsDao fifsDao;

    @Override
    public boolean addRecruit(Recruit recruit) {
        //判断职位ID，简历标题，简历内容，薪资，面试人员ID，面试地址
        if(recruit!=null&&recruit.getPos_id()!=null&&recruit.getRct_introduction()!=null&&recruit.getRct_title()!=null&&recruit.getRct_salary()!=null&&recruit.getRct_address()!=null&&recruit.getE_id()!=null){
            return recruitDao.addRecruit(recruit);
        }
        return false;
    }

    @Override
    public boolean updateRecruit(Recruit recruit) {
        if(recruit!=null&&recruit.getRct_id()!=null&&recruit.getRct_is_draft()!=null){
            if(recruit.getRct_is_draft()==1){
                return recruitDao.updateRecruit(recruit);
            }else{
                Recruit rct = recruitDao.getRecruitByID(recruit);
                if(rct!=null&&rct.getRct_is_draft()!=null){
                    rct.setRct_is_draft(1);
                    return recruitDao.updateRecruit(rct);
                }
            }
        }
        return false;
    }

    @Override
    public boolean deleteRecruit(Recruit recruit) {
        if(recruit!=null&&recruit.getRct_id()!=null){
            Recruit rct = recruitDao.getRecruitByID(recruit);
            if(rct!=null&&rct.getRct_is_draft()==1&&rct.getRct_id()!=null){
                Fifs fifs = new Fifs();
                fifs.setRct_id(rct.getRct_id());
                List<Fifs> fifss = fifsDao.getFifssByRCT_id(fifs);
                if(fifss.size()==0){
                    return recruitDao.deleteRecruit(recruit);
                }
            }
        }
        return false;
    }

    //未修改
    @Override
    public Recruit getRecruitByID(Recruit recruit) {
        if(recruit!=null&&recruit.getRct_id()!=null){
            return recruitDao.getRecruitByID(recruit);
        }
        return null;
    }

    @Override
    public List<Recruit> getPublishedRecruits() {
        return recruitDao.getPublishedRecruit();
    }

    @Override
    public List<Recruit> getUnpublishedRecruits() {
        return recruitDao.getUnpublishedRecruit();
    }
}
