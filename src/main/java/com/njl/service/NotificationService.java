package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Notification;
import com.njl.bean.NotificationExample;
import com.njl.bean.NotificationExample.Criteria;
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

	/**
	 * get all notification
	 * @return
	 */
	public List<Notification> getNotification() {
		// TODO Auto-generated method stub
		NotificationExample example = new NotificationExample();
		example.setOrderByClause("createtime");
		List<Notification> notificationlist = notificationMapper.selectByExampleWithUser(example);
		return notificationlist;
	}
	
	/**
	 * get condition pass notification
	 * @return
	 */
	public List<Notification> getPassNotification() {
		// TODO Auto-generated method stub
		NotificationExample example = new NotificationExample();
		example.setOrderByClause("createtime");
		Criteria criteria = example.createCriteria();
		// 1:pass 2:fail 0: no check
		criteria.andConditionckEqualTo(1);
		List<Notification> notificationlist = notificationMapper.selectByExampleWithUser(example);
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
	
	/**
	 * get index notification
	 * @return
	 */
	public List<Notification> queryIndex() {
		// TODO Auto-generated method stub
		NotificationExample example = new NotificationExample();
		Criteria criteria = example.createCriteria();
		//priority : 0 正常显示  1 侧边显示  2 侧边+首页显示
		criteria.andPriorityGreaterThanOrEqualTo(2).andConditionckEqualTo(1);
		List<Notification> notificationlist = notificationMapper.selectByExampleWithUser(example);
		return notificationlist;
	}

	/**
	 * get sidebar notification
	 * @return
	 */
	public List<Notification> getSidNotification() {
		// TODO Auto-generated method stub
		NotificationExample example = new NotificationExample();
		Criteria criteria = example.createCriteria();
		//priority : 0 正常显示  1 侧边显示  2 侧边+首页显示
		criteria.andPriorityGreaterThanOrEqualTo(1).andConditionckEqualTo(1);
		List<Notification> notificationlist = notificationMapper.selectByExampleWithUser(example);
		return notificationlist;
	}

}
