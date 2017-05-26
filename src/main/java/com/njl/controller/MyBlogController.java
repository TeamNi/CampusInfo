package com.njl.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.njl.bean.Advertisement;
import com.njl.bean.Blog;
import com.njl.bean.BlogPic;
import com.njl.bean.Msg;
import com.njl.bean.Notification;
import com.njl.bean.User;
import com.njl.service.AdvertisementService;
import com.njl.service.BlogPicService;
import com.njl.service.BlogReplyService;
import com.njl.service.MyBlogService;
import com.njl.service.NotificationService;

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
	@Autowired
	private BlogPicService blogPicService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private AdvertisementService advertisementService;

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
		//get sidebar notification
		List<Notification> notificationlist = notificationService.getSidNotification();
		model.addAttribute("notificationlist", notificationlist);
		//get sidebar advertisement
		List<Advertisement> advertisementlist = advertisementService.getSidAdvertisement();
		model.addAttribute("advertisementlist", advertisementlist);
		return "my_blog";
	}
	
	/**
	 * delete myself blog
	 * @param blogid
	 * @return
	 */
	@RequestMapping(value="/removemyselfblog/{blogid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeMyBlog(@PathVariable("blogid") Integer blogid,HttpServletRequest request){
		//删除blog 时  将服务器上的图片一并删除
		List<BlogPic> picslist = blogPicService.queryPic(blogid);
		for (BlogPic blogPic : picslist) {
			File picFile = new File(request.getSession().getServletContext().getRealPath("/") + blogPic.getPictureurl());
			if(picFile.exists() && (!"image/blog/1495195501805noimage.png".equals(blogPic.getPictureurl()))){
				picFile.delete();
			}
		}
		//delete blogPic database data
		blogPicService.deletePicWithBlogid(blogid);
		//删除blog时，将blog reply一并删除
		blogReplyservice.deleteReplyWithBlogid(blogid);
		//删除blog
		myblogService.removeMyBlog(blogid);
		return Msg.success();
	}
}
