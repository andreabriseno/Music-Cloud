package com.andrea.soloproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.andrea.soloproject.models.LoginUser;
import com.andrea.soloproject.models.Music;
import com.andrea.soloproject.models.User;
import com.andrea.soloproject.services.MusicService;
import com.andrea.soloproject.services.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userServ;
	@Autowired
	private MusicService musicServ;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute(name="user") User user, BindingResult result, Model model, HttpSession session) {
		User newUser = userServ.register(user, result);
		if(newUser == null) {
			model.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("userId", newUser.getId());
		return "redirect:/musicboard";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute(name="loginUser") LoginUser loginUser, BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(loginUser, result);
		if(user == null) {
			model.addAttribute("user", new User());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/musicboard";
	}
	
	@GetMapping("/musicboard")
	public String musicboard(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId =(Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		model.addAttribute("user", user);
		List<Music> myMusic = musicServ.getAllByUser(userId);
		List<Music> otherMusic = musicServ.getOtherMusic(userId);
		model.addAttribute("myMusic", myMusic);
		model.addAttribute("otherMusic", otherMusic);
		return "musicboard.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/";
	}
}
