package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Beer;
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
			System.out.println("Results =  1");
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

		for (Beer beer : results) {
			System.out.println(beer.getName());
		}
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
	public Beer getBeer(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
