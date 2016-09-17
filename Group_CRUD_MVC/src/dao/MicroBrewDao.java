package dao;

import java.util.List;

import entities.Beer;
import entities.User;

public interface MicroBrewDao {
	public Beer updateRating (int id, int rating);
	public User addUser(String firstName, String lastName, String username,
			String password, String city, String state);
	public User login(String username, String password);
	public List<Beer> getBeers();
	public List<Beer> getUserFavorites(int id);
	public void removeUser(int id);
	public void updateUser(String firstName, String lastName,
			 String city, String state);
	
	
}
