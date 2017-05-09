package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.User;
import com.njl.bean.UserExample;
import com.njl.bean.UserExample.Criteria;
import com.njl.dao.UserMapper;

//业务逻辑组件
@Service
public class UserManageService {

	//自动注入dao
	@Autowired
	UserMapper userMapper;
	
	/**
	 * service要返回数据，调用dao，注入Mapper
	 * 查询所有用户
	 * @return
	 */
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userMapper.selectByExample(null);
	}

	/**
	 * 删除用户
	 * @param id
	 */
	public void deleteUser(Integer id) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 修改用户
	 * @param user
	 */
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKey(user);
	}

	/**
	 * 新增用户
	 * @param user
	 */
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insertSelective(user);
	}

	/**
	 * 检验用户名是否可用
	 * @param nickname
	 * @return true: 代表可用  false：不可用
	 */
	public boolean checkNick(String nickname) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andNicknameEqualTo(nickname);
		long count = userMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 检验学号是否可用
	 * @param studentid
	 * @return
	 */
	public boolean checkStudentid(int studentid) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andStudentidEqualTo(studentid);
		long count = userMapper.countByExample(example);
		return count == 0;
	}

}
