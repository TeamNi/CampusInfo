package com.njl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.njl.service.MyNotificationService;

/**
 * my notification
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself" })
public class MyNotificationController {
	
	@Autowired
	private MyNotificationService myNotificationService;

	/**
	 * to my used page
	 * @return
	 */
	@RequestMapping("/my_notification")
	public String getMyUsed(@RequestParam(value="pn",defaultValue="1") Integer pn, Model model, @ModelAttribute("myself") User userinfo){
		PageHelper.startPage(pn, 10);
		List<Notification> notificationlist = myNotificationService.getMyNotification(userinfo.getUserid());
		PageInfo<Notification> pageInfo = new PageInfo<Notification>(notificationlist,5);
		model.addAttribute("pageInfo", pageInfo);
		return "my_notification";
	}
	
	/**
	 * delete my notification
	 * @param noid
	 * @return
	 */
	@RequestMapping(value="/remove_notification/{noid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeMyNotification(@PathVariable("noid")Integer noid){
		myNotificationService.deleteNotificationWithId(noid);
		return Msg.success();
	}
}
