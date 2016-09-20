package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	@RequestMapping("SignOut.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.html");
		return mv;
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

		mv.addObject("currentUser", newUser);
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");

		return mv;

	}

	@RequestMapping(path = "removeUser.do")
	public ModelAndView removeUser(@ModelAttribute("currentUser") User currentUser) {
		int id = currentUser.getId();
		dao.removeUser(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.html");
		return mv;

	}

	@RequestMapping(path = "goToEdit.do")
	public ModelAndView goToEdit(@ModelAttribute("currentUser") User currentUser) {
		return new ModelAndView("editUser.jsp", "user", currentUser);
	}

	@RequestMapping(path = "editUser.do")
	public ModelAndView editUser(String firstName, String lastName, String city, String state,
			@ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();

		int id = currentUser.getId();
		dao.updateUser(id, firstName, lastName, city, state);
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

		User login = dao.login(username, password);
		System.out.println("test");

		if (!login.getUsername().equals("INVALID")) {
			List<Beer> beerList = dao.getBeers();
			mv.addObject("currentUser", login);
			mv.addObject("beerList", beerList);
			mv.setViewName("beer.jsp");
			System.out.println("Found user");
		} else {
			System.out.println("Did not find user");
			mv.setViewName("index.html");

		}

		System.out.println(login.getFirstName());

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

	@RequestMapping(path = "addToFavorites.do")
	public ModelAndView addToFavorites(int addBeerId, @ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();
		dao.addToFavorites(addBeerId, currentUser);
		List<Beer> beerList = dao.getBeers();
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");

		return mv;
	}

	@RequestMapping(path = "removeFromFavorites.do")
	public ModelAndView removeFromFavorites(int removeBeerId, @ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();
		int id = currentUser.getId();
		dao.removeFromFavorites(removeBeerId, currentUser);
		List<Beer> favorites = dao.getUserFavorites(id);
		mv.addObject("faveList", favorites);
		mv.setViewName("faves.jsp");

		return mv;
	}

	@RequestMapping(path = "goToBeers.do")
	public ModelAndView goToBeers(@ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();
		List<Beer> beerList = dao.getBeers();
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");
		return mv;
	}

	@RequestMapping("goToOptions.do")
	public ModelAndView goToOptions(@ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("tasteList", dao.getTasteList());
		mv.addObject("brandList", dao.getBrandList());
		mv.addObject("typeList", dao.getTypeList());
		mv.addObject("styleList", dao.getStyleList());
		mv.setViewName("options.jsp");
		return mv;
	}

	@RequestMapping("goToDetails.do")
	public ModelAndView goToDetails(int id, @ModelAttribute("currentUser") User currentUser) {
		Beer beer = dao.getBeer(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("beer", beer);
		mv.addObject("user", currentUser);
		mv.setViewName("details.jsp");

		return mv;

	}

	@RequestMapping(path = "GetType.do")
	public ModelAndView getType(int id) {
		List<Beer> beerTypes = dao.getType(id);
		return new ModelAndView("selections.jsp", "beerList", beerTypes);

	}

	@RequestMapping(path = "GetTaste.do")
	public ModelAndView getTaste(int id) {
		List<Beer> beerTastes = dao.getTaste(id);
		return new ModelAndView("selections.jsp", "beerList", beerTastes);

	}

	@RequestMapping(path = "GetStyle.do")
	public ModelAndView getStyle(int id) {
		List<Beer> beerStyles = dao.getStyle(id);
		return new ModelAndView("selections.jsp", "beerList", beerStyles);

	}

	@RequestMapping(path = "GetBrand.do")
	public ModelAndView getBrand(int id) {
		List<Beer> beerBrands = dao.getBrand(id);
		return new ModelAndView("selections.jsp", "beerList", beerBrands);

	}

	@RequestMapping(path = "goToSuggestBeer.do")
	public ModelAndView suggestBeer(@ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("tasteList", dao.getTasteList());
		mv.addObject("brandList", dao.getBrandList());
		mv.addObject("typeList", dao.getTypeList());
		mv.addObject("styleList", dao.getStyleList());
		mv.setViewName("suggestBeer.jsp");
		return mv;
	}

	@RequestMapping(path = "suggestBeer.do")
	public ModelAndView suggestBeer(String name, int rating, int styleId, int typeId, int tasteId, int brandId) {
		dao.addSuggestions(name, rating, styleId, typeId, tasteId, brandId);
		ModelAndView mv = new ModelAndView();
		List<Beer> beerList = dao.getBeers();
		mv.addObject("beerList", beerList);
		mv.setViewName("beer.jsp");
		return mv;
	}

	@RequestMapping(path = "addToFavoritesFromDetails.do")
	public ModelAndView addToFavoritesFromDetails(int addBeerId, @ModelAttribute("currentUser") User currentUser) {
		ModelAndView mv = new ModelAndView();
		dao.addToFavorites(addBeerId, currentUser);
		int id = currentUser.getId();
		List<Beer> favorites = dao.getUserFavorites(id);
		mv.addObject("faveList", favorites);
		mv.setViewName("faves.jsp");
		return mv;
	}

}
