package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class MicroBrewDBDao implements MicroBrewDao{

	@PersistenceContext
	private EntityManager em;
	
}
