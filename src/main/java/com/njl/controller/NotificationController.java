package com.njl.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Msg;
import com.njl.bean.Notification;
import com.njl.bean.User;
import com.njl.service.NotificationService;

/**
 * 前台 notification
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself"})
public class NotificationController {

	@Autowired
	private NotificationService notificationService;
	
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
	 * issue notification/advertisement
	 * @param type
	 * @param title
	 * @param content
	 * @param userinfo
	 * @return
	 */
	@RequestMapping(value = "/issue_notification", method = RequestMethod.POST)
	@ResponseBody
	public Msg issueNotification(@RequestParam("type") String type, @RequestParam("title") String title,
			@RequestParam("content") String content, @ModelAttribute("myself") User userinfo) {
		if("notification".equals(type)){
			Notification notification = new Notification();
			//获取当前时间
			long time = System.currentTimeMillis();
			Date date = new Date(time);
			notification.setUserid(userinfo.getUserid());
			notification.setTitle(title);
			notification.setContent(content);
			notification.setCreatetime(date);
			notificationService.issueNotification(notification);
		}
		if("advertisement".equals(type)){
			
		}
		
		return Msg.success();
	}

	/**
	 * to notification check page
	 * @return
	 */
	@RequestMapping("/notification_check")
	public String toNotificationCheck(@RequestParam(value="pn",defaultValue="1") Integer pn, Model model){
		PageHelper.startPage(pn, 1);
		List<Notification> notificationlist = notificationService.getNotification();
		PageInfo<Notification> pageInfo = new PageInfo<Notification>(notificationlist,5);
		model.addAttribute("pageInfo", pageInfo);
		return "notification_check";
	}
	
	@RequestMapping("/check_notification")
	@ResponseBody
	public Msg checkNotification(@RequestParam("conditionck") Integer conditionck, @RequestParam("noid") Integer noid) {
		Notification notification = new Notification();
		notification.setNoid(noid);
		notification.setConditionck(conditionck);
		System.out.println(notification);
		notificationService.updateNotification(notification);
		return Msg.success();
	}
}
