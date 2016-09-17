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
	public ModelAndView addUser(String firstName, String lastName, String username,
			String password, String city, String state){
		ModelAndView mv = new ModelAndView();
		
		User newUser = dao.addUser(firstName, lastName, username, password, city, state);
		
		
		return mv;
		
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
	
	@RequestMapping(path = "goToFavorites.do")
	public ModelAndView goToFavorites()
	{
		int id = 1;
		ModelAndView mv = new ModelAndView();
		List<Beer> favorites = dao.getUserFavorites(id);
		mv.addObject("faveList", favorites);
		mv.setViewName("faves.jsp");
		return mv;
	}
	@RequestMapping(path = "goToBeers.do")
	public ModelAndView goToBeers(){
		ModelAndView mv = new ModelAndView();
		List<Beer> beerList = dao.getBeers();
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");
		return mv;
	}

}
