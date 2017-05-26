package com.njl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njl.bean.Advertisement;
import com.njl.bean.Notification;
import com.njl.service.AdvertisementService;
import com.njl.service.NotificationService;

/**
 * 前台 index
 * @author njl
 *
 */
@Controller
public class IndexController {
	
	@Autowired
	private AdvertisementService advertisementService;
	@Autowired
	private NotificationService notificationService;

	/**
	 * to index page
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String getIndex(Model model) {
		//get advertisement
		List<Advertisement> advertisementlist = advertisementService.queryIndex();
		model.addAttribute("advertisementlist", advertisementlist);
		//get notification
		List<Notification> notification = notificationService.queryIndex();
		model.addAttribute("notification", notification);
		//TODO
		return "index";
	}
}
