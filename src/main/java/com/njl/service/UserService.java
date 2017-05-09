package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.User;
import com.njl.bean.UserExample;
import com.njl.bean.UserExample.Criteria;
import com.njl.dao.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;

	/**
	 * user login
	 * 
	 * @param user
	 */
	public List<User> queryUser(String username, String password) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPasswordEqualTo(password).andUsernameEqualTo(username);
		List<User> list = userMapper.selectByExample(example);
		return list;
	}

	/**
	 * regiister user
	 * 
	 * @param user
	 */
	public void registerUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insertSelective(user);
	}

	/**
	 * 忘记密码
	 * 
	 * @param user
	 * @return
	 */
	public List<User> getUser(User user) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andStudentidEqualTo(user.getStudentid()).andSafequestionEqualTo(user.getSafequestion())
				.andSafeanswerEqualTo(user.getSafeanswer());
		List<User> list = userMapper.selectByExample(example);
		return list;
	}

	/**
	 * my_info page  查询
	 * @return
	 */
	public List<User> queryUserWithStu(Integer studentid) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andStudentidEqualTo(studentid);
		List<User> userlist = userMapper.selectByExample(example);
		return userlist;
	}

}
