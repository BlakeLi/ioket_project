package com.ietok.project.service.implz;

import com.ietok.project.dao.CvDao;
import com.ietok.project.dao.FifsDao;
import com.ietok.project.entity.Cv;
import com.ietok.project.entity.Fifs;
import com.ietok.project.service.service.CvService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("cvService")
public class CvServiceImplz implements CvService {
    @Resource
    private CvDao cvDao;
    @Resource
    private FifsDao fifsDao;

    @Override
    public boolean addCv(Cv cv) {
        if(cv == null){
            return false;
        }
        return cvDao.addCv(cv);
    }

    //判断简历是否已经投递，未投递的情况下可以删除
    @Override
    public boolean delCv(Integer cv_id) {
        if(cv_id != null){
            Fifs fifs = new Fifs();
            fifs.setCv_id(cv_id);
            List<Fifs> fifss = fifsDao.getFifssByCv_id(fifs);
            if(fifss.size()==0){
                Cv cv = new Cv();
                cv.setCv_id(cv_id);
                return cvDao.delCv(cv);
            }
        }
        return false;
    }

    @Override
    public boolean update(Cv cv) {
        if(cv == null){
            return false;
        }
        return cvDao.updateCv(cv);
    }

    @Override
    public Cv getCv(Integer cv_id) {
        if(cv_id==null){
            return null;
        }
        Cv cv = new Cv();
        cv.setCv_id(cv_id);
        return cvDao.getCv(cv);
    }

    @Override
    public List<Cv> getCvs(Integer c_id) {
        if(c_id==null){
            return null;
        }
        Cv cv = new Cv();
        cv.setC_id(c_id);
        return cvDao.getCvs(cv);
    }
}
