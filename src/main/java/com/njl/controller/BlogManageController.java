package com.njl.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njl.bean.Blog;
import com.njl.bean.Msg;
import com.njl.service.BlogManageService;

/**
 * 对论坛管理的CRUD
 * @author njl
 *
 */
@Controller
public class BlogManageController {
	
	@Autowired
	BlogManageService blogManageService;
	/**
	 * 查询论坛数据
	 * @return
	 */
	@RequestMapping("/manage_blog")
	public String getBlog(Model model){
		List<Blog> bloglist = blogManageService.getAll();
		model.addAttribute("bloglist", bloglist);
		return "manage_blog";
	}
	
	/**
	 * 删除blog
	 * @return
	 */
	@RequestMapping(value="/blog/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteBlog(@PathVariable("id") Integer id){
		blogManageService.deleteBlog(id);
		return Msg.success();
	}
	
	@RequestMapping(value="/blog/{blogid}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateBlog(Blog blog){
		blogManageService.updateBlog(blog);
		return Msg.success();
	}

	/**
	 * 增加blog
	 * @return
	 */
	@RequestMapping(value="blog",method = RequestMethod.POST)
	@ResponseBody
	public Msg addBlog(Blog blog){
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		blog.setCreatetime(date);
		blogManageService.addBlog(blog);
		return Msg.success();
	}
	
}
