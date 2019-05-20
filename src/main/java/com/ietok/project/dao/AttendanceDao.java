package com.ietok.project.dao;

import com.ietok.project.entity.Attendance;

import java.util.List;

public interface AttendanceDao {
    boolean addAttendance(Attendance attendance);
    boolean updateAttendance(Attendance attendance);
    boolean deleteAttendance(Attendance attendance);

    Attendance getAttendanceByID(Attendance attendance);
    List<Integer> getAttendanceByE_idAndDate(Attendance attendance);
    List<Attendance> getAttendance();
}
