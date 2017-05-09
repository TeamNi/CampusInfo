package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台 used
 * @author njl
 *
 */
@Controller
public class UsedController {

	/**
	 * used 首页
	 * @return
	 */
	@RequestMapping("/used")
	public String getUsed() {
		return "used";
	}
	
	/**
	 * used details
	 * @return
	 */
	@RequestMapping("/used_details")
	public String getUsedDetails() {
		return "used_details";
	}
	
	/**
	 * used issue
	 * @return
	 */
	@RequestMapping("/used_issue")
	public String getUsedIssue(){
		return "used_issue";
	}
}
