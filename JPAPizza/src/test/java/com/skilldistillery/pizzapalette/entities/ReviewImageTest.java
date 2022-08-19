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

class ReviewImageTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ReviewImage reviewImage;

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
		reviewImage = em.find(ReviewImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		reviewImage = null;
	}

//	@Test
//	void test() {
//		fail("Not yet implemented");
//	}
	
	@Test
	void test_reviewImage_entity_mapping(){
		assertNull(reviewImage);
//		assertEquals("", reviewImage.getImageUrl());
	}
	
	@Test
	void test_pizzaJoint_to_reviewImage_mapping() {
		assertNull(reviewImage);
//		assertTrue(reviewImage.getReview().getComments().contains("Great pizza and"));
	}
	
}
