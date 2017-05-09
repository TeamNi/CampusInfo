package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * my info
 * @author njl
 *
 */
@Controller
public class MyInfo {

	/**
	 * my info
	 * @return
	 */
	@RequestMapping("/my_info")
	public String getMyInfo(){
		return "my_info";
	}
}
