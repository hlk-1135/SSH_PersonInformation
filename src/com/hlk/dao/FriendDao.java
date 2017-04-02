package com.hlk.dao;

import java.util.List;

import com.hlk.model.Friends;

public interface FriendDao {
	
	public void save(Friends friends);
	public void update(Friends friends);
	public void delete(Friends friends);
	public Friends findById(int id);
	public List<Friends> getAll();
	public List<Friends> getAll(String friendName, String friendPhone);

}
