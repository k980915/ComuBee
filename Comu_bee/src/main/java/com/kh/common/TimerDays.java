package com.kh.common;

import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.kh.user.model.dao.AdminDao;
import com.kh.user.model.service.AdminService;

public class TimerDays {

	public static void Timer3days(String userIdval) {
		ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
		executor.schedule(() -> {
			int result = new AdminService().unSuspend(userIdval);
			if (result > 0) {
				System.out.println("타이머 확인 3day 10초");
			} else {
				System.out.println("타이머 3day 미작동");
			}
			executor.shutdown();
		}, 10, TimeUnit.SECONDS);
	}

	public static void Timer10days(String userIdval) {
		ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
		executor.schedule(() -> {
			int result = new AdminService().unSuspend(userIdval);
			if (result > 0) {
				System.out.println("타이머 확인 10day 20초");
			} else {
				System.out.println("타이머 10day 미작동");
			}
			executor.shutdown();
		}, 20, TimeUnit.SECONDS);

	}

	public static void Timer30days(String userIdval) {
		ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
		executor.schedule(() -> {
			int result = new AdminService().unSuspend(userIdval);
			if (result > 0) {
				System.out.println("타이머 확인 30day 30초");
			} else {
				System.out.println("타이머 30day 미작동");
			}
			executor.shutdown();
		}, 30, TimeUnit.SECONDS);

	}

}
