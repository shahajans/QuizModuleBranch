package com.questions.service_impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.questions.bean.QuizInfo;
import com.questions.bean.QuizQuestions;
import com.questions.services.StudentService;

@Repository
@Transactional
public class StudentServiceImpl implements StudentService {
	
private static final Logger logger = Logger.getLogger(TeacherServiceImpl.class);
	
	private StudentServiceImpl(){}
	
	private Session session = null;

	private Query query = null;
	
	@Autowired
	SessionFactory sessionFactory;
	
	int resultInt = 0;

	@Override
	public List<QuizInfo> getSubjectInfo() {
		// TODO Auto-generated method stub
		List<QuizInfo> info=new ArrayList<QuizInfo>();
		
		try {

			session = sessionFactory.getCurrentSession();
			query = session.createQuery("FROM QuizInfo");
			info= query.list();
			
		} catch (Exception e) {
			
			logger.error(e.getClass() + " " + e.getMessage());
			logger.error(e.getCause());
			logger.error(e.getMessage());			
			logger.error("Error in logger  of StudentServiceImpl");
			e.getMessage().getClass();

			e.printStackTrace();
		}
		return info;
	}

	@Override
	public List<QuizQuestions> getQuizQuestions(int id) {
		// TODO Auto-generated method stub
        List<QuizQuestions> info=new ArrayList<QuizQuestions>();
		
		try {
            //id=1;
			session = sessionFactory.getCurrentSession();
			query = session.createQuery("FROM QuizQuestions where quizinfoid= :id").setParameter("id", id);
			info= query.list();
			
		} catch (Exception e) {
			
			logger.error(e.getClass() + " " + e.getMessage());
			logger.error(e.getCause());
			logger.error(e.getMessage());			
			logger.error("Error in logger  of StudentServiceImpl");
			e.getMessage().getClass();

			e.printStackTrace();
		}
		return info;
	}

}
