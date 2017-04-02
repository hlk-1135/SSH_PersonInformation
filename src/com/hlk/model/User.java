package com.hlk.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 用户类，对应user表
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "information")
public class User implements java.io.Serializable {

	// Fields
	
	private Integer userId;
	private String userName;
	private String password;
	private String work;
	private String realName;
	private String phone;
	private Set<Friends> friendses = new HashSet<Friends>(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String password, String work, String realName,
			String phone) {
		this.userName = userName;
		this.password = password;
		this.work = work;
		this.realName = realName;
		this.phone = phone;
	}

	/** full constructor */
	public User(String userName, String password, String work, String realName,
			String phone, Set<Friends> friendses) {
		this.userName = userName;
		this.password = password;
		this.work = work;
		this.realName = realName;
		this.phone = phone;
		this.friendses = friendses;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userId", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "userName", nullable = false, length = 100)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "password", nullable = false, length = 100)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "work", nullable = false, length = 100)
	public String getWork() {
		return this.work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	@Column(name = "realName", nullable = false, length = 100)
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "phone", nullable = false, length = 100)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Friends> getFriendses() {
		return this.friendses;
	}

	public void setFriendses(Set<Friends> friendses) {
		this.friendses = friendses;
	}

}