package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Brand;

public class BrandTest {

	private EntityManagerFactory emf;
    private EntityManager em;
	
	@Before
	public void setUp() throws Exception 
	{
		emf = Persistence.
	            createEntityManagerFactory("MicroBrew");
	    em = emf.createEntityManager();
	}

	@Test
	public void test() 
	{
		Brand brand = em.find(Brand.class, 1);
		assertEquals("Bristol Brewing Company", brand.getName());
	}
	
	@After
	public void tearDown() throws Exception 
	{
		em.close();
        emf.close();
	}
}
