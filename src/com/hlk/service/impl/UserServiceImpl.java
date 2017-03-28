package com.hlk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hlk.dao.UserDao;
import com.hlk.model.User;
import com.hlk.service.UserService;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {

	
	@Resource
	private UserDao userDao;
	
	@Override
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	public User login(User user) {
		return userDao.findByUser(user);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public User findUserById(int id) {
		return userDao.findByUserId(id);
	}
}