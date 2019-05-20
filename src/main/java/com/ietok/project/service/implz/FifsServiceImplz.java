package com.ietok.project.service.implz;

import com.ietok.project.dao.CvDao;
import com.ietok.project.dao.FifsDao;
import com.ietok.project.entity.Cv;
import com.ietok.project.entity.Fifs;
import com.ietok.project.service.service.FifsService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("fifsService")
public class FifsServiceImplz implements FifsService {

    @Resource
    private FifsDao fifsDao;
    @Resource
    private CvDao cvDao;

    @Override
    public boolean addFifs(Fifs fifs) {
        if(fifs==null){
            return false;
        }
        return fifsDao.addFifs(fifs);
    }

    @Override
    public boolean updateFifs(Fifs fifs) {
        if(fifs==null){
            return false;
        }
        return fifsDao.updateFifs(fifs);
    }

    @Override
    public boolean delFifs(Fifs fifs) {
        if(fifs==null){
            return false;
        }
        return fifsDao.delFifs(fifs);
    }

    @Override
    public Fifs getFifsByID(Integer f_id) {
        if(f_id==null){
            return null;
        }
        Fifs fifs = new Fifs();
        fifs.setF_id(f_id);
        return fifsDao.getFifs(fifs);
    }

    //通过c_id找出所有cv，通过cv_id找出所有fifs整合并输出
    @Override
    public List<Fifs> getFifsByC_id(Integer c_id) {
        if(c_id==null){
            return null;
        }
        Cv cv = new Cv();
        cv.setC_id(c_id);
        List<Fifs> fifss = new ArrayList<>();
        List<Cv> cvs = cvDao.getCvs(cv);
        for (Cv cv1 : cvs) {
            Fifs fifs = new Fifs();
            fifs.setCv_id(cv1.getCv_id());
            fifss.addAll(fifsDao.getFifssByCv_id(fifs));
        }
        System.out.println(fifss);
        return fifss;
    }
}
