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

class AttributeTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Attribute attribute;

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
		attribute = em.find(Attribute.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		attribute = null;
	}

//	@Test
//	void test() {
//		fail("Not yet implemented");
//	}
	
	@Test
	void test_attribute_entity_mapping(){
		assertNotNull(attribute);
		assertEquals("Delivery", attribute.getName());
		assertEquals(null, attribute.getDescription());
	}
	
	@Test
	void test_pizzaJoint_to_attribute_mapping() {
		assertNotNull(attribute);
		assertNotNull(attribute.getPizzaJoints());
		assertTrue(attribute.getPizzaJoints().size() > 0);
	}
	
	@Test
	void test_category_to_attribute_mapping() {
		assertNotNull(attribute);
		assertEquals("Dining", attribute.getCategory().getName());
	}

}
