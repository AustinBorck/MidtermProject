package com.skilldistillery.pizzapalette.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAPizza");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

//	@Test
//	void test() {
//		fail("Not yet implemented");
//	}
	
	@Test
	void test_User_entity_mapping(){
		assertNotNull(user);
		assertEquals("tiarrablandin", user.getUsername());
		assertEquals("admin1", user.getPassword());
		assertEquals("Tiarra", user.getFirstName());
		assertEquals("Blandin", user.getLastName());
		assertEquals(true, user.isEnabled());
		assertEquals("admin", user.getRole());
	}
	
	@Test
	void test_pizzaJoint_to_user_mapping() {
		assertNotNull(user);
		assertNotNull(user.getPizzaJoints());
		assertTrue(user.getPizzaJoints().size() > 0);
	}
	
//	@Test
//	void test_address_to_user_mapping() {
//		assertNotNull(user);
//		assertNotNull(user.getAddress());
//		assertEquals("", user.getAddress().getStreet());
//	}
	
	@Test
	void test_reviwes_to_user_mapping() {
		assertNotNull(user);
		assertNotNull(user.getReviews());
		assertTrue(user.getReviews().size() > 0);
	}

}
