package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * my used
 * @author njl
 *
 */
@Controller
public class MyUsed {

	/**
	 * my used
	 * @return
	 */
	@RequestMapping("/my_used")
	public String getMyUsed(){
		return "my_used";
	}
}
