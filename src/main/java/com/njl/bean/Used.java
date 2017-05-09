package com.njl.bean;

import java.util.Date;

public class Used {
    private Integer usedid;

    private Integer userid;

    private Date createtime;

    private String title;

    private Float price;

    private String contact;

    private String content;

    private String pictureurl;

    private Integer attentiontimes;

    public Used() {
		super();
	}

	public Used(Integer usedid, Integer userid, Date createtime, String title, Float price, String contact,
			String content, String pictureurl, Integer attentiontimes) {
		super();
		this.usedid = usedid;
		this.userid = userid;
		this.createtime = createtime;
		this.title = title;
		this.price = price;
		this.contact = contact;
		this.content = content;
		this.pictureurl = pictureurl;
		this.attentiontimes = attentiontimes;
	}

	@Override
	public String toString() {
		return "Used [usedid=" + usedid + ", userid=" + userid + ", createtime=" + createtime + ", title=" + title
				+ ", price=" + price + ", contact=" + contact + ", content=" + content + ", pictureurl=" + pictureurl
				+ ", attentiontimes=" + attentiontimes + "]";
	}

	public Integer getUsedid() {
        return usedid;
    }

    public void setUsedid(Integer usedid) {
        this.usedid = usedid;
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

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
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

    public Integer getAttentiontimes() {
        return attentiontimes;
    }

    public void setAttentiontimes(Integer attentiontimes) {
        this.attentiontimes = attentiontimes;
    }
}