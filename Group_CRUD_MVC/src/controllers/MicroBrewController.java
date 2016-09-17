package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.MicroBrewDao;
import entities.Beer;
import entities.User;

@Controller
@SessionAttributes("currentUser")
public class MicroBrewController {
	@Autowired
	private MicroBrewDao dao;

	@ModelAttribute("currentUser")
	public User initSessionObject() {
		return null;
	}

	@RequestMapping(path = "UpdateRating.do")
	public ModelAndView updateRating(int id, int rating) {
		Beer beer = dao.updateRating(id, rating);
		return new ModelAndView("beer.jsp", "beer", beer);
	}

	@RequestMapping(path = "addUser.do")
	public ModelAndView addUser(String firstName, String lastName, String username, String password, String city,
			String state) {
		ModelAndView mv = new ModelAndView();

		User newUser = dao.addUser(firstName, lastName, username, password, city, state);

		List<Beer> beerList = dao.getBeers();
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");

		return mv;

	}

	@RequestMapping(path = "removeUser.do")
	public ModelAndView removeUser(int id) {
		dao.removeUser(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("index.html");
		return mv;

	}

	@RequestMapping(path = "editUser.do")
	public ModelAndView editUser(String firstName, String lastName, String city, String state) {
		dao.updateUser(firstName, lastName, city, state);
		return null;
	}

	@RequestMapping(path = "login.do")
	public ModelAndView userLogin(String username, String password) {
		User login = dao.login(username, password);
		ModelAndView mv;
		mv = new ModelAndView();

		if (!login.getUsername().equals(null)) {
			List<Beer> beerList = dao.getBeers();
			mv.addObject("currentUser", login);
			mv.addObject("beerList", beerList);
			mv.setViewName("beer.jsp");
			System.out.println("Found user");
		} else {
			mv.setViewName("index.html");
			System.out.println("Did not find user");
		}

		return mv;
	}

	@RequestMapping(path = "goToFavorites.do")
	public ModelAndView goToFavorites() {
		int id = 1;
		ModelAndView mv = new ModelAndView();
		List<Beer> favorites = dao.getUserFavorites(id);
		mv.addObject("faveList", favorites);
		mv.setViewName("faves.jsp");
		return mv;
	}

	@RequestMapping(path = "goToBeers.do")
	public ModelAndView goToBeers() {
		ModelAndView mv = new ModelAndView();
		List<Beer> beerList = dao.getBeers();
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");
		return mv;
	}

}
