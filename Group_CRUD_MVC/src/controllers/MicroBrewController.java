package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MicroBrewDao;
import entities.Beer;

@Controller
public class MicroBrewController {
	@Autowired
	private MicroBrewDao dao;
	
	@RequestMapping(path = "UpdateRating.do")
	public ModelAndView updateRating(int id, int rating){
		Beer beer = dao.updateRating(id, rating);
		return new ModelAndView("beer.jsp", "beer", beer);
		
	}

}
