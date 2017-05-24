package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * my notification
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself" })
public class MyNotificationController {

	/**
	 * to my used page
	 * @return
	 */
	@RequestMapping("/my_notification")
	public String getMyUsed(){
		return "my_notification";
	}
}
