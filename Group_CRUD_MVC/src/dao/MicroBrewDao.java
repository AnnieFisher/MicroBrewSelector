package dao;

import java.util.List;

import entities.Beer;
import entities.User;

public interface MicroBrewDao {
	public Beer updateRating (int id, int rating);
//	public User addUser(User user);
//	public User removeUser(User user);
	public boolean login(String username, String password);
	public List<Beer> getBeers();
	public List<Beer> getUserFavorites(int id);
	
}
