package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;

@Repository
public interface TgB2bPartnersRepository extends JpaRepository<Tg_B2b_Partner_Entity,Integer>{
		@Query("FROM Tg_B2b_Partner_Entity a WHERE a.active=true")
		List <Tg_B2b_Partner_Entity>find_All_Active_Agents();

		@Query("FROM Tg_B2b_Partner_Entity a WHERE a.partnerId=?1 AND a.active=true")
		Tg_B2b_Partner_Entity find_Active_Agent_ById(int id);
		
}