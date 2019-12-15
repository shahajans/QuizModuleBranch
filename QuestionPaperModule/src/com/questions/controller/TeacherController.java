package com.questions.controller;



import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.question.beabform.QuizQuestionsform;
import com.questions.bean.QuizQuestions;
import com.questions.services.TeacherService;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService  teacherService;
	
	ModelAndView modelAndView;
	
	
	@RequestMapping(value="/createQuiz", method= {RequestMethod.GET,RequestMethod.POST})
	public String createQuiz(Model model)
	{
		
		
		return "/Teacher/createQuizInfo";
	}
	
	@RequestMapping(value="/createQuizInfo", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView createQuizInfo(@ModelAttribute("QuizType")String QuizType, Model model)
	{
		int questionInfoID=teacherService.addQustioninfo(QuizType);
		
		model.addAttribute("questionInfoID", questionInfoID);
		modelAndView=new ModelAndView("/Teacher/createQuizQues");
		QuizQuestionsform quesform=new QuizQuestionsform();
		modelAndView.addObject("Quesform",quesform);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/createQues", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView createQues(@ModelAttribute("Quesform")QuizQuestionsform quizQuestionsform, Model model)
	{
		int result=0;
		int value=0;
		 QuizQuestions quizQuestion=quizQuestionsform.getQuizQuestions();
	     result=teacherService.addQuestion(quizQuestion);
	    if (result!=0)
	    {
	    	 value=teacherService.checkaddedQuestions(quizQuestion.getQuizinfoid());
	    }
		if(value<10) {
		modelAndView=new ModelAndView("/Teacher/createQuizQues");
		QuizQuestionsform quesform=new QuizQuestionsform();
		model.addAttribute("questionInfoID", quizQuestion.getQuizinfoid());
		modelAndView.addObject("Quesform",quesform);
		}else {
			String success = "Question Paper submited sucessfully";
			String error = (String) model.asMap().get("error");
			
			model.addAttribute("success",success);
			model.addAttribute("error",error);
			model.addAttribute("flag", model.asMap().get("flag"));
			modelAndView =new ModelAndView("/Login/TeacherHome");
		}
		
		return modelAndView;
	}
	
	

}
