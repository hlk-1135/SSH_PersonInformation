package com.hlk.service;

import com.hlk.model.User;

public interface UserService {
	
	/**
	 * 注册用户
	 * @param user
	 */
	public void save(User user);

	/**
	 * 用户登陆
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	public void update(User user);
	
	/**
	 * 根据主键id查找用户
	 * @param id
	 * @return
	 */
	public User findUserById(int id);
	
	/**
	 * 根据userName查找用户(校验注册时该用户是否已经存在)
	 * @param userName
	 * @return
	 */
	public User findUserByUserName(String userName);

}
