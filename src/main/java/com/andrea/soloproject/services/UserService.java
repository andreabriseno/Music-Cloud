package com.andrea.soloproject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.andrea.soloproject.models.LoginUser;
import com.andrea.soloproject.models.User;
import com.andrea.soloproject.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User register(User u, BindingResult result) {
		Optional<User> user = userRepo.findByEmail(u.getEmail());
		if (user.isPresent()) {
			result.rejectValue("email", "Taken", "Email is taken");
		}
		if(!u.getConfirmPassword().equals(u.getPassword())) {
			result.rejectValue("confirmPassword", "Matched", "Passwords do not match");
			return null;
			}
		if (result.hasErrors()) {
			return null;
		}
		u.setPassword(BCrypt.hashpw(u.getPassword(), BCrypt.gensalt()));
		return userRepo.save(u);

		
	}
	public User login(LoginUser l, BindingResult result) {
		Optional<User> user = userRepo.findByEmail(l.getEmail());
		if (!result.hasErrors()) {
			if (user.isPresent()) {
				if (BCrypt.checkpw(l.getPassword(), user.get().getPassword())) {
					return user.get();
				}
			
		}
			result.rejectValue("email", "Login", "Invalid Email or Password");
		
		}
		return null;
	}
	
	public User findById(Long id) {
		Optional<User> user = userRepo.findById(id);
		if(user.isPresent()) {
			return user.get();
		}
		return null;
	}

	public User getById(Long id) {
		Optional<User> user = userRepo.findById(id);
		if (user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}
}
