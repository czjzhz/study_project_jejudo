package com.project.jeju.model;

import java.sql.Date;

public class MemberBean {
	private String id;
	private String passwd;
	private String name;
	private String nickname;
	private String age;
	private String gender;
	private String zip;
	private String address1;
	private String address2;
	private String email;
	private String phone1;
	private String phone2;
	private String phone3;
	private String profile;
	private String intro;
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

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
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
		return zip;
	}

	public void setPost(String post) {
		this.zip = zip;
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

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	
	public String getPhone() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getIntro() {
		return intro;
	}

	public void setInfo(String intro) {
		this.intro = intro;
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
