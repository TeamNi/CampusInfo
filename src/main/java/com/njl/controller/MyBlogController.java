package com.njl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * my blog
 * @author njl
 *
 */
@Controller
public class MyBlogController {

	/**
	 * my blog
	 * @return
	 */
	@RequestMapping("/my_blog")
	public String getMyBlog() {
		return "my_blog";
	}
}
