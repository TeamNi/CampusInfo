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
@SessionAttributes({ "username", "studentid" })
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
	public String getMyInfo(@ModelAttribute("username") String username,
			@ModelAttribute("studentid") Integer studentid, Model model) {

		//my info
		User user = new User();
		List<User> userlist = userService.queryUserWithStu(studentid);
		for (User us : userlist) {
			user.setContact(us.getContact());
			user.setCreatetime(us.getCreatetime());
			user.setHeadurl(us.getHeadurl());
			user.setNickname(us.getNickname());
			user.setPassword(us.getPassword());
			user.setSafeanswer(us.getSafeanswer());
			user.setSafequestion(us.getSafequestion());
			user.setSex(us.getSex());
			user.setStudentid(us.getStudentid());
			user.setUserid(us.getUserid());
			user.setUsername(us.getUsername());
		}
		model.addAttribute("user", user);
		//get my attention
		List<User> nicknames = new ArrayList<>();
		List<User> userids = userService.getMyAttention(studentid);//get userid with studentid
		int userid = 0;
		for (User user2 : userids) {
			userid = user2.getUserid();			
		}
		List<UserAttention> friendids = userAttentionService.getMyAttention(userid);//get friendid with userid
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
	public Msg updateUserInfo(User user, @ModelAttribute("studentid")Integer studentid){
		userService.updateUserWithStudentid(user,studentid);
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
	public Msg updateUserPwd(User user, @ModelAttribute("studentid")Integer studentid){
		userService.updateUserWithStudentid(user,studentid);
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
	public Msg checkNick(@RequestParam("nickname") String nickname, @ModelAttribute("studentid")Integer studentid){
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
			if(cnn == studentid){
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
			@ModelAttribute("studentid") Integer studentid) throws IllegalStateException, IOException {

		String trueFileName = savePicture(file, request);
		User user = new User();
		user.setHeadurl(trueFileName);
		// 将图片路径保存到数据库中
		userService.updateUserWithStudentid(user, studentid);

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
				if("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase()) || "TXT".equals(type.toUpperCase())){
					//项目在容器中实际发布运行的根路径
					String readPath = request.getSession().getServletContext().getRealPath("/");
					System.out.println("项目在服务器中实际发布运行的根路径" + readPath);
					//文件名称
					trueFileName = "image/" + String.valueOf(System.currentTimeMillis()) + fileName;
					//设置存放文件的路径
					path = readPath + trueFileName;
					
					System.out.println("存放文件的路径是：" + path);
					//转存文件到指定路径
					file.transferTo(new File(path));
					System.out.println("文件成功上传的指定目录下");
				}else{
					System.out.println("不是我们想要的文件类型");
				}
			}else{
				System.out.println("文件类型为空");
			}
		}else{
			System.out.println("没有找到对应的文件");
		}
		return trueFileName;
	}
}
