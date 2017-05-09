package com.njl.dao;

import com.njl.bean.Used;
import com.njl.bean.UsedExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsedMapper {
    long countByExample(UsedExample example);

    int deleteByExample(UsedExample example);

    int deleteByPrimaryKey(Integer usedid);

    int insert(Used record);

    int insertSelective(Used record);

    List<Used> selectByExample(UsedExample example);

    Used selectByPrimaryKey(Integer usedid);

    int updateByExampleSelective(@Param("record") Used record, @Param("example") UsedExample example);

    int updateByExample(@Param("record") Used record, @Param("example") UsedExample example);

    int updateByPrimaryKeySelective(Used record);

    int updateByPrimaryKey(Used record);
}