package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Beer;
import entities.Brand;
import entities.Style;
import entities.Taste;
import entities.Type;
import entities.User;

@Transactional
public class MicroBrewDBDao implements MicroBrewDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Beer updateRating(int id, int rating) {

		Beer beer = em.find(Beer.class, id);
		beer.setRating(rating);
		return beer;
	}

	@Override
	public User login(String username, String password) {

		User login = new User();
		
		String querytxt = "SELECT u FROM User u WHERE u.username = ?1 AND u.password = ?2";

		List<User> results = em.createQuery(querytxt, User.class).setParameter(1, username).setParameter(2, password)
				.getResultList();

		if (results.size() == 1) {
			login = results.get(0);
		} else {
			login.setUsername("INVALID");
			login.setPassword("INVALID");
		}
		return login;
	}

	@Override
	public List<Beer> getBeers() {
		String querytxt = "SELECT b FROM Beer b";

		List<Beer> results = em.createQuery(querytxt, Beer.class).getResultList();

		return results;
	}

	@Override
	public List<Beer> getUserFavorites(int id) {
		User u = em.find(User.class, id);

		return u.getFavorites();
	}

	@Override
	public User addUser(String firstName, String lastName, String username, String password, String city,
			String state) {
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setPassword(password);
		user.setCity(city);
		user.setState(state);

		em.persist(user);
		return user;
	}

	@Override
	public void removeUser(int id) {
		User user = em.find(User.class, id);
		em.remove(user);
	}

	@Override
	public void updateUser(String firstName, String lastName, String city, String state) {
		String querytxt = "SELECT u FROM User u WHERE id = ?1";

		int id = 1;

		List<User> results = em.createQuery(querytxt, User.class).setParameter(1, id).getResultList();

		if (results.size() == 1) {
			for (User user : results) {
				if (!firstName.equals("")) {
					user.setFirstName(firstName);
				}
				if (!lastName.equals("")) {
					user.setLastName(lastName);
				}
				if (!city.equals("")) {
					user.setCity(city);
				}
				if (!state.equals("")) {
					user.setState(state);
				}
			}
		}
	}


	
	@Override
	public Beer getBeer(int id){
		return em.find(Beer.class, id);
	}


	
	@Override
	public List<Beer> getStyle(int id) {
		String querytxt = "SELECT b FROM Beer b WHERE b.style.id = ?1";

		List<Beer> results = em.createQuery(querytxt, Beer.class)
				.setParameter(1, id)
				.getResultList();

		return results;
		
	}
	

	
	@Override
	public List<Beer> getType(int id) {
		String querytxt = "SELECT b FROM Beer b WHERE b.type.id = ?1";

		List<Beer> results = em.createQuery(querytxt, Beer.class)
				.setParameter(1, id)
				.getResultList();


		return results;
	}
	

	
	@Override 
	public List<Beer> getTaste(int id) {
		String querytxt = "SELECT b FROM Beer b WHERE b.taste.id = ?1";

		List<Beer> results = em.createQuery(querytxt, Beer.class)
				.setParameter(1, id)
				.getResultList();


		return results;
	}
	
	@Override 
	public List<Beer> getBrand(int id) {
		String querytxt = "SELECT b FROM Beer b WHERE b.brand.id = ?1";

		List<Beer> results = em.createQuery(querytxt, Beer.class)
				.setParameter(1, id)
				.getResultList();
		return results;
	}
	
	@Override
	public List<Type> getTypeList(){
		String querytxt = "SELECT t FROM Type t";

		List<Type> results = em.createQuery(querytxt, Type.class)
				.getResultList();
		return results;
	}
	@Override
	public List<Taste> getTasteList(){
		String querytxt = "SELECT t FROM Taste t";
		
		List<Taste> results = em.createQuery(querytxt, Taste.class)
				.getResultList();
		return results;
	}
	@Override
	public List<Style> getStyleList(){
		String querytxt = "SELECT s FROM Style s";
		
		List<Style> results = em.createQuery(querytxt, Style.class)
				.getResultList();
		return results;
	}
	@Override
	public List<Brand> getBrandList(){
		String querytxt = "SELECT b FROM Brand b";
		
		List<Brand> results = em.createQuery(querytxt, Brand.class)
				.getResultList();
		return results;
	}

	@Override
	public void addToFavorites(int beerId, User user) {
		User currentUser = em.find(User.class, user.getId());
		Beer newBeer = em.find(Beer.class, beerId);
		currentUser.addBeer(newBeer);
		
		em.persist(currentUser);
	}

	@Override
	public void removeFromFavorites(int beerId, User user) {
		User currentUser = em.find(User.class, user.getId());
		Beer newBeer = em.find(Beer.class, beerId);
		currentUser.removeBeer(newBeer);
		
		em.merge(currentUser);
	}
	
	@Override
	public void addSuggestions(String name, int rating, int styleId, int typeId, int tasteId, int brandId) {
		Beer newBeer = new Beer();
		newBeer.setName(name);
		newBeer.setRating(rating);
		
		Style style = em.find(Style.class, styleId);
		newBeer.setStyle(style);
		
		Type type = em.find(Type.class, typeId);
		newBeer.setType(type);
		
		Taste taste = em.find(Taste.class, tasteId);
		newBeer.setTaste(taste);
		
		Brand brand = em.find(Brand.class, brandId);
		newBeer.setBrand(brand);
		
		em.persist(newBeer);
	}

}
