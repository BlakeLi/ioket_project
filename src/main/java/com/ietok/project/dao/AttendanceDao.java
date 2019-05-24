package com.ietok.project.dao;

import com.ietok.project.entity.Attendance;

import java.util.Date;
import java.util.List;

public interface AttendanceDao {
    Attendance getAttendanceByDateAndEmployee(Attendance attendance);

    boolean AutoAddAttendanceAM(Attendance attendance);

    boolean updateAttendanceAM(Attendance attendance);

    boolean AutoAddAttendanceMiss(Attendance attendance);

    boolean updateAttendancePM(Attendance attendance);

    List<Attendance> getAttendanceByE_idAndDate(Attendance attendance);

    boolean addAttendance(Attendance attendance);

    boolean updateAttendanceA(Attendance attendance);

    boolean updateAttendanceP(Attendance attendance);
}
