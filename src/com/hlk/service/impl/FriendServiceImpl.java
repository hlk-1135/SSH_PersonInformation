package com.hlk.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hlk.dao.FriendDao;
import com.hlk.model.Friends;
import com.hlk.service.FriendService;

@Transactional
@Service("friendService")
public class FriendServiceImpl implements FriendService {
	
	@Resource
	private FriendDao friendDao;

	@Override
	public void save(Friends friend) {
		friendDao.save(friend);
	}

	@Override
	public void update(Friends friend) {
		friendDao.update(friend);
	}

	@Override
	public Friends findById(int id) {
		return friendDao.findById(id);
	}

	@Override
	public List<Friends> getAll() {
		return friendDao.getAll();
	}

	@Override
	public List<Friends> getAll(String friendName, String friendPhone) {
		return friendDao.getAll(friendName, friendPhone);
	}

	@Override
	public void delete(Friends friends) {
		friendDao.delete(friends);
	}

}