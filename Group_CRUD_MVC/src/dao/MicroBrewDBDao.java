package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Beer;

@Transactional
public class MicroBrewDBDao implements MicroBrewDao{

	@PersistenceContext
	private EntityManager em;

	@Override
	public Beer updateRating(int id, int rating) {
		
		Beer beer = em.find(Beer.class, id);
		beer.setRating(rating);
		
		return beer;
	}
	
}
