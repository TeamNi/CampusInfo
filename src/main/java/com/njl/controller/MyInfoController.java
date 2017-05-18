package com.njl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.njl.bean.Msg;
import com.njl.bean.User;
import com.njl.bean.UserAttention;
import com.njl.service.UserAttentionService;
import com.njl.service.UserService;

/**
 * my info
 * 
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself" })
public class MyInfoController {

	@Autowired
	UserService userService;
	@Autowired
	UserAttentionService userAttentionService;
	
	/**
	 * get my info
	 * 
	 * @return
	 */
	@RequestMapping("/my_info")
	public String getMyInfo(@ModelAttribute("myself") User userinfo, Model model) {
		model.addAttribute("myinfo", userinfo);
		//get my attention
		List<User> nicknames = new ArrayList<>();
		List<UserAttention> friendids = userAttentionService.getMyAttention(userinfo.getUserid());//get friendid with userid
		for (UserAttention userAttention : friendids) {
			User user2 = userService.getAttentionNickname(userAttention.getFriendid());//get nickname with friendid
			nicknames.add(user2);
		}
		model.addAttribute("nicknames", nicknames);
		return "my_info";
	}
	
	/**
	 * update user info
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateuserinfo",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateUserInfo(User user, @ModelAttribute("myself")User userinfo,Model model){
		userService.updateUserWithStudentid(user,userinfo.getStudentid());
		//update session value
		User myself = userService.queryUserWithUserid(userinfo.getUserid());
		model.addAttribute("myself",myself);
		return Msg.success();
	}
	
	/**
	 * update user password
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateuserpwd",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateUserPwd(User user, @ModelAttribute("myself")User userinfo,Model model){
		userService.updateUserWithStudentid(user,userinfo.getStudentid());
		return Msg.success();
	}
	
	/**
	 * 检查昵称是否可用
	 * 
	 * @param nickname
	 * @return
	 */
	@RequestMapping(value="/checknickname")
	@ResponseBody
	public Msg checkNick(@RequestParam("nickname") String nickname, @ModelAttribute("myself")User userinfo){
		List<User> list = userService.checkNick(nickname);
		
		int cnn = 0;
		for (User us : list) {
			cnn = us.getStudentid();
		}
		
		int key = list.size(); 
		switch (key) {
		case 0:
			return Msg.success();
		case 1:
			if(cnn == userinfo.getStudentid()){
				return Msg.success();
			}else {
				return Msg.fail();
			}
		default:
			return Msg.fail();
		}
	}
	
	/**
	 * change my headportrait
	 * 
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/change_my_headportrait", method = RequestMethod.POST)
	public String changeHeadportrait(MultipartFile file, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("myself") User userinfo,Model model) throws IllegalStateException, IOException {
		
		String trueFileName = savePicture(file, request);
		if(trueFileName.contains(".")){
			User user = new User();
			user.setHeadurl(trueFileName);
			//先删除已有的头像图片
			User userHead = userService.queryUserWithUserid(userinfo.getUserid());
			File imgFile = new File(request.getSession().getServletContext().getRealPath("/") + userHead.getHeadurl());
			if(imgFile.exists() && (!"image/user/14950345129689.jpg".equals(userHead.getHeadurl()))){
				imgFile.delete();
			}
			//将图片路径保存到数据库中
			userService.updateUserWithStudentid(user, userinfo.getStudentid());
			//update session value
			User myself = userService.queryUserWithUserid(userinfo.getUserid());
			model.addAttribute("myself",myself);
		}else{
			request.getSession().setAttribute("uploadinfo", trueFileName);
		}
		return "redirect:/my_info";
	}
	
	/**
	 * save upload picture
	 * @param file
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public String savePicture(MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException{
		String trueFileName = null;
		if(file != null){//判断上传的文件是否为空
			String path = null;//文件路径
			String type = null;//文件类型
			String fileName = file .getOriginalFilename();//文件原名称
			System.out.println("上传的文件原名称是：" + fileName);
			//判断文件类型
			type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()) : null;
			if(type != null){//判断文件类型是否为空
				if("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())){
					//项目在容器中实际发布运行的根路径
					String readPath = request.getSession().getServletContext().getRealPath("/");
					System.out.println("项目在服务器中实际发布运行的根路径" + readPath);
					//文件名称
					trueFileName = "image/user/" + String.valueOf(System.currentTimeMillis()) + fileName;
					//设置存放文件的路径
					path = readPath + trueFileName;
					System.out.println("存放文件的路径是：" + path);
					//转存文件到指定路径
					file.transferTo(new File(path));
					System.out.println("文件成功上传的指定目录下");
				}else{
					trueFileName = "上传失败！不是我们想要的文件类型";
				}
			}else{
				trueFileName = "上传失败！文件类型为空";
			}
		}else{
			trueFileName = "上传失败！没有找到对应的文件";
		}
		return trueFileName;
	}
}
