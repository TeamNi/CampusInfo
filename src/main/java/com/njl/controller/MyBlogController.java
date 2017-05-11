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
import com.njl.service.MyBlogService;
import com.njl.service.UserService;

/**
 * my blog
 * @author njl
 *
 */
@Controller
@SessionAttributes({"username","studentid"})
public class MyBlogController {
	
	@Autowired 
	UserService UserService ;
	@Autowired
	MyBlogService myblogService;

	/**
	 * to my_blog page
	 * @param studentid
	 * @param model
	 * @return
	 */
	@RequestMapping("/my_blog")
	public String getMyBlog(@ModelAttribute("studentid") Integer studentid,Model model) {
		//根据studentid 获得userid
		int userid = 0;
		List<User> userlist = UserService.queryUserWithStu(studentid);
		for (User user : userlist) {
			userid = user.getUserid();
		}
		//根据userid获取 blog
		List<Blog> bloglist = myblogService.getMyblog(userid);
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
		return Msg.success();
	}
}
