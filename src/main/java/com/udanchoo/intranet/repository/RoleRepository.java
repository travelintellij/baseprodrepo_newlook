package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.RoleEntity;
import com.udanchoo.intranet.entity.UdnClientEntity;

@Repository
public interface RoleRepository extends JpaRepository<RoleEntity,Integer>{

	@Query("select distinct roleTarget FROM RoleEntity a")
	List<String> find_All_Roles_Distinct_by_Target();

	List<RoleEntity> findByRoleTarget(String roleTarget);
} 