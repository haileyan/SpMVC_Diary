package com.biz.post.model;

public class PostVO {

	private	long id;
	private String p_auth;
	private String p_date;
	private String p_title;
	private String p_contents;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getP_auth() {
		return p_auth;
	}
	public void setP_auth(String p_auth) {
		this.p_auth = p_auth;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_contents() {
		return p_contents;
	}
	public void setP_contents(String p_contents) {
		this.p_contents = p_contents;
	}
	@Override
	public String toString() {
		return "PostVO [id=" + id + ", p_auth=" + p_auth + ", p_date=" + p_date + ", p_title=" + p_title
				+ ", p_contents=" + p_contents + "]";
	}
	public PostVO(long id, String p_auth, String p_date, String p_title, String p_contents) {
		super();
		this.id = id;
		this.p_auth = p_auth;
		this.p_date = p_date;
		this.p_title = p_title;
		this.p_contents = p_contents;
	}
	public PostVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}	