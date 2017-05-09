package com.njl.dao;

import com.njl.bean.UsedAttention;
import com.njl.bean.UsedAttentionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsedAttentionMapper {
    long countByExample(UsedAttentionExample example);

    int deleteByExample(UsedAttentionExample example);

    int deleteByPrimaryKey(Integer attentionid);

    int insert(UsedAttention record);

    int insertSelective(UsedAttention record);

    List<UsedAttention> selectByExample(UsedAttentionExample example);

    UsedAttention selectByPrimaryKey(Integer attentionid);

    int updateByExampleSelective(@Param("record") UsedAttention record, @Param("example") UsedAttentionExample example);

    int updateByExample(@Param("record") UsedAttention record, @Param("example") UsedAttentionExample example);

    int updateByPrimaryKeySelective(UsedAttention record);

    int updateByPrimaryKey(UsedAttention record);
}