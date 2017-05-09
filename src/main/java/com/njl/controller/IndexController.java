package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前台 index
 * @author njl
 *
 */
@Controller
public class IndexController {

	@RequestMapping("index")
	public String getIndex() {
		return "index";
	}
}
