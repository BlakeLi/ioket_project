package com.ietok.project.service.implz;

import com.ietok.project.dao.FifsDao;
import com.ietok.project.entity.Fifs;
import com.ietok.project.service.service.FifsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("fifsService")
public class FifsServiceImplz implements FifsService {
    @Resource
    private FifsDao fifsDao;
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

    //待定
    @Override
    public Fifs getFifs(Integer cv_id) {
            return null;
    }

    //待定
    @Override
    public List<Fifs> getFifss(Integer F_is_read) {
        return null;
    }
}
