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
		User user = new User();
		return user;
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

//		User newUser = dao.addUser(firstName, lastName, username, password, city, state);

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
	public ModelAndView editUser(String firstName, String lastName, String city, String state,
			@ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();
		
		dao.updateUser(firstName, lastName, city, state);
		List<Beer> beerList = dao.getBeers();
		
		mv.addObject("currentUser", currentUser);
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");
		return mv;
	}

	@RequestMapping(path = "login.do")
	public ModelAndView userLogin(String username, String password) throws Exception {
		ModelAndView mv;
		mv = new ModelAndView();
<<<<<<< HEAD
		System.out.println("in login.do");
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

=======
//		try {
			User login = dao.login(username, password);
			System.out.println("test");

			if (!login.getUsername().equals("INVALID")) {
				List<Beer> beerList = dao.getBeers();
				mv.addObject("currentUser", login);
				mv.addObject("beerList", beerList);
				mv.setViewName("beer.jsp");
				System.out.println("Found user");
			}
			 else {
			 System.out.println("Did not find user");
			 }
//		} catch (Exception e) {
//			mv.setViewName("index.html");
//			System.out.println("Did not find user");
//		}
		System.out.println(login.getFirstName());
>>>>>>> 41f88b818246290e7039d313ec8cfdcaac264438
		return mv;
	}

	@RequestMapping(path = "goToFavorites.do")
	public ModelAndView goToFavorites(@ModelAttribute("currentUser") User currentUser) {
		int id = currentUser.getId();
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
/*	
Ok, so what I'm trying to do is have the link in the table in beer.jsp pass the id of
that beer into this method. Then, I'm attempting to use that id to return that beer
object (I had to add the method to the interface. I've been at it for a while and
am taking a break since my brain is getting burnt out. I'm leaving this giant 
comment in case one of you come accross this before I get it working. 

Currently, every beer name in the beer.jsp is a link to the new details.jsp page, 
which has the skeleton of what it's supposed to do. Before I was attempting to pass
the id, it actually took me to the page, but it didn't populate. When it "worked"
line 132 was line 131 and the method didn't take int id.
*/	
	@RequestMapping("goToDetails.do")
	public ModelAndView goToDetails(int id) {
		
		ModelAndView mv = new ModelAndView();
//		mv.addObject("beerInfo", dao.getBeers());
		mv.addObject("beerInfo", dao.getBeer(id));
		mv.setViewName("details.jsp");
		return mv;
	}

}
