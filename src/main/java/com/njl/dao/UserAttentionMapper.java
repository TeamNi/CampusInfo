package com.njl.dao;

import com.njl.bean.UserAttention;
import com.njl.bean.UserAttentionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserAttentionMapper {
    long countByExample(UserAttentionExample example);

    int deleteByExample(UserAttentionExample example);

    int deleteByPrimaryKey(Integer attentionid);

    int insert(UserAttention record);

    int insertSelective(UserAttention record);

    List<UserAttention> selectByExample(UserAttentionExample example);

    UserAttention selectByPrimaryKey(Integer attentionid);

    int updateByExampleSelective(@Param("record") UserAttention record, @Param("example") UserAttentionExample example);

    int updateByExample(@Param("record") UserAttention record, @Param("example") UserAttentionExample example);

    int updateByPrimaryKeySelective(UserAttention record);

    int updateByPrimaryKey(UserAttention record);
}