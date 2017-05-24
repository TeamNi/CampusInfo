package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台 notification
 * @author njl
 *
 */
@Controller
public class NotificationController {

	/**
	 * to notification page
	 * @return
	 */
	@RequestMapping("/notification")
	public String getNotification() {
		return "notification";
	}

	/**
	 * to notification issue page
	 * @return
	 */
	@RequestMapping("/notification_issue")
	public String toNotificationIssuePage(){
		return "notification_issue";
	}

	/**
	 * to notification check page
	 * @return
	 */
	@RequestMapping("/notification_check")
	public String toNotificationCheck(){
		return "notification_check";
	}
}
