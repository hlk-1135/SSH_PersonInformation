package com.hlk.action;

import java.util.Map;

import javax.annotation.Resource;
import com.hlk.model.User;
import com.hlk.service.UserService;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends BaseAction implements ModelDriven<User>{
	
	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	@Override
	public User getModel() {
		return user;
	}
	
	private Map<String,Object> session;
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	@Resource
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	 * 登录
	 * @return
	 */
	public String login() {
		User userInfo = userService.login(user);
		if(userInfo == null) {
			return "loginFaild";
		} else {
			session.put("userInfo", userInfo);
			return "index";
		}
	}
	
	public String update() {
		session.put("userInfo", user);
		userService.save(user);
		return "index";
	}

}
