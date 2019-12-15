package com.questions.service_impl;

import java.util.List;

import javax.sound.sampled.LineListener;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.questions.bean.QuizInfo;
import com.questions.bean.QuizQuestions;
import com.questions.services.TeacherService;

@Repository
@Transactional
public class TeacherServiceImpl implements TeacherService {
	
	
	private static final Logger logger = Logger.getLogger(TeacherServiceImpl.class);
	
	private TeacherServiceImpl(){}
	
	private Session session = null;

	private Query query = null;
	
	int resultInt = 0;
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public int addQustioninfo(String QuestionType) {
		// TODO Auto-generated method stub
		
		QuizInfo info=new QuizInfo();
		info.setQuizName(QuestionType);
		
		try {

			session = sessionFactory.getCurrentSession();
			resultInt = (int) session.save(info);
			
		} catch (Exception e) {
			
			logger.error(e.getClass() + " " + e.getMessage());
			logger.error(e.getCause());
			logger.error(e.getMessage());			
			logger.error("Error in logger  of TeacherServiceImpl");
			e.getMessage().getClass();

			e.printStackTrace();
		}
		
		return resultInt;
	}

	@Override
	public int addQuestion(QuizQuestions questions) {
		// TODO Auto-generated method stub
		
		try {

			session = sessionFactory.getCurrentSession();
			resultInt = (int) session.save(questions);
			
		} catch (Exception e) {
			
			logger.error(e.getClass() + " " + e.getMessage());
			logger.error(e.getCause());
			logger.error(e.getMessage());			
			logger.error("Error in logger  of TeacherServiceImpl");
			e.getMessage().getClass();

			e.printStackTrace();
		}
		return resultInt;
	}

	@Override
	public int checkaddedQuestions(int quizInfoId) {
		// TODO Auto-generated method stub
		
		int size=0;
		try {
			session = sessionFactory.getCurrentSession();
			query = session.createSQLQuery("SELECT quizinfoid FROM quizqusetions where quizinfoid= :quizInfoId").setParameter("quizInfoId", quizInfoId);
			List<Integer> integers=query.list();
			size=integers.size();
			System.out.println(size);
		} catch (Exception e) {
			
			logger.error(e.getClass() + " " + e.getMessage());
			logger.error(e.getCause());
			logger.error(e.getMessage());			
			logger.error("Error in logger  of TeacherServiceImpl");
			e.getMessage().getClass();

			e.printStackTrace();
		}
	
	
		return size;
	}

}
