package com.ietok.project.service.implz;

import com.ietok.project.dao.DepartmentDao;
import com.ietok.project.dao.EmployeeDao;
import com.ietok.project.dao.PositionDao;
import com.ietok.project.entity.Department;
import com.ietok.project.entity.Position;
import com.ietok.project.service.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("departmentService")
public class DepartmentServiceImplz implements DepartmentService {

    @Resource
    private DepartmentDao departmentDao;
    @Resource
    private PositionDao positionDao;
    @Resource
    private EmployeeDao employeeDao;

    @Override
    public boolean addDep(Department department) {
        if(department==null||department.getDep_name()==null){
            return false;
        }
        return departmentDao.addDep(department);
    }

    @Override
    public boolean delDep(Department department) {
        if(department!=null&&department.getDep_id()!=null){
            Position position = new Position();
            position.setDep_id(department.getDep_id());
            List<Position> positions = positionDao.getPositionByDep(position);
            if(positions.size()!=0){
                boolean flag = false;
                for (Position pos : positions) {
                    //如果没有员工在这个部门则返回true
                    if(employeeDao.getEmployeesByPosID(pos.getPos_id()).size()==0){
                        flag = true;
                    }
                }
                if(flag){
                    for (Position pos2 : positions) {
                        //如果职位删除未成功返回false
                        if(!positionDao.delPosition(pos2)){
                            flag = false;
                        }
                    }
                    if(flag){
                        return departmentDao.delDep(department);
                    }
                }
            }
        }
        return false;
    }

    @Override
    public boolean updateDep(Department department) {
        if(department==null||department.getDep_id()==null||department.getDep_name()==null){
            return false;
        }
        return departmentDao.updateDep(department);
    }

    @Override
    public List<Department> getDepartments() {
        return departmentDao.getDepartments();
    }
}
