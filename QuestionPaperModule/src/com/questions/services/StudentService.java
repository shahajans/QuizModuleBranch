package com.questions.services;

import java.util.List;

import com.questions.bean.QuizInfo;
import com.questions.bean.QuizQuestions;

public interface StudentService {
	
	public List<QuizInfo> getSubjectInfo();
	public List<QuizQuestions> getQuizQuestions(int id);

}
