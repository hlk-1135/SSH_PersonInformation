package com.hlk.dao;

import com.hlk.model.User;

public interface UserDao {
	
	public void save(User user);
	
	public User findByUser(User user);
	
	public User findByUserId(int id);
	
	public void update(User user);

}
