package com.udanchoo.intranet.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.OrderBy;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Services_Master_Entity;

@Repository
public interface UserRepository extends JpaRepository<UdnTeam,Integer>,JpaSpecificationExecutor{
		//UdnTeam findByUserNameAndActive(String userName,boolean active);
		Optional<UdnTeam> findByUsernameAndActive(String userName,boolean active);
		
		Optional<UdnTeam> findByUsernameAndActiveAndDeletedAndAccountLockedAndAccountExpiredAndCredentialsExpired(String userName,boolean active,boolean deleted,boolean locked, boolean accountExpired, boolean credentialsExpired);
		
		Optional<UdnTeam> findByUsername(String userName);
		
		@Query("FROM UdnTeam a WHERE a.active=true")
		List <UdnTeam>findAllActiveUsers();
		
		@Query("FROM Udn_Services_Master_Entity a WHERE a.active=true")
		List <Udn_Services_Master_Entity>findAllActiveUdnServices();
		
		@Query("FROM Udn_Services_Master_Entity a WHERE a.id=?1 AND a.active=true")
		Udn_Services_Master_Entity findUserById(int id);
		
		List<UdnTeam> findByActiveAndAccountExpired(boolean active,boolean isExpired);
		
}