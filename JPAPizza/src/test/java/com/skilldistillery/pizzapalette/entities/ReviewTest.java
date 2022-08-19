package com.skilldistillery.pizzapalette.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ReviewTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Review review;

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
		review = em.find(Review.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		review = null;
	}

//	@Test
//	void test() {
//		fail("Not yet implemented");
//	}
	
	@Test
	void test_review_entity_mapping(){
		assertNotNull(review);
		assertEquals(5, review.getRating());
		assertTrue(review.getComments().contains("Great pizza and"));
	}
	
	@Test
	void test_reviewDate_to_review_mapping() {
		assertNotNull(review);
		assertEquals(19, review.getReviewDate().getDayOfMonth());
		assertEquals(8, review.getReviewDate().getMonthValue());
		assertEquals(2022, review.getReviewDate().getYear());
	}
	
	@Test
	void test_pizzaJoint_to_review_mapping() {
		assertNotNull(review);
		assertNotNull(review.getPizzaJoint());
		assertEquals("Slyce Pizza Co.", review.getPizzaJoint().getName());
	}
	
	@Test
	void test_userReview_to_review_mapping() {
		assertNotNull(review);
		assertNotNull(review.getUserReview());
		assertEquals("tiarrablandin", review.getUserReview().getUsername());
	}
	
	@Test
	void test_reviewImages_to_review_mapping() {
		assertNotNull(review);
		assertNotNull(review.getReviewImages());
		assertTrue(review.getReviewImages().size() == 0);
	}

}
