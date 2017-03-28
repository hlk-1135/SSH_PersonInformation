package com.hlk.dao;

import com.hlk.model.User;

public interface UserDao {
	
	public void save(User user);
	
	public User findByUser(User user);
	
	public User findByUserId(int id);//根据用户id查找用户
	
	public void update(User user);

}