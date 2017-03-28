package com.hlk.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hlk.dao.UserDao;
import com.hlk.model.User;

@Repository("userDao")
@SuppressWarnings("all")
public class UserDaoImpl implements UserDao {
	
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	@Override
	public void save(User user) {
		this.getCurrentSession().save(user);
	}

	//验证登录
	@Override
	public User findByUser(User user) {
		return (User) this.getCurrentSession()
				.createQuery("from User where userName=? and password=?")
				.setString(0, user.getUserName())
				.setString(1, user.getPassword())
				.uniqueResult();
	}

	@Override
	public void update(User user) {
		this.getCurrentSession().update(user);
	}

	@Override
	public User findByUserId(int id) {
		return (User) this.getCurrentSession()
				.createQuery("from User where userId=?")
				.setInteger(0, id)
				.uniqueResult();
	}
}
