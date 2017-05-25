package com.njl.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.njl.bean.Msg;
import com.njl.bean.Notification;
import com.njl.bean.NotificationExample;
import com.njl.bean.UsedPic;
import com.njl.bean.NotificationExample.Criteria;
import com.njl.dao.NotificationMapper;

/**
 * my notification service
 * @author njl
 *
 */
@Service
public class MyNotificationService {
	
	@Autowired
	private NotificationMapper notificationMapper;

	/**
	 * get my notification
	 * @param userid
	 * @return
	 */
	public List<Notification> getMyNotification(Integer userid) {
		// TODO Auto-generated method stub
		NotificationExample example = new NotificationExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Notification> notificationlist = notificationMapper.selectByExample(example);
		return notificationlist;
	}

	/**
	 * delete notification
	 * @param noid
	 */
	public void deleteNotificationWithId(Integer noid) {
		// TODO Auto-generated method stub
		notificationMapper.deleteByPrimaryKey(noid);
	}

}
