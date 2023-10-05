package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;

@Repository
public interface SupplierRepository extends JpaRepository<Tg_Supplier_Master_Entity,Long>,JpaSpecificationExecutor{

	/*
	@Query("FROM UdnSupplierEntity a WHERE a.servicecode=?1 AND a.active=1")
	List<UdnSupplierEntity> find_Active_Service_Based_Suppliers(String serviceCode);
	*/
	@Query("FROM UdnSupplierEntity a WHERE a.servicecode=?1 AND a.active=1")
	List<Tg_Supplier_Master_Entity> find_Active_Service_Based_Suppliers(String serviceCode);
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.flight=true AND a.deleted=0 order by a.supplierName")
	List<Tg_Supplier_Master_Entity> find_Active_Flight_Suppliers();
	
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.hotel=true AND a.deleted=0")
	List<Tg_Supplier_Master_Entity> find_Active_Hotel_Suppliers();
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.insurance=true AND a.deleted=0")
	List<Tg_Supplier_Master_Entity> find_Active_Insurance_Suppliers();
	
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.landPackage=true AND a.deleted=0")
	List<Tg_Supplier_Master_Entity> find_Active_Package_Suppliers();
	
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.others=true AND a.deleted=0")
	List<Tg_Supplier_Master_Entity> find_Active_Others_Suppliers();
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.sightseeing=true AND a.deleted=0")
	List<Tg_Supplier_Master_Entity> find_Active_SightSeeing_Suppliers();
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.transfers=true AND a.deleted=0")
	List<Tg_Supplier_Master_Entity> find_Active_Transfers_Suppliers();
	
	@Query("FROM Tg_Supplier_Master_Entity a WHERE a.visa=true AND a.deleted=0")
	List<Tg_Supplier_Master_Entity> find_Active_Visa_Suppliers();

	
	
} 