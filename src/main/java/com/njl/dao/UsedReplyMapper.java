package com.njl.dao;

import com.njl.bean.UsedReply;
import com.njl.bean.UsedReplyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsedReplyMapper {
    long countByExample(UsedReplyExample example);

    int deleteByExample(UsedReplyExample example);

    int deleteByPrimaryKey(Integer replyid);

    int insert(UsedReply record);

    int insertSelective(UsedReply record);

    List<UsedReply> selectByExample(UsedReplyExample example);

    UsedReply selectByPrimaryKey(Integer replyid);

    int updateByExampleSelective(@Param("record") UsedReply record, @Param("example") UsedReplyExample example);

    int updateByExample(@Param("record") UsedReply record, @Param("example") UsedReplyExample example);

    int updateByPrimaryKeySelective(UsedReply record);

    int updateByPrimaryKey(UsedReply record);
}