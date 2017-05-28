package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Notification;
import com.njl.bean.NotificationExample;
import com.njl.bean.NotificationExample.Criteria;
import com.njl.dao.NotificationMapper;

/**
 * notification manage service
 * @author njl
 *
 */
@Service
public class NotificationManageService {

	@Autowired
	private NotificationMapper notificationMapper;
	
	/**
	 * get all notification
	 * @return
	 */
	public List<Notification> getAllNotification() {
		// TODO Auto-generated method stub
		List<Notification> notificationlist = notificationMapper.selectByExampleWithUser(null);
		return notificationlist;
	}

	/**
	 * add notification
	 * @param notification
	 */
	public void addNotification(Notification notification) {
		// TODO Auto-generated method stub
		notificationMapper.insertSelective(notification);
	}

	/**
	 * get notification with noid
	 * @param noid
	 * @return
	 */
	public Notification getOneNotification(Integer noid) {
		// TODO Auto-generated method stub
		Notification notification = notificationMapper.selectByPrimaryKeyWithUser(noid);
		return notification;
	}

	/**
	 * update notification with noid
	 * @param notification
	 */
	public void updateNotification(Notification notification) {
		// TODO Auto-generated method stub
		notificationMapper.updateByPrimaryKeySelective(notification);
	}

	/**
	 * delete notification with noid
	 * @param noid
	 */
	public void deleteNotification(Integer noid) {
		// TODO Auto-generated method stub
		notificationMapper.deleteByPrimaryKey(noid);
	}

	/**
	 * batch delete notification
	 * @param del_noids
	 */
	public void deleteBatch(List<Integer> del_noids) {
		// TODO Auto-generated method stub
		NotificationExample example = new NotificationExample();
		Criteria criteria = example.createCriteria();
		criteria.andNoidIn(del_noids);
		notificationMapper.deleteByExample(example);
	}

}
