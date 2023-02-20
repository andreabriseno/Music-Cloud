package com.andrea.soloproject.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.andrea.soloproject.models.Music;
import com.andrea.soloproject.repositories.MusicRepository;

@Service
public class MusicService {
	
	@Autowired
	private MusicRepository musicRepo;
	
	public Music create(Music m) {
		return musicRepo.save(m);
	}
	
	public List<Music> getAll(){
		return musicRepo.findAll();
	}
	
	public List<Music> getAllByUser(Long id){
		return musicRepo.findAllByUser(id);
		
	}
	
	public List <Music> getOtherMusic(Long id){
		List<Music> allMusic = musicRepo.findAll();
		ArrayList<Music> m = new ArrayList<Music>();
		for(Music mus : allMusic) {
			if(!mus.getUser().getId().equals(id)) {
				m.add(mus);
				
			}
		}
		return m;
	}
	
	public void destroy(Long id) {
		musicRepo.deleteById(id);
	}
	
	public Music getById(Long id) {
		Optional<Music> music = musicRepo.findById(id);
		if(music.isPresent()) {
			return music.get();
		}
		else {
			return null;
		}
		
	}
	
	public Music getOneById(Long id) {
		Optional<Music> m = musicRepo.findById(id);
		if (m.isEmpty()) {
			return null;
		}
		return m.get();
	}
	
	public Music update(Music m) {
		return musicRepo.save(m);
		
	}

}
