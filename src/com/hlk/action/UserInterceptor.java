package com.hlk.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 验证是否登录，没有登录只能访问首页；
 * 登录后才可以进行操作
 * @author lenovo
 *
 */
public class UserInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//获取当前执行的方法
		String methodName = invocation.getProxy().getMethod();
		ActionContext ac = invocation.getInvocationContext();
		//从session中获取登录的用户对象
		Object obj = ac.getSession().get("userInfo");
		
		if(!"login".equals(methodName)) {
			if(obj == null) { //如果session中userInfo对象为null
				return "login";
			} else {
				return invocation.invoke();//允许执行操作
			}
		}
		return invocation.invoke(); 
	}
}