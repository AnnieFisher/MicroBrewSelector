package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Type;

public class TypeTest {

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
		Type type = em.find(Type.class, 1);
		assertEquals("Ale", type.getName());
	}
	
	@After
	public void tearDown() throws Exception 
	{
		em.close();
        emf.close();
	}
}
