package com.questions.services;

import com.questions.bean.QuizQuestions;

public interface TeacherService {
	
	public int addQustioninfo(String QuestionType);
	public int addQuestion (QuizQuestions questions);
	public int checkaddedQuestions(int quizInfoId);

}
