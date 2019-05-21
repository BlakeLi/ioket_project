package com.ietok.project.service.implz;

import com.ietok.project.dao.EmployeeDao;
import com.ietok.project.dao.PositionDao;
import com.ietok.project.entity.Employee;
import com.ietok.project.entity.Position;
import com.ietok.project.service.service.PositionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("positionService")
public class PositionServiceImplz implements PositionService {
    @Resource
    private PositionDao positionDao;
    @Resource
    private EmployeeDao employeeDao;

    @Override
    public boolean addPosition(Position position) {
        if(position!=null&&position.getPos_name()!=null&&position.getDep_id()!=null){
            if(positionDao.getPositionByNameAndDep(position)==null){
                return positionDao.addPosition(position);
            }
        }
        return false;
    }

    @Override
    public boolean delPosition(Integer pos_id) {
        if(pos_id!=null){
            Position position = new Position();
            position.setPos_id(pos_id);
            List<Employee> employees = employeeDao.getEmployeesByPosID(pos_id);
            if(employees.size()==0){
                return positionDao.delPosition(position);
            }
        }
        return false;
    }

    @Override
    public boolean delPositionByDep(Integer dep_id) {
        if(dep_id==null){
            return false;
        }
        Position position = new Position();
        position.setDep_id(dep_id);
        return positionDao.delPositionByDep(position);
    }

    @Override
    public boolean updatePosition(Position position) {
        if(position!=null&&position.getPos_id()!=null&&position.getDep_id()!=null&&position.getPos_name()!=null){
            return positionDao.updatePosition(position);
        }
        return false;
    }

    @Override
    public Position getPositionByID(Position position) {
        if(position==null||position.getPos_id()==null){
            return null;
        }
        return positionDao.getPositionByID(position);
    }

    @Override
    public List<Position> getPositionByDep(Position position) {
        if(position==null||position.getDep_id()==null){
            return null;
        }
        return positionDao.getPositionByDep(position);
    }

    @Override
    public List<Position> getAllPosition() {
        return positionDao.getAllPosition();
    }
}
