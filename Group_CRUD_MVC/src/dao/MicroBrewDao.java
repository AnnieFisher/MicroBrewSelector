package dao;

import entities.Beer;

public interface MicroBrewDao {
	public Beer updateRating (int id, int rating);
}
