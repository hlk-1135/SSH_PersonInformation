package com.hlk.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hlk.dao.FileDao;
import com.hlk.model.Files;
import com.hlk.model.Friends;
import com.hlk.model.User;

@Repository("FileDao")
@SuppressWarnings("all")
public class FileDaoImpl implements FileDao {

	
private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	@Override
	public boolean save(Files files) {
		
		try {
			this.getCurrentSession().save(files);
			return true;
		} catch (Exception e) {
			e.printStackTrace();  
            return false;
		}
	}

	@Override
	public List<Files> getAllFiles() {
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
		int uid = user.getUserId();
		return (List<Files>) this.getCurrentSession()
				.createQuery("from Files where userId=?")
				.setInteger(0, uid)
				.list();
	}

}
