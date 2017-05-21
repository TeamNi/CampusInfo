package com.njl.bean;

public class BlogPic {
    private Integer bpicid;

    private Integer blogid;

    private String pictureurl;

    public Integer getBpicid() {
        return bpicid;
    }

    public void setBpicid(Integer bpicid) {
        this.bpicid = bpicid;
    }

    public Integer getBlogid() {
        return blogid;
    }

    public void setBlogid(Integer blogid) {
        this.blogid = blogid;
    }

    public String getPictureurl() {
        return pictureurl;
    }

    public void setPictureurl(String pictureurl) {
        this.pictureurl = pictureurl == null ? null : pictureurl.trim();
    }

	@Override
	public String toString() {
		return "BlogPic [bpicid=" + bpicid + ", blogid=" + blogid + ", pictureurl=" + pictureurl + "]";
	}

	public BlogPic(Integer bpicid, Integer blogid, String pictureurl) {
		super();
		this.bpicid = bpicid;
		this.blogid = blogid;
		this.pictureurl = pictureurl;
	}

	public BlogPic() {
		super();
	}
}