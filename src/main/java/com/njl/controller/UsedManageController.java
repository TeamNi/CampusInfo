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

import com.njl.bean.Msg;
import com.njl.bean.Used;
import com.njl.service.UsedManageService;


/**
 * 对used管理的CRUD
 * @author njl
 *
 */
@Controller
public class UsedManageController {
	
	@Autowired
	UsedManageService usedManageService;
	
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
	public Msg deleteUsed(@PathVariable("id") Integer id){
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
