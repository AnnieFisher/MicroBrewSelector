package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MicroBrewDao;
import entities.Beer;
import entities.User;

@Controller
public class MicroBrewController {
	@Autowired
	private MicroBrewDao dao;
	
	@RequestMapping(path = "UpdateRating.do")
	public ModelAndView updateRating(int id, int rating){
		Beer beer = dao.updateRating(id, rating);
		return new ModelAndView("beer.jsp", "beer", beer);
	}
	
	@RequestMapping(path = "addUser.do")
	public ModelAndView addUser(){
		User user = new User();
		
		
		return new ModelAndView();
		
	}
	
	@RequestMapping(path = "login.do")
	public ModelAndView userLogin(String username, String password)
	{
		boolean flag = dao.login(username, password);
		ModelAndView mv;
		mv = new ModelAndView();
		
		if(flag == true)
		{
			List<Beer> beerList = dao.getBeers();
			mv.addObject("beerList", beerList);
			mv.setViewName("beer.jsp");
			System.out.println("Found user");
		}
		else 
		{
			mv.setViewName("index.html");
			System.out.println("Did not find user");
		}
		
		return mv;
	}

}
