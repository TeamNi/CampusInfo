package com.njl.dao;

import com.njl.bean.BlogPic;
import com.njl.bean.BlogPicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BlogPicMapper {
    long countByExample(BlogPicExample example);

    int deleteByExample(BlogPicExample example);

    int deleteByPrimaryKey(Integer bpicid);

    int insert(BlogPic record);

    int insertSelective(BlogPic record);

    List<BlogPic> selectByExample(BlogPicExample example);

    BlogPic selectByPrimaryKey(Integer bpicid);

    int updateByExampleSelective(@Param("record") BlogPic record, @Param("example") BlogPicExample example);

    int updateByExample(@Param("record") BlogPic record, @Param("example") BlogPicExample example);

    int updateByPrimaryKeySelective(BlogPic record);

    int updateByPrimaryKey(BlogPic record);
}