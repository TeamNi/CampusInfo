package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.UsedPic;
import com.njl.bean.UsedPicExample;
import com.njl.bean.UsedPicExample.Criteria;
import com.njl.dao.UsedPicMapper;

/**
 * used picture 
 * @author njl
 *
 */
@Service
public class UsedPicService {
	
	@Autowired
	private UsedPicMapper usedPicMapper;

	/**
	 * add used pictures
	 * @param usedPic
	 */
	public void addUsedPic(UsedPic usedPic) {
		// TODO Auto-generated method stub
		usedPicMapper.insertSelective(usedPic);
	}

	/**
	 * used details show picture
	 * @param usedid
	 * @return
	 */
	public List<UsedPic> queryPic(Integer usedid) {
		// TODO Auto-generated method stub
		UsedPicExample example = new UsedPicExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid);
		List<UsedPic> usedPics = usedPicMapper.selectByExample(example);
		return usedPics;
	}

	/**
	 * delete picture data in the database
	 * @param usedid
	 */
	public void deletePicWithUsedid(Integer usedid) {
		// TODO Auto-generated method stub
		UsedPicExample example = new UsedPicExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsedidEqualTo(usedid);
		usedPicMapper.deleteByExample(example);
	}

}
