package com.njl.dao;

import com.njl.bean.UsedPic;
import com.njl.bean.UsedPicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsedPicMapper {
    long countByExample(UsedPicExample example);

    int deleteByExample(UsedPicExample example);

    int deleteByPrimaryKey(Integer upicid);

    int insert(UsedPic record);

    int insertSelective(UsedPic record);

    List<UsedPic> selectByExample(UsedPicExample example);

    UsedPic selectByPrimaryKey(Integer upicid);

    int updateByExampleSelective(@Param("record") UsedPic record, @Param("example") UsedPicExample example);

    int updateByExample(@Param("record") UsedPic record, @Param("example") UsedPicExample example);

    int updateByPrimaryKeySelective(UsedPic record);

    int updateByPrimaryKey(UsedPic record);
}