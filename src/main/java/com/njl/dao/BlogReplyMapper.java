package com.njl.dao;

import com.njl.bean.BlogReply;
import com.njl.bean.BlogReplyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BlogReplyMapper {
    long countByExample(BlogReplyExample example);

    int deleteByExample(BlogReplyExample example);

    int deleteByPrimaryKey(Integer replyid);

    int insert(BlogReply record);

    int insertSelective(BlogReply record);

    List<BlogReply> selectByExample(BlogReplyExample example);

    BlogReply selectByPrimaryKey(Integer replyid);

    int updateByExampleSelective(@Param("record") BlogReply record, @Param("example") BlogReplyExample example);

    int updateByExample(@Param("record") BlogReply record, @Param("example") BlogReplyExample example);

    int updateByPrimaryKeySelective(BlogReply record);

    int updateByPrimaryKey(BlogReply record);
}