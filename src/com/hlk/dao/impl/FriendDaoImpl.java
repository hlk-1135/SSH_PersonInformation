package com.hlk.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hlk.dao.FriendDao;
import com.hlk.model.Friends;
import com.hlk.model.User;

@Repository("friendDao")
@SuppressWarnings("all")
public class FriendDaoImpl implements FriendDao {

	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	@Override
	public void save(Friends friends) {
		this.getCurrentSession().save(friends);
	}

	@Override
	public void update(Friends friends) {
		this.getCurrentSession().update(friends);
	}

	@Override
	public void delete(Friends friends) {
		this.getCurrentSession().delete(friends);
	}

	@Override
	public Friends findById(int id) {
		return (Friends) this.getCurrentSession()
		.createQuery("from Friends where friendId=?")
		.setInteger(0, id)
		.uniqueResult();
	}

	@Override
	public List<Friends> getAll() {
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		int uid = user.getUserId();
		return (List<Friends>) this.getCurrentSession()
				.createQuery("from Friends where userId=?")
				.setInteger(0, uid)
				.list();
	}

	/**
	 * 根据姓名和手机号模糊查询
	 */
	@Override
	public List<Friends> getAll(String friendName, String friendPhone) {
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		int uid = user.getUserId();
		return this.getCurrentSession()
				.createQuery("from Friends where friendName like ? and friendPhone like ? and userId=?")
				.setParameter(0, "%" + friendName + "%")
				.setParameter(1, "%" + friendPhone + "%")
				.setInteger(2, uid)
				.list();
	}

}