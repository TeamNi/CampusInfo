package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * my blog
 * @author njl
 *
 */
@Controller
public class MyBlog {

	/**
	 * my blog
	 * @return
	 */
	@RequestMapping("/my_blog")
	public String getMyBlog() {
		return "my_blog";
	}
}
