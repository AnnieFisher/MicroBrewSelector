package dao;

import entities.Beer;

public interface MicroBrewDao {
	public Beer updateRating (int id, int rating);
//	public User addUser(User user);
//	public User removeUser(User user);
	public boolean login(String username, String password);
	
}
