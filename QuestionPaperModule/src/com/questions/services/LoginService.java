package com.questions.services;

import com.questions.bean.Master_User;

public interface LoginService {
	
	public Master_User getUserDetails(String userCode,String password);
	
	public int addNewUser(Master_User master_User);

}
