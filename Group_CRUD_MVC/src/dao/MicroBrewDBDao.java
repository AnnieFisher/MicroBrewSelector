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
	public boolean login(String username, String password) {

		boolean flag = false;
		String querytxt = "SELECT u FROM User u WHERE u.username = ?1 AND u.password = ?2";

		List<User> results = em.createQuery(querytxt, User.class)
				.setParameter(1, username).setParameter(2, password)
				.getResultList();

		if (results.size() == 1) {
			flag = true;
			System.out.println("Results =  1");
		}

		return flag;
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

}
