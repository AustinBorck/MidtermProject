package com.skilldistillery.pizzapalette.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int rating;

	private String comments;

	@CreationTimestamp
	@Column(name = "review_date")
	private LocalDateTime reviewDate;

	private boolean active;

	@ManyToOne
	@JoinColumn(name = "pizza_joint_id")
	private PizzaJoint pizzajoint;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User userReview;
	
	@OneToMany(mappedBy = "review")
	private List<ReviewImage> reviewImages;
	

	public Review() {
		super();
	}

	public List<ReviewImage> getReviewImages() {
		return reviewImages;
	}

	public void setReviewImages(List<ReviewImage> reviewImages) {
		this.reviewImages = reviewImages;
	}

	public User getUserReview() {
		return userReview;
	}

	public void setUserReview(User userReview) {
		this.userReview = userReview;
	}

	public PizzaJoint getPizzajoint() {
		return pizzajoint;
	}

	public void setPizzajoint(PizzaJoint pizzajoint) {
		this.pizzajoint = pizzajoint;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public LocalDateTime getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(LocalDateTime reviewDate) {
		this.reviewDate = reviewDate;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
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
		Review other = (Review) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", rating=" + rating + ", comments=" + comments + ", reviewDate=" + reviewDate
				+ ", active=" + active + "]";
	}

}
