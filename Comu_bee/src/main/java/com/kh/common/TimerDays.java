package com.kh.common;

import java.util.Timer;
import java.util.TimerTask;

import com.kh.user.model.dao.AdminDao;
import com.kh.user.model.service.AdminService;

public class TimerDays {

	public static void Timer3days(String userIdval) {
		Timer t_3day = new Timer();
		
		TimerTask t_3dayTask = new TimerTask() {
		
			@Override
			public void run() {
				
				int result = AdminService.unSuspend(userIdval);
				if(result>0) {
					System.out.println("타이머 확인 5초");
					
				}else {
					System.out.println("타이머 미작동");
				}
				
			}
		};
		
		t_3day.schedule(t_3dayTask, 5000);
		
	}
	
	
	
}
