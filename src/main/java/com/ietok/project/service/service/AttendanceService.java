package com.ietok.project.service.service;

import com.ietok.project.entity.Attendance;

import java.util.List;

public interface AttendanceService {
    boolean doAttendance(Attendance attendance);

    List<Attendance> getAttendance();
}
