package com.project.jeju.model;

import java.sql.Date;

public class MemberBean {
	private String id;
	private String passwd1;
	private String passwd2;
	private String name;
	private String nickname;
	private String age;
	private String gender;
	private String post;
	private String address1;
	private String address2;
	private String email;
	private String phone;
	private String profile;
	private String info;
	private Date register;
	private int memberpoint;
	private String state;
	private String delcont;
	private Date deldate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd1() {
		return passwd1;
	}

	public void setPasswd1(String passwd1) {
		this.passwd1 = passwd1;
	}

	public String getPasswd2() {
		return passwd2;
	}

	public void setPasswd2(String passwd2) {
		this.passwd2 = passwd2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getRegister() {
		return register;
	}

	public void setRegister(Date register) {
		this.register = register;
	}

	public int getMemberpoint() {
		return memberpoint;
	}

	public void setMemberpoint(int memberpoint) {
		this.memberpoint = memberpoint;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDelcont() {
		return delcont;
	}

	public void setDelcont(String delcont) {
		this.delcont = delcont;
	}

	public Date getDeldate() {
		return deldate;
	}

	public void setDeldate(Date deldate) {
		this.deldate = deldate;
	}

}
