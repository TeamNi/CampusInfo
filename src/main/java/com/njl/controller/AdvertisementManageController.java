package com.njl.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Advertisement;
import com.njl.bean.Msg;
import com.njl.service.AdvertisementManageService;

/**
 * manage advertisement
 * @author njl
 *
 */
@Controller
public class AdvertisementManageController {
	
	@Autowired
	private AdvertisementManageService advertisementManageService;
	
	/**
	 * to manage_advertisement page
	 * @return
	 */
	@RequestMapping("/manage_advertisement")
	public String toManageAdvertisement(){
		return "manage_advertisement";
	}

	/**
	 * get advertisement data
	 * @return
	 */
	@RequestMapping("/getalladvertisement")
	@ResponseBody
	public Msg getAdvertisement(@RequestParam(value="pn",defaultValue="1") Integer pn, Model model){
		PageHelper.startPage(pn, 5);
		List<Advertisement> advertisementlist = advertisementManageService.getAllAdvertisement();
		PageInfo<Advertisement> pageInfo = new PageInfo<Advertisement>(advertisementlist, 5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * manager add advertisement
	 * @return
	 */
	@RequestMapping(value="/manageraddadvertisement",method=RequestMethod.POST)
	@ResponseBody
	public Msg addAdvertisement(Advertisement advertisement){
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		advertisement.setCreatetime(date);
		//管理员发布的 所有 放在用户id=1 的用户下
		advertisement.setUserid(1);
		if(advertisement.getConditionck() != 0){
			//若为管理员审核，则审核人为用户 id=1
			advertisement.setCheckuser(1);
		}
		advertisementManageService.addAdvertisement(advertisement);
		return Msg.success();
	}
	
	/**
	 * get advertisement with adid
	 * @return
	 */
	@RequestMapping(value="/oneadvertisement/{adid}", method=RequestMethod.GET)
	@ResponseBody
	public Msg getOneAdvertisement(@PathVariable("adid") Integer adid){
		Advertisement advertisement = advertisementManageService.getOneAdvertisement(adid);
		return Msg.success().add("advertisement", advertisement);
	}
	
	/**
	 * update advertisement
	 * @param advertisement
	 * @return
	 */
	@RequestMapping(value="/managerupdateadvertisement/{adid}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateAdvertisement(Advertisement advertisement){
		Advertisement ad = advertisementManageService.getOneAdvertisement(advertisement.getAdid());
		if(ad.getConditionck() != advertisement.getConditionck()){
			//若为管理员审核，则审核人为用户 id=1
			advertisement.setCheckuser(1);
		}
		advertisementManageService.updateAdvertisement(advertisement);
		return Msg.success();
	}
	
	/**
	 * delete advertisement
	 * 单个，批量 二合一
	 * 批量 1-2-3
	 * 单个 1
	 * @param adid
	 * @return
	 */
	@RequestMapping(value="/managerdeleteadvertisement/{adids}", method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteAdvertisement(@PathVariable("adids")String adids){
		if(adids.contains("-")){
			List<Integer> del_adids = new ArrayList<>();
			String[] str_adids = adids.split("-");
			for (String string : str_adids) {
				del_adids.add(Integer.parseInt(string));
			}
			advertisementManageService.deleteBatch(del_adids);
		}else{
			Integer adid = Integer.parseInt(adids);
			advertisementManageService.deleteAdvertisement(adid);
		}
		return Msg.success();
	}
}
