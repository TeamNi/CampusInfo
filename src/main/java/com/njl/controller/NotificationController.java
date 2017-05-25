package com.njl.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njl.bean.Advertisement;
import com.njl.bean.Msg;
import com.njl.bean.Notification;
import com.njl.bean.User;
import com.njl.service.AdvertisementService;
import com.njl.service.NotificationService;

/**
 * 前台 notification
 * @author njl
 *
 */
@Controller
@SessionAttributes({"myself"})
public class NotificationController {
	
	private String advertisementPath = null;

	@Autowired
	private NotificationService notificationService;
	@Autowired
	private AdvertisementService advertisementService;
	
	/**
	 * to notification/advertisement page
	 * @return
	 */
	@RequestMapping("/notification")
	public String getNotification(@RequestParam(value="pn",defaultValue="1") Integer pn, @RequestParam(value="pna",defaultValue="1") Integer pna, Model model) {
		//notification
		PageHelper.startPage(pn, 10);
		List<Notification> notificationlist = notificationService.getPassNotification();
		PageInfo<Notification> pageInfo = new PageInfo<Notification>(notificationlist,5);
		model.addAttribute("pageInfo", pageInfo);
		//advertisement
		PageHelper.startPage(pna, 3);
		List<Advertisement> advertisementlist = advertisementService.getPassAdvertisement();
		PageInfo<Advertisement> pageInfoAd = new PageInfo<Advertisement>(advertisementlist,5);
		model.addAttribute("pageInfoAd", pageInfoAd);
		return "notification";
	}

	/**
	 * to notification/advertisement issue page
	 * @return
	 */
	@RequestMapping("/notification_issue")
	public String toNotificationIssuePage(){
		return "notification_issue";
	}
	
	/**
	 * issue notification/advertisement
	 * @param type
	 * @param title
	 * @param content
	 * @param userinfo
	 * @return
	 */
	@RequestMapping(value = "/issue_notification", method = RequestMethod.POST)
	@ResponseBody
	public Msg issueNotification(@RequestParam("type") String type, @RequestParam("title") String title,
			@RequestParam("content") String content, @ModelAttribute("myself") User userinfo) {
		if("notification".equals(type)){
			Notification notification = new Notification();
			//获取当前时间
			long time = System.currentTimeMillis();
			Date date = new Date(time);
			notification.setUserid(userinfo.getUserid());
			notification.setTitle(title);
			notification.setContent(content);
			notification.setCreatetime(date);
			notificationService.issueNotification(notification);
		}
		if("advertisement".equals(type)){
			Advertisement advertisement = new Advertisement();
			//获取当前时间
			long time = System.currentTimeMillis();
			Date date = new Date(time);
			advertisement.setUserid(userinfo.getUserid());
			advertisement.setTitle(title);
			advertisement.setContent(content);
			advertisement.setCreatetime(date);
			advertisement.setPictureurl(advertisementPath);
			advertisementService.issueAdvertisement(advertisement);
		}
		return Msg.success();
	}

	/**
	 * to notification/advertisement check page
	 * @return
	 */
	@RequestMapping("/notification_check")
	public String toNotificationCheck(@RequestParam(value="pn",defaultValue="1") Integer pn, @RequestParam(value="pna",defaultValue="1") Integer pna, Model model){
		//notification
		PageHelper.startPage(pn, 10);
		List<Notification> notificationlist = notificationService.getNotification();
		PageInfo<Notification> pageInfo = new PageInfo<Notification>(notificationlist,5);
		model.addAttribute("pageInfo", pageInfo);
		//advertisement
		PageHelper.startPage(pna, 3);
		List<Advertisement> advertisementlist = advertisementService.getAdvertisement();
		PageInfo<Advertisement> pageInfoAd = new PageInfo<Advertisement>(advertisementlist,5);
		model.addAttribute("pageInfoAd", pageInfoAd);
		return "notification_check";
	}
	
	/**
	 * check notification
	 * 
	 * @param conditionck
	 * @param noid
	 * @param pn
	 * @return
	 */
	@RequestMapping("/check_notification")
	public String checkNotification(@RequestParam("conditionck") Integer conditionck,
			@RequestParam("noid") Integer noid, @RequestParam("pn") Integer pn, @RequestParam("pna") Integer pna,
			@ModelAttribute("myself") User userinfo) {
		Notification notification = new Notification();
		notification.setNoid(noid);
		notification.setConditionck(conditionck);
		notification.setCheckuser(userinfo.getUserid());
		notificationService.updateNotification(notification);
		return "redirect:notification_check?pn="+pn+"&pna="+pna;
	}
	
	/**
	 * check advertisement
	 * 
	 * @param conditionck
	 * @param noid
	 * @param pn
	 * @param pna
	 * @return
	 */
	@RequestMapping("/check_advertisement")
	public String checkAdvertisement(@RequestParam("conditionck") Integer conditionck,
			@RequestParam("adid") Integer adid, @RequestParam("pn") Integer pn, @RequestParam("pna") Integer pna,
			@ModelAttribute("myself") User userinfo) {
		Advertisement advertisement = new Advertisement();
		advertisement.setAdid(adid);
		advertisement.setConditionck(conditionck);
		advertisement.setCheckuser(userinfo.getUserid());
		advertisementService.updateNotification(advertisement);
		return "redirect:notification_check?pn="+pn+"&pna="+pna;
	}
	
	/**
	 * upload advertisement picture
	 * @param file
	 * @param request
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/uploadadvertisementpicture", method=RequestMethod.POST)
	@ResponseBody
	public void uploadAdpicture(MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException{
		String trueFileNamePath = null;
		String fileName = file .getOriginalFilename();//文件原名称
		String readPath = request.getSession().getServletContext().getRealPath("/");
		trueFileNamePath = "image/ad/" + String.valueOf(System.currentTimeMillis()) + fileName;
		String path = readPath + trueFileNamePath;
		file.transferTo(new File(path));
		advertisementPath = trueFileNamePath;
	}
}
