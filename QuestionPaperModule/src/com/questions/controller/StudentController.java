package com.questions.controller;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.question.beabform.QuizQuestionsform;
import com.questions.bean.QuizInfo;
import com.questions.bean.QuizQuestions;
import com.questions.services.StudentService;

@Controller
public class StudentController {
	
	ModelAndView modelAndView;
	
	@Autowired
	StudentService studentService;
	
	String jsonResult;
	
	@RequestMapping(value="/getQuizSubPage", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getQuizSubPage(Model model)
	{
		modelAndView=new ModelAndView("/Student/TakeQuiz");
		
		List<QuizInfo> info=  studentService.getSubjectInfo();
		model.addAttribute("quizInfolist", info);
		
		return modelAndView;
	}
	
	/*
	 * @RequestMapping(value = "/getQuizQuestions", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public @ResponseBody String
	 * getQuizQuestions(@RequestBody String id) throws JsonGenerationException,
	 * JsonMappingException, IOException { ObjectMapper mapper = new ObjectMapper();
	 * 
	 * List<QuizQuestions> getQuizQuestions = studentService
	 * .getQuizQuestions(Integer.parseInt(id));
	 * 
	 * jsonResult = mapper.writeValueAsString(getQuizQuestions);
	 * 
	 * return jsonResult; }
	 */
	
	@RequestMapping(value="/getTakeQuiz", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getTakeQuiz(@ModelAttribute("ddlQuizType")String QuizType,Model model)
	{
		
		List<QuizQuestions> quizQuestions = studentService
				.getQuizQuestions(Integer.parseInt(QuizType));
		modelAndView=new ModelAndView("/Student/QuizQuestions");
		model.addAttribute("quizQuestions", quizQuestions);
		model.addAttribute("QuizType",QuizType);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/getQuizResult", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getQuizResult(@ModelAttribute("1")String question1,@ModelAttribute("2")String question2,
			@ModelAttribute("3")String question3,@ModelAttribute("4")String question4,@ModelAttribute("5")String question5,
			@ModelAttribute("6")String question6,@ModelAttribute("7")String question7,@ModelAttribute("8")String question8,
			@ModelAttribute("9")String question9,@ModelAttribute("10")String question10,Model model,
			@ModelAttribute("QuizType")String quizType)
	{
		int total=0;
		List<QuizQuestions> quizQuestions = studentService
				.getQuizQuestions(Integer.parseInt(quizType));
		if(quizQuestions.get(0).getAnswer().equals(question1))
			total++;
		if(quizQuestions.get(1).getAnswer().equals(question2))
			total++;
		if(quizQuestions.get(2).getAnswer().equals(question3))
			total++;
		if(quizQuestions.get(3).getAnswer().equals(question4))
			total++;
		if(quizQuestions.get(4).getAnswer().equals(question5))
			total++;
		if(quizQuestions.get(5).getAnswer().equals(question6))
			total++;
		if(quizQuestions.get(6).getAnswer().equals(question7))
			total++;
		if(quizQuestions.get(7).getAnswer().equals(question8))
			total++;
		if(quizQuestions.get(8).getAnswer().equals(question9))
			total++;
		if(quizQuestions.get(9).getAnswer().equals(question10))
			total++;
		
		
		String success = "successfully completed a test with "+total+" marks";
		
		model.addAttribute("success",success);
		
		modelAndView=new ModelAndView("/Login/StudentHome");
		
		return modelAndView;
	}
	
}
