package com.ietok.project.service.implz;

import com.ietok.project.dao.AttendanceDao;
import com.ietok.project.dao.RewardDao;
import com.ietok.project.entity.Attendance;
import com.ietok.project.entity.Reward;
import com.ietok.project.service.service.AttendanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service("attendanceService")
public class AttendanceServiceImplz implements AttendanceService {
    @Resource
    private AttendanceDao attendanceDao;
    @Resource
    private RewardDao rewardDao;

    @Override
    public Attendance getAttendanceByDateAndEmployee(Integer e_id) {
        Attendance attendance = new Attendance();
        attendance.setE_id(e_id);
        return attendanceDao.getAttendanceByDateAndEmployee(attendance);
    }

    @Override
    public boolean AutoAddAttendanceAM(Attendance attendance) {
        return attendanceDao.AutoAddAttendanceAM(attendance);
    }

    @Override
    public boolean updateAttendanceAM(Attendance attendance) {
        if(attendance.getE_id()==null||attendance.getAtd_start_info()==null){
            return false;
        }
        return attendanceDao.updateAttendanceAM(attendance);
    }

    @Override
    public boolean AutoAddAttendanceMiss(Attendance attendance) {
        if(attendance.getE_id()==null||attendance.getAtd_end_info()==null||attendance.getAtd_start_info()==null||attendance.getAtd_state()==null){
            return false;
        }
        return attendanceDao.AutoAddAttendanceMiss(attendance);
    }

    @Override
    public boolean updateAttendancePM(Attendance attendance) {
        if(attendance.getE_id()==null||attendance.getAtd_end_info()==null){
            return false;
        }
        return attendanceDao.updateAttendancePM(attendance);
    }

    @Override
    public boolean addAttendance(Integer e_id) {
        if(e_id==null){
            return false;
        }
        Attendance attendance = new Attendance();
        attendance.setE_id(e_id);
        return attendanceDao.addAttendance(attendance);
    }

    @Override
    public boolean updateAttendanceA(Attendance attendance) {
        if(attendance.getAtd_id()==null){
            return false;
        }
        return attendanceDao.updateAttendanceA(attendance);
    }

    @Override
    public boolean updateAttendanceP(Attendance attendance) {
        if(attendance.getAtd_id()==null){
            return false;
        }
        return attendanceDao.updateAttendanceP(attendance);
    }
}
