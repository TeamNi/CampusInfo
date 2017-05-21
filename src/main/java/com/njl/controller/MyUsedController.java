package com.njl.controller;

import java.io.File;
import java.util.ArrayList;
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

import com.njl.bean.Msg;
import com.njl.bean.Used;
import com.njl.bean.UsedAttention;
import com.njl.bean.UsedPic;
import com.njl.bean.User;
import com.njl.service.MyUsedService;
import com.njl.service.UsedAttentionService;
import com.njl.service.UsedPicService;
import com.njl.service.UsedReplyService;

/**
 * my used
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself" })
public class MyUsedController {
	
	@Autowired
	private MyUsedService myUsedService;
	@Autowired
	private UsedReplyService usedReplyService;
	@Autowired
	private UsedAttentionService usedAttentionService;
	@Autowired
	private UsedPicService usedPicService;

	/**
	 * to my used page
	 * @return
	 */
	@RequestMapping("/my_used")
	public String getMyUsed(@ModelAttribute("myself")User userinfo,Model model){
		//get my used
		List<Used> usedlist = myUsedService.getMyUsed(userinfo.getUserid());
		model.addAttribute("usedlist", usedlist);
		//get my attention used
		List<Used> attentionUsed = new ArrayList<Used>();
		List<UsedAttention> usedAttentions = usedAttentionService.queryAttentionUsedid(userinfo.getUserid());
		for (UsedAttention usedAttention : usedAttentions) {
			Used used = myUsedService.selectUsed(usedAttention.getUsedid());
			attentionUsed.add(used);
		}
		model.addAttribute("attentionUsed", attentionUsed);
		return "my_used";
	}
	
	/**
	 * delete myself used
	 * @param usedid
	 * @return
	 */
	@RequestMapping(value="/removemyselfused/{usedid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg removeMyUsed(@PathVariable("usedid")Integer usedid,HttpServletRequest request){
		//删除used 时  将服务器上的图片一并删除
		List<UsedPic> picsList = usedPicService.queryPic(usedid);
		for (UsedPic usedPic : picsList) {
			File picFile = new File(request.getSession().getServletContext().getRealPath("/") + usedPic.getPictureurl());
			if(picFile.exists() && (!"image/used/1495353980163img1.jpg".equals(usedPic.getPictureurl()))){
				picFile.delete();
			}
		}
		//delete blogPic database data
		usedPicService.deletePicWithUsedid(usedid);
		//删除used时，将used reply一并删除
		usedReplyService.deleteMyUsed(usedid);
		//delete my used 
		myUsedService.deleteMyUsed(usedid);
		return Msg.success();
	}
}
