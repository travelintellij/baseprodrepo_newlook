package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.udanchoo.intranet.entity.EmployeeTargetMapping;

public interface EmployeeTargetMappingRepository extends JpaRepository<EmployeeTargetMapping, Long> {

    boolean existsByUserIdAndFinancialYearAndTargetAmount(Long userId, String financialYear, double targetAmount);

    // Add custom query methods if needed
}

