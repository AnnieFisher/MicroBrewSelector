package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.swing.text.Style;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Beer;
import entities.Brand;
import entities.Taste;
import entities.Type;

public class BeerTest 
{

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
		Beer beer = em.find(Beer.class, 1);
		assertEquals("Laughing Lab", beer.getName());
		
		Type type = beer.getType();
		assertEquals("Ale", type.getName());
		
		Taste taste = beer.getTaste();
		assertEquals("Nutty", taste.getName());
		
		entities.Style style = beer.getStyle();
		assertEquals("Red", style.getName());
		
		Brand brand = beer.getBrand();
		assertEquals("Bristol Brewing Company", brand.getName());
	}
	
	@After
	public void tearDown() throws Exception 
	{
		em.close();
        emf.close();
	}
}
