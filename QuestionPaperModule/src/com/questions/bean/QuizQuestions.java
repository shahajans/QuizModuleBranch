package com.questions.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="QUIZQUSETIONS")
public class QuizQuestions {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="QUESID",nullable=false,unique=true)
	private int quesid;
	
	@Column(name="QUESTION")
	private String question;
	
	@Column(name="OPTIONA")
	private String optiona;
	
	@Column(name="OPTIONB")
	private String optionb;
	
	@Column(name="OPTIONC")
	private String optionc;
	
	@Column(name="OPTIOND")
	private String optiond;
	
	@Column(name="ANSWER")
	private String answer;
	
	@Column(name="QUIZINFOID")
	private int quizinfoid;

	public int getQuesid() {
		return quesid;
	}

	public void setQuesid(int quesid) {
		this.quesid = quesid;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOptiona() {
		return optiona;
	}

	public void setOptiona(String optiona) {
		this.optiona = optiona;
	}

	public String getOptionb() {
		return optionb;
	}

	public void setOptionb(String optionb) {
		this.optionb = optionb;
	}

	public String getOptionc() {
		return optionc;
	}

	public void setOptionc(String optionc) {
		this.optionc = optionc;
	}

	public String getOptiond() {
		return optiond;
	}

	public void setOptiond(String optiond) {
		this.optiond = optiond;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getQuizinfoid() {
		return quizinfoid;
	}

	public void setQuizinfoid(int quizinfoid) {
		this.quizinfoid = quizinfoid;
	}
	
	

}
