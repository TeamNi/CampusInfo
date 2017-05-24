package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Notification;
import com.njl.dao.NotificationMapper;

/**
 * notification
 * @author njl
 *
 */
@Service
public class NotificationService {
	
	@Autowired
	private NotificationMapper notificationMapper;

	/**
	 * issue Notification
	 * @param notification
	 */
	public void issueNotification(Notification notification) {
		// TODO Auto-generated method stub
		notificationMapper.insertSelective(notification);
	}

	public List<Notification> getNotification() {
		// TODO Auto-generated method stub
		List<Notification> notificationlist = notificationMapper.selectByExampleWithUser(null);
		return notificationlist;
	}

	/**
	 * update condition
	 * @param notification
	 */
	public void updateNotification(Notification notification) {
		// TODO Auto-generated method stub
		notificationMapper.updateByPrimaryKeySelective(notification);
	}

}
