package com.skilldistillery.pizzapalette.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Attribute {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@ManyToMany(mappedBy = "attributes")
	private List<PizzaJoint> pizzaJoints;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	
	////////////////////////////GENERATED////////////////////////////

	public Attribute() {
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<PizzaJoint> getPizzaJoints() {
		return pizzaJoints;
	}

	public void setPizzaJoints(List<PizzaJoint> pizzaJoints) {
		this.pizzaJoints = pizzaJoints;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Attribute other = (Attribute) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Attribute [id=" + id + ", name=" + name + ", description=" + description + "]";
	}

}
