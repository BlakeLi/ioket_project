package com.ietok.project.service.implz;

import com.ietok.project.dao.AttendanceDao;
import com.ietok.project.dao.RewardDao;
import com.ietok.project.entity.Attendance;
import com.ietok.project.entity.Reward;
import com.ietok.project.service.service.AttendanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

@Service("attendanceService")
public class AttendanceServiceImplz implements AttendanceService {
    @Resource
    private AttendanceDao attendanceDao;
    @Resource
    private RewardDao rewardDao;

    //入参E_ID
    @Override
    public boolean doAttendance(Attendance attendance) {
        Date date = new Date(System.currentTimeMillis());
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        Reward reward = new Reward();
        Attendance a1 = attendanceDao.getAttendanceByID(attendance);
        if(a1==null||a1.getE_id()==null){
            if(cal.get(Calendar.HOUR_OF_DAY)>=9&&cal.get(Calendar.HOUR_OF_DAY)<12){
                reward.setE_id(attendance.getE_id());
                reward.setR_reason("迟到");
                reward.setR_money(-100.00);
                if(rewardDao.addReward(reward)){
                    return attendanceDao.addAttendance(attendance);
                }
            }else if(cal.get(Calendar.HOUR_OF_DAY)>=12){
                reward.setE_id(attendance.getE_id());
                reward.setR_reason("旷工");
                reward.setR_money(-300.00);
                return rewardDao.addReward(reward);
            }
            return attendanceDao.addAttendance(attendance);
        }else{
            if(cal.get(Calendar.HOUR_OF_DAY)>=15&&cal.get(Calendar.HOUR_OF_DAY)<18){
                reward.setE_id(attendance.getE_id());
                reward.setR_reason("早退");
                reward.setR_money(-100.00);
                if(rewardDao.addReward(reward)){
                    return attendanceDao.updateAttendance(attendance);
                }
            }else if(cal.get(Calendar.HOUR_OF_DAY)<15){
                reward.setE_id(attendance.getE_id());
                reward.setR_reason("旷工");
                reward.setR_money(-300.00);
                if(rewardDao.addReward(reward)){
                    return attendanceDao.deleteAttendance(attendance);
                }
            }
            return attendanceDao.updateAttendance(attendance);
        }
    }


    @Override
    public List<Attendance> getAttendance() {
        return attendanceDao.getAttendance();
    }
}
