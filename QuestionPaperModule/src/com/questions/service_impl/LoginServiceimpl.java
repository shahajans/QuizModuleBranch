package com.questions.service_impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.questions.bean.Master_User;
import com.questions.services.LoginService;

@Repository
@Transactional
public class LoginServiceimpl implements LoginService {
	
	private LoginServiceimpl() {}
	
	
    private static final Logger logger = Logger.getLogger(LoginServiceimpl.class.getName());
	
	private Session session = null;

	private Query query = null;
	
	@Autowired
	SessionFactory sessionFactory;


	@Override
	public Master_User getUserDetails(String username, String password) {
		// TODO Auto-generated method stub

		Master_User master_User = null;
		try {
	
			session = sessionFactory.openSession();
	
			query = session.createSQLQuery("SELECT * FROM masteruser WHERE username = :username AND password = :password")
					.setParameter("username", username)
					.setParameter("password", password);
			
			
			List<Object[]> rows = query.list();
	
			for (Object[] objects : rows) 
			{
				
				master_User = new Master_User();
				
				master_User.setUserName((String) objects[2]);
				master_User.setPassword((String) objects[4]);
				master_User.setUserType((int) objects[6]);
			}
	
		} catch (Exception e) {
	
				logger.error(e.getClass() + " " + e.getMessage());
				logger.error(e.getCause());
				logger.error(e.getMessage());
				logger.error("Error in logger  of LoginServiceimpl");
				e.getMessage().getClass();
				e.printStackTrace();
		}
		
			return master_User;
	
	}


	@Override
	public int addNewUser(Master_User master_User) {
		int resultInt=0;
		master_User.setIsActive(true);
		try {
		session = sessionFactory.getCurrentSession();
		resultInt = (int) session.save(master_User);
		
	} catch (Exception e) {
		
		logger.error(e.getClass() + " " + e.getMessage());
		logger.error(e.getCause());
		logger.error(e.getMessage());			
		logger.error("Error in logger  of LoginServiceimpl");
		e.getMessage().getClass();

		e.printStackTrace();
	}
	return resultInt;
	}

}
