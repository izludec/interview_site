
package com.izludec.interview.service;

import com.izludec.interview.domain.User;
import java.util.HashMap;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;



@Service
public class UserManager {
	private HashMap<String, User> users;

	public UserManager() {
		users = new HashMap<String, User>();
		users.put("admin", new User("admin", "admin", "ROLE_ADMIN"));		
	}
	
	public User getUser(String username) throws UsernameNotFoundException{
		if( !users.containsKey( username ) ){
			throw new UsernameNotFoundException( username + " not found" );
		}
		
		return users.get( username );		
        }
}
	