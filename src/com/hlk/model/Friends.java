package com.hlk.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Friends entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "friends", catalog = "information")
public class Friends implements java.io.Serializable {

	// Fields

	private Integer friendId;
	private User user;
	private String friendName;
	private String friendPhone;
	private String friendCompany;
	private String friendQq;

	// Constructors

	/** default constructor */
	public Friends() {
	}

	/** full constructor */
	public Friends(User user, String friendName, String friendPhone,
			String friendCompany, String friendQq) {
		this.user = user;
		this.friendName = friendName;
		this.friendPhone = friendPhone;
		this.friendCompany = friendCompany;
		this.friendQq = friendQq;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "friendId", unique = true, nullable = false)
	public Integer getFriendId() {
		return this.friendId;
	}

	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "friendName", nullable = false, length = 100)
	public String getFriendName() {
		return this.friendName;
	}

	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}

	@Column(name = "friendPhone", nullable = false, length = 100)
	public String getFriendPhone() {
		return this.friendPhone;
	}

	public void setFriendPhone(String friendPhone) {
		this.friendPhone = friendPhone;
	}

	@Column(name = "friendCompany", nullable = false, length = 100)
	public String getFriendCompany() {
		return this.friendCompany;
	}

	public void setFriendCompany(String friendCompany) {
		this.friendCompany = friendCompany;
	}

	@Column(name = "friendQQ", nullable = false, length = 100)
	public String getFriendQq() {
		return this.friendQq;
	}

	public void setFriendQq(String friendQq) {
		this.friendQq = friendQq;
	}

}