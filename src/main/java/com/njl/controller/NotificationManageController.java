package com.njl.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Msg;
import com.njl.bean.Notification;
import com.njl.service.NotificationManageService;

/**
 * 后台 manage notification
 * @author njl
 *
 */
@Controller
public class NotificationManageController {
	
	@Autowired
	private NotificationManageService notificationManageService;
	
	/**
	 * to manage_notification page
	 * @return
	 */
	@RequestMapping("/manage_notification")
	public String toManageNotification(){
		return "manage_notification";
	}

	/**
	 * get notification data
	 * @return
	 */
	@RequestMapping("/getallnotification")
	@ResponseBody
	public Msg getNotification(@RequestParam(value="pn",defaultValue="1") Integer pn, Model model){
		PageHelper.startPage(pn, 5);
		List<Notification> notificationlist = notificationManageService.getAllNotification();
		PageInfo<Notification> pageInfo = new PageInfo<Notification>(notificationlist, 5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * manager add notification
	 * @return
	 */
	@RequestMapping(value="/manageraddnotification",method=RequestMethod.POST)
	@ResponseBody
	public Msg addNotification(Notification notification){
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		notification.setCreatetime(date);
		//管理员发布的 所有 放在用户id=1 的用户下
		notification.setUserid(1);
		if(notification.getConditionck() != 0){
			//若为管理员审核，则审核人为用户 id=1
			notification.setCheckuser(1);
		}
		notificationManageService.addNotification(notification);
		return Msg.success();
	}
	
	/**
	 * get notification with noid
	 * @return
	 */
	@RequestMapping(value="/onenotification/{noid}", method=RequestMethod.GET)
	@ResponseBody
	public Msg getOneNotification(@PathVariable("noid") Integer noid){
		Notification notification = notificationManageService.getOneNotification(noid);
		return Msg.success().add("notification", notification);
	}
	
	/**
	 * update notification
	 * @param notification
	 * @return
	 */
	@RequestMapping(value="/managerupdatenotification/{noid}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateNotification(Notification notification){
		Notification no = notificationManageService.getOneNotification(notification.getNoid());
		if(no.getConditionck() != notification.getConditionck()){
			//若为管理员审核，则审核人为用户 id=1
			notification.setCheckuser(1);
		}
		notificationManageService.updateNotification(notification);
		return Msg.success();
	}
	
	/**
	 * delete notification
	 * 单个，批量 二合一
	 * 批量 1-2-3
	 * 单个 1
	 * @param noid
	 * @return
	 */
	@RequestMapping(value="/managerdeletenotification/{noids}", method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteNotification(@PathVariable("noids")String noids){
		if(noids.contains("-")){
			List<Integer> del_noids = new ArrayList<>();
			String[] str_noids = noids.split("-");
			for (String string : str_noids) {
				del_noids.add(Integer.parseInt(string));
			}
			notificationManageService.deleteBatch(del_noids);
		}else{
			Integer noid = Integer.parseInt(noids);
			notificationManageService.deleteNotification(noid);
		}
		return Msg.success();
	}
}
