package com.hlk.service;

import com.hlk.model.User;

public interface UserService {
	
	/**
	 * 注册
	 * @param user
	 */
	public void save(User user);

	/**
	 * 登陆
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	public void update(User user);
	
	public User findUserById(int id);

}
