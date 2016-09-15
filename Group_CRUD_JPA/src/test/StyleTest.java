package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Style;

public class StyleTest {

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
		Style style = em.find(Style.class, 1);
		assertEquals("Amber", style.getName());
	}
	
	@After
	public void tearDown() throws Exception 
	{
		em.close();
        emf.close();
	}
}
