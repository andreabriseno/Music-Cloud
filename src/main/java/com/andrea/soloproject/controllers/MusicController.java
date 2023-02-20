package com.andrea.soloproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andrea.soloproject.models.Music;
import com.andrea.soloproject.models.User;
import com.andrea.soloproject.services.MusicService;
import com.andrea.soloproject.services.UserService;

@Controller
@RequestMapping("/music")
public class MusicController {
	
	@Autowired
	public MusicService musicServ;
	@Autowired
	private UserService userServ;
	
	@GetMapping("/add")
	public String newMusic(@ModelAttribute("music") Music music, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		return "addMusic.jsp";
		
	}
	
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("music") Music music, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return"addMusic.jsp";
		}
		else {
			Long id = (Long) session.getAttribute("userId");
			User user = userServ.findById(id);
			music.setUser(user);
			musicServ.create(music);
			return "redirect:/musicboard";
		}
	}
	
	@GetMapping("/{id}/delete")
	public String destroy(@PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		musicServ.destroy(id);
		return"redirect:/musicboard";
	}
	
	@GetMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return " redirect:/";
		
		}
		model.addAttribute("music", musicServ.getOneById(id));
		return"editMusic.jsp";
	}
	
	@PutMapping("/update")
	public String update(@Valid @ModelAttribute(name="music") Music music, BindingResult result) {
		if (result.hasErrors()) {
			return "editMusic.jsp";
		}
		musicServ.update(music);
		return "redirect:/musicboard";
	}
	
	@GetMapping("/about/{id}")
	public String view(@PathVariable(name="id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Music music = musicServ.getById(id);
		model.addAttribute("music", music);
		Long userId = (Long) session.getAttribute("userId");
		Boolean isAuthor = (music.getUser().getId().equals(userId));
		model.addAttribute("isAuthor",isAuthor);
		return "viewMusic.jsp";
	}
	
	@GetMapping("/{id}/like")
		public String likeMusic(@PathVariable(name="id") Long id, HttpSession session) {
			Long userId =(Long) session.getAttribute("userId");
			if (userId == null) {
					return "redirect:/";
			}
			Music music = musicServ.getById(id);
			User user = userServ.getById(userId);
			music.getLikedBy().add(user);
			musicServ.create(music);
			return "redirect:/musicboard";
			
	}
		
		

}
