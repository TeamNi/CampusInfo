package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Notification;
import com.njl.bean.NotificationExample;
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
		example.setOrderByClause("createtime");
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
