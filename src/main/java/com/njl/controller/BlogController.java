package com.njl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Blog;
import com.njl.service.BlogService;

/**
 * 前台  blog 
 * @author njl
 *
 */
@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	/**
	 * blog 首页
	 * @return
	 */
	@RequestMapping("/blog")
	public String getBlog(@RequestParam(value="pn",defaultValue="1") Integer pn, Model model) {
		//引入PageHelper分页插件
		//在查询之前只需要调用
		PageHelper.startPage(pn, 4);
		//startPage后面紧跟的查询 就是一个分页查询
		List<Blog> bloglist = blogService.getBlog();
		//使用PageInfo包装查询后的结果，只需要将PageInfo交给页面就行
		//它封装了详细的分页数据，包括我们查询出来的数据。传入连续显示的页数
		PageInfo page = new PageInfo(bloglist,5);
		model.addAttribute("pageInfo", page);
		return "blog";
	}
	
	/**
	 * blog details
	 * @return
	 */
	@RequestMapping("/blog_details")
	 public String getBlogDetails() {
		return "blog_details";
	}
	
	/**
	 * blog issue
	 * @return
	 */
	@RequestMapping("/blog_issue")
	public String getBlogIssue() {
		return "blog_issue";
	}
}
