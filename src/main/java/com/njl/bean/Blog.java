package com.njl.bean;

import java.util.Date;

public class Blog {
    private Integer blogid;

    private Integer userid;

    private Date createtime;

    private String title;

    private String content;

    private String pictureurl;

    private Integer replytimes;

    @Override
	public String toString() {
		return "Blog [blogid=" + blogid + ", userid=" + userid + ", createtime=" + createtime + ", title=" + title
				+ ", content=" + content + ", pictureurl=" + pictureurl + ", replytimes=" + replytimes + "]";
	}

	public Blog() {
		super();
	}

	public Blog(Integer blogid, Integer userid, Date createtime, String title, String content, String pictureurl,
			Integer replytimes) {
		super();
		this.blogid = blogid;
		this.userid = userid;
		this.createtime = createtime;
		this.title = title;
		this.content = content;
		this.pictureurl = pictureurl;
		this.replytimes = replytimes;
	}

	public Integer getBlogid() {
        return blogid;
    }

    public void setBlogid(Integer blogid) {
        this.blogid = blogid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getPictureurl() {
        return pictureurl;
    }

    public void setPictureurl(String pictureurl) {
        this.pictureurl = pictureurl == null ? null : pictureurl.trim();
    }

    public Integer getReplytimes() {
        return replytimes;
    }

    public void setReplytimes(Integer replytimes) {
        this.replytimes = replytimes;
    }
}