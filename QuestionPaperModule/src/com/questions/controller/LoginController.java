
package com.questions.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.question.beabform.Master_UserForm;
import com.question.beabform.QuizQuestionsform;
import com.questions.bean.Master_User;
import com.questions.bean.QuizQuestions;
import com.questions.services.LoginService;



@Controller
public class LoginController {
	
	ModelAndView modelAndView;
	
	@Autowired
	private LoginService loginService; 
	
	@RequestMapping(value="/", method= {RequestMethod.GET,RequestMethod.POST})
	public String getLoginForm(Model model)
	{
		String error = (String) model.asMap().get("error");
		model.addAttribute("passwordAlert",error);
		
		return "/Login/LoginForm";
	}
	
	
	@RequestMapping("/login")
	public String login(@RequestParam String employeeCode, @RequestParam String password,
			RedirectAttributes redirectAttributes, HttpSession session) {
		
		 Integer i=1;
		 Master_User master_User =loginService.getUserDetails(employeeCode, password);

		if (master_User == null) {
			redirectAttributes.addFlashAttribute("error", "Invalid Credentials...!!!");
			return "redirect:/";
		} else if (i.equals(master_User.getUserType())) {
			
			session.setAttribute("masterUser", master_User);
			return "/Login/TeacherHome";
		}else {
			session.setAttribute("masterUser", master_User);
			return "/Login/StudentHome";
		}
	}
	
	@RequestMapping(value = "/Teacherhome",method= {RequestMethod.GET,RequestMethod.POST})
	public String Teacherhome(Model model){
		
		String success = (String) model.asMap().get("success");
		String error = (String) model.asMap().get("error");
		
		model.addAttribute("success",success);
		model.addAttribute("error",error);
		
		return "/Login/TeacherHome";
	}
	
	@RequestMapping(value = "/Studenthome",method= {RequestMethod.GET,RequestMethod.POST})
	public String Studenthome(Model model){
		
		String success = "";
		String error = "";
		
		model.addAttribute("success",success);
		model.addAttribute("error",error);
		model.addAttribute("flag", model.asMap().get("flag"));
		
		return "/Login/StudentHome";
	}
	
	@RequestMapping(value = "/getRegistration",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getRegistration(Model model){
		
		
		modelAndView=new ModelAndView("/Login/Registration");
		Master_UserForm userRegForm=new Master_UserForm();
		modelAndView.addObject("userRegForm", userRegForm);
		
		
		return modelAndView;
	}
	
	
	
	
	@RequestMapping(value="/registration", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView registration(@ModelAttribute("userRegForm")Master_UserForm master_UserForm, Model model)
	{
		int result=0;
		 Master_User quizQuestion=master_UserForm.getMaster_User();
	     result=loginService.addNewUser(quizQuestion);
	    if (result!=0)
	    {
	    	String success = "Registration Succesfully";
	    	model.addAttribute("success",success);
	    	modelAndView=new ModelAndView("/Login/LoginForm");
	    }
	    else {
	    	String error = "registration failed";
	    	model.addAttribute("error",error);
	    	modelAndView=new ModelAndView("/Login/LoginForm");
	    	}
	    return modelAndView;
	    
	}

	@RequestMapping("/LogOut")
	public String LogOut(ModelMap model, HttpSession session)
	{
		session.invalidate();
		return "redirect:/";
	}
	 
}
