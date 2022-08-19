package com.skilldistillery.pizzapalette.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class PizzaJoint {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="image_url")
	private String image;
	
	private String name;
	
	@Column(name="website_url")
	private String website;
	
	private String description;
	
	private boolean approved;

	@CreationTimestamp
	@Column(name="date_added")
	private LocalDateTime dateAdded;
	
}
