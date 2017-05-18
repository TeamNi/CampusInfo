package com.njl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.njl.bean.Blog;
import com.njl.bean.Msg;
import com.njl.bean.User;
import com.njl.service.BlogReplyService;
import com.njl.service.MyBlogService;

/**
 * my blog
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself" })
public class MyBlogController {
	
	@Autowired
	private MyBlogService myblogService;
	@Autowired
	private BlogReplyService blogReplyservice;

	/**
	 * to my_blog page
	 * @param studentid
	 * @param model
	 * @return
	 */
	@RequestMapping("/my_blog")
	public String getMyBlog(@ModelAttribute("myself") User userinfo,Model model) {
		//根据userid获取 blog
		List<Blog> bloglist = myblogService.getMyblog(userinfo.getUserid());
		model.addAttribute("bloglist", bloglist);
		return "my_blog";
	}
	
	/**
	 * delete myself blog
	 * @param blogid
	 * @return
	 */
	@RequestMapping(value="/removemyselfblog/{blogid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeMyBlog(@PathVariable("blogid") Integer blogid){
		myblogService.removeMyBlog(blogid);
		//删除blog时，将blog reply一并删除
		blogReplyservice.deleteReplyWithBlogid(blogid);
		return Msg.success();
	}
}
