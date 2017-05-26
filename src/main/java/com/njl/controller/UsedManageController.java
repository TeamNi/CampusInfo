package com.njl.controller;

import java.io.File;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njl.bean.Msg;
import com.njl.bean.Used;
import com.njl.bean.UsedPic;
import com.njl.service.UsedManageService;
import com.njl.service.UsedPicService;
import com.njl.service.UsedReplyService;


/**
 * 对used管理的CRUD
 * @author njl
 *
 */
@Controller
public class UsedManageController {
	
	@Autowired
	UsedManageService usedManageService;
	@Autowired
	private UsedPicService usedPicService;
	@Autowired
	private UsedReplyService usedReplyService;
	
	/**
	 * 查询used数据
	 * @return
	 */
	@RequestMapping("/manage_used")
	public String getUsed(Model model){
		List<Used> usedlist = usedManageService.getAll();
		model.addAttribute("usedlist", usedlist);
		return "manage_used";
	}
	
	/**
	 * 删除used
	 * @return
	 */
	@RequestMapping(value="/used/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteUsed(@PathVariable("id") Integer id, HttpServletRequest request){
		//删除used 时  将服务器上的图片一并删除
		List<UsedPic> picsList = usedPicService.queryPic(id);
		for (UsedPic usedPic : picsList) {
			File picFile = new File(request.getSession().getServletContext().getRealPath("/") + usedPic.getPictureurl());
			if(picFile.exists() && (!"image/used/1495353980163img1.jpg".equals(usedPic.getPictureurl()))){
				picFile.delete();
			}
		}
		//delete blogPic database data
		usedPicService.deletePicWithUsedid(id);
		//删除used时，将used reply一并删除
		usedReplyService.deleteMyUsed(id);
		//delete my used 
		usedManageService.deleteUsed(id);
		return Msg.success();
	}
	
	/**
	 * 修改used
	 * @return
	 */
	@RequestMapping(value="/used/{usedid}",method= RequestMethod.PUT)
	@ResponseBody
	public Msg updateUsed(Used used){
		usedManageService.updateUsed(used);
		return Msg.success();
	}
	
	/**
	 * 增加used
	 * @return
	 */
	@RequestMapping(value="/used",method = RequestMethod.POST)
	@ResponseBody
	public Msg addUsed(Used used){
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		used.setCreatetime(date);
		usedManageService.addUsed(used);
		System.out.println(used);
		return Msg.success();
	}
}
