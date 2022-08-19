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

class PizzaJointTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PizzaJoint pizzaJoint;

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
		pizzaJoint = em.find(PizzaJoint.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pizzaJoint = null;
	}

//	@Test
//	void test() {
//		fail("Not yet implemented");
//	}
	
	@Test
	void test_pizzaJoint_entity_mapping(){
		assertNotNull(pizzaJoint);
		assertNotNull(pizzaJoint.getImage());
		assertEquals("Slyce Pizza Co.", pizzaJoint.getName());
		assertEquals("https://slycepizzaco.com/", pizzaJoint.getWebsite());
		assertTrue(pizzaJoint.getDescription().contains("Pizza Creations With"));
		assertEquals(true, pizzaJoint.isApproved());
	}
	
	@Test
	void test_dateAdded_to_pizzaJoint_mapping() {
		assertNotNull(pizzaJoint);
		assertEquals(19, pizzaJoint.getDateAdded().getDayOfMonth());
		assertEquals(8, pizzaJoint.getDateAdded().getMonthValue());
		assertEquals(2022, pizzaJoint.getDateAdded().getYear());
	}
	
	@Test
	void test_address_to_pizzaJoint_mapping() {
		assertNotNull(pizzaJoint);
		assertNotNull(pizzaJoint.getAddress());
		assertEquals("Fort Collins", pizzaJoint.getAddress().getCity());
	}
	
	@Test
	void test_addedByUser_to_pizzaJoint_mapping() {
		assertNotNull(pizzaJoint);
		assertNotNull(pizzaJoint.getAddedByUser());
		assertEquals("Tiarra", pizzaJoint.getAddedByUser().getFirstName());
	}
	
	@Test
	void test_attributes_to_pizzaJoint_mapping() {
		assertNotNull(pizzaJoint);
		assertNotNull(pizzaJoint.getAttributes());
		assertTrue(pizzaJoint.getAttributes().size() > 0);
	}
	
	@Test
	void test_reviews_to_pizzaJoint_mapping() {
		assertNotNull(pizzaJoint);
		assertNotNull(pizzaJoint.getReviews());
		assertTrue(pizzaJoint.getReviews().size() > 0);
	}

}
