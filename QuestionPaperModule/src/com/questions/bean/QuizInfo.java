package com.questions.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="QUIZINFO")
public class QuizInfo {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="quizInfoId",nullable=false,unique=true)
	private int quizInfoId;
	
	@Column(name="quizType")
	private String quizType;
	
	@Column(name="QUIZNAME")
	private String quizName;

	public int getQuizInfoId() {
		return quizInfoId;
	}

	public void setQuizInfoId(int quizInfoId) {
		this.quizInfoId = quizInfoId;
	}

	public String getQuizType() {
		return quizType;
	}

	public void setQuizType(String quizType) {
		this.quizType = quizType;
	}

	public String getQuizName() {
		return quizName;
	}

	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}
	

}
