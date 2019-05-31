package com.ietok.project.service.service;

import com.ietok.project.entity.Attendance;

import java.util.Date;
import java.util.List;

public interface AttendanceService {
    Attendance getAttendanceByDateAndEmployee(Integer e_id);

    boolean AutoAddAttendanceAM(Attendance attendance);
    //系统打卡
    boolean updateAttendanceAM(Attendance attendance);

    boolean AutoAddAttendanceMiss(Attendance attendance);

    boolean updateAttendancePM(Attendance attendance);

    boolean addAttendance(Integer e_id);
    //员工打卡
    boolean updateAttendanceA(Attendance attendance);
    //员工晚班打卡
    boolean updateAttendanceP(Attendance attendance);

    List<Attendance> getAttendanceByEmployee(Integer e_id);

    List<Attendance> getAttendanceByMonthAndEmployee(Integer e_id, Integer months);

    List<Attendance> getAttendanceByMonth(Integer months);
}
