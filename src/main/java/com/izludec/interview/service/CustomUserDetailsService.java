/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.izludec.interview.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("customUserDetailsService") 
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserManager userManager;
	
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		return userManager.getUser(username);
	}

}