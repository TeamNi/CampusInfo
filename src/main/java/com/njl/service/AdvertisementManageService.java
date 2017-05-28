package com.njl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njl.bean.Advertisement;
import com.njl.bean.AdvertisementExample;
import com.njl.bean.AdvertisementExample.Criteria;
import com.njl.dao.AdvertisementMapper;

/**
 * manage advertisement service
 * @author njl
 *
 */
@Service
public class AdvertisementManageService {
	
	@Autowired
	private AdvertisementMapper advertisementMapper;
	
	/**
	 * get all advertisement
	 * @return
	 */
	public List<Advertisement> getAllAdvertisement() {
		// TODO Auto-generated method stub
		List<Advertisement> advertisementlist = advertisementMapper.selectByExampleWithUser(null);
		return advertisementlist;
	}

	/**
	 * add advertisement
	 * @param advertisement
	 */
	public void addAdvertisement(Advertisement advertisement) {
		// TODO Auto-generated method stub
		advertisementMapper.insertSelective(advertisement);
	}

	/**
	 * get advertisement with adid
	 * @param adid
	 * @return
	 */
	public Advertisement getOneAdvertisement(Integer adid) {
		// TODO Auto-generated method stub
		Advertisement advertisement = advertisementMapper.selectByPrimaryKeyWithUser(adid);
		return advertisement;
	}

	/**
	 * update advertisement with adid
	 * @param advertisement
	 */
	public void updateAdvertisement(Advertisement advertisement) {
		// TODO Auto-generated method stub
		advertisementMapper.updateByPrimaryKeySelective(advertisement);
	}

	/**
	 * delete advertisement with adid
	 * @param adid
	 */
	public void deleteAdvertisement(Integer adid) {
		// TODO Auto-generated method stub
		advertisementMapper.deleteByPrimaryKey(adid);
	}

	/**
	 * batch delete advertisement
	 * @param del_adids
	 */
	public void deleteBatch(List<Integer> del_adids) {
		// TODO Auto-generated method stub
		AdvertisementExample example = new AdvertisementExample();
		Criteria criteria = example.createCriteria();
		criteria.andAdidIn(del_adids);
		advertisementMapper.deleteByExample(example);
	}
}
