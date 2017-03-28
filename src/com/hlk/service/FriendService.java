package com.hlk.service;

import java.util.List;

import com.hlk.model.Friends;

public interface FriendService {
	
	/**
	 * 保存联系人
	 * @param friend
	 */
	public void save(Friends friend);

	/**
	 * 更新联系人信息
	 * @param friend
	 */
	public void update(Friends friend);


	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Friends findById(int id);

	/**
	 * 查询全部
	 * @return
	 */
	public List<Friends> getAll();

	/**
	 * 根据联系人名称和手机号条件查询
	 * @param friendName
	 * @return
	 */
	public List<Friends> getAll(String friendName, String friendPhone);
	
	/**
	 * 删除联系人
	 * @param id
	 */
	public void delete(Friends friends);
	
	/**
	 *  删除多个联系人
	 */
	public void deleteMany(int[] ids);

}
