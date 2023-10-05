package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Destinations_Map_Entity;

@Repository
public interface SupplierDestinationsMapRepository extends JpaRepository<Tg_Supplier_Destinations_Map_Entity,Long>,JpaSpecificationExecutor{
} 