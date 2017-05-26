package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Advertisement;
import com.njl.bean.AdvertisementExample;
import com.njl.bean.AdvertisementExample.Criteria;
import com.njl.dao.AdvertisementMapper;

/**
 * my advertisement service
 * @author njl
 *
 */
@Service
public class MyAdvertisementService {
	
	@Autowired
	private AdvertisementMapper advertisementMapper;

	/**
	 * get my advertisement
	 * @param userid
	 * @return
	 */
	public List<Advertisement> getMyAdvertisement(Integer userid) {
		// TODO Auto-generated method stub
		AdvertisementExample example = new AdvertisementExample();
		example.setOrderByClause("createtime");
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Advertisement> advertisementlist = advertisementMapper.selectByExample(example);
		return advertisementlist;
	}

	/**
	 * delete advertisement
	 * @param adid
	 */
	public void deleteAdvertisementWithId(Integer adid) {
		// TODO Auto-generated method stub
		advertisementMapper.deleteByPrimaryKey(adid);
	}

	/**
	 * get advertisement with adid
	 * @param adid
	 * @return
	 */
	public Advertisement queryAdvertisementWithAdid(Integer adid) {
		// TODO Auto-generated method stub
		Advertisement advertisement = advertisementMapper.selectByPrimaryKey(adid);
		return advertisement;
	}

}
