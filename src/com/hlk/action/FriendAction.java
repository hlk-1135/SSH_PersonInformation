package com.hlk.action;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.hlk.model.Friends;
import com.hlk.model.User;
import com.hlk.service.FriendService;
import com.hlk.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FriendAction extends ActionSupport implements ModelDriven<Friends>,RequestAware {

	private static final long serialVersionUID = 1L;
	
	private Friends friends = new Friends();
	private int userId;
	public void setFriends(Friends friends) {
		this.friends = friends;
	}
	public Friends getFriends() {
		return friends;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserId() {
		return userId;
	}
	@Override
	public Friends getModel() {
		return friends;
	}
	
	//联系人Service
	@Resource
	private FriendService friendService;
	public void setFriendService(FriendService friendService) {
		this.friendService = friendService;
	}
	//用户Service
	@Resource
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * 1. 联系人列表展示
	 */
	public String list() {
		List<Friends> listFriends = friendService.getAll();
		request.put("listFriends", listFriends);
		return "list";
	}
	
	/**
	 * 1. 按照姓名模糊查询
	 */
	public String select() {
		String friendName = friends.getFriendName();
		String friendPhone = friends.getFriendPhone();
		List<Friends> listFriends = friendService.getAll(friendName,friendPhone);
		request.put("listFriends", listFriends);
		return "list";
	}
	
	/**
	 * 2. 添加联系人  - 进入到添加页面
	 */
	public String viewAdd() {
		return "add";
	}
	
	/**
	 * 2. 添加联系人  - 添加信息
	 */
	public String save() {
		//先根据userId，查出user对象；再设置到联系人对象中
		User user = userService.findUserById(userId);
		friends.setUser(user);
		// 调用Service，保存联系人
		friendService.save(friends);
		return "frilistAction";
	}
	
	/**
	 *  3. 修改联系人信息 - 进入修改视图
	 */
	public String viewUpdate() {
		//获取出需要修改的联系人的id
		String str = ServletActionContext.getRequest().getParameter("id");
		int num = Integer.parseInt(str);
		//根据id查询出该对象
		Friends fri = friendService.findById(num);
		request.put("fri", fri);
		return "edit";
	}
	
	/**
	 *  3. 修改联系人信息 - 确认修改
	 */
	public String update() {
		//先根据userId，查出user对象；再设置到联系人对象中
		User user = userService.findUserById(userId);
		friends.setUser(user);
		//更新联系人
		friendService.update(friends);
		return "frilistAction";
	}
	
	/**
	 *  4. 删除联系人
	 */
	public String delete() {
		//获取出需要删除的联系人的id
		String str = ServletActionContext.getRequest().getParameter("id");
		int num = Integer.parseInt(str);
		Friends fri = friendService.findById(num);
		friendService.delete(fri);
		return "frilistAction";
	}
	
	// 接收框架运行时候传入的代表request对象的map
	private Map<String, Object> request;
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}