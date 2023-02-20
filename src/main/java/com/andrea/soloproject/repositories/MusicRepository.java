package com.andrea.soloproject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.andrea.soloproject.models.Music;

@Repository
public interface MusicRepository extends CrudRepository<Music, Long> {
	
	public List <Music> findAll();
	
	@Query(value="SELECT * FROM music WHERE user_id = ?1", nativeQuery = true)
	public List <Music> findAllByUser(Long id);

}
