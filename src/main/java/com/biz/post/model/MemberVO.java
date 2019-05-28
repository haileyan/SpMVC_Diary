package com.biz.post.model;

public class MemberVO {

	private long b_id;
	private String b_userid;
	private String b_password;
	private String b_repassword;
	private String b_tel;
	private String b_addr;
	
	public long getB_id() {
		return b_id;
	}
	public void setB_id(long b_id) {
		this.b_id = b_id;
	}
	public String getB_userid() {
		return b_userid;
	}
	public void setB_userid(String b_userid) {
		this.b_userid = b_userid;
	}
	public String getB_password() {
		return b_password;
	}
	public void setB_password(String b_password) {
		this.b_password = b_password;
	}
	public String getB_repassword() {
		return b_repassword;
	}
	public void setB_repassword(String b_repassword) {
		this.b_repassword = b_repassword;
	}
	public String getB_tel() {
		return b_tel;
	}
	public void setB_tel(String b_tel) {
		this.b_tel = b_tel;
	}
	public String getB_addr() {
		return b_addr;
	}
	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}
	@Override
	public String toString() {
		return "MemberVO [b_id=" + b_id + ", b_userid=" + b_userid + ", b_password=" + b_password + ", b_repassword="
				+ b_repassword + ", b_tel=" + b_tel + ", b_addr=" + b_addr + "]";
	}
	public MemberVO(long b_id, String b_userid, String b_password, String b_repassword, String b_tel, String b_addr) {
		super();
		this.b_id = b_id;
		this.b_userid = b_userid;
		this.b_password = b_password;
		this.b_repassword = b_repassword;
		this.b_tel = b_tel;
		this.b_addr = b_addr;
	}
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
