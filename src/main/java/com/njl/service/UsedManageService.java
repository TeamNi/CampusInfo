package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Used;
import com.njl.dao.UsedMapper;

@Service
public class UsedManageService {
	
	@Autowired
	UsedMapper usedMapper;

	/**
	 * 查询所有used
	 * @return
	 */
	public List<Used> getAll() {
		// TODO Auto-generated method stub
		return usedMapper.selectByExample(null);
	}

	/**
	 * 删除used
	 * @param id
	 */
	public void deleteUsed(Integer id) {
		// TODO Auto-generated method stub
		usedMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 增加used
	 * @param used
	 */
	public void addUsed(Used used) {
		// TODO Auto-generated method stub
		usedMapper.insertSelective(used);
	}

	/**
	 * 修改used
	 * @param used
	 */
	public void updateUsed(Used used) {
		// TODO Auto-generated method stub
		usedMapper.updateByPrimaryKeySelective(used);
	}

}
