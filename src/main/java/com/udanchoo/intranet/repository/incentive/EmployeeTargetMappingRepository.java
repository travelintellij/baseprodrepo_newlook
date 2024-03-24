package com.udanchoo.intranet.repository.incentive;

import org.springframework.data.jpa.repository.JpaRepository;

import com.udanchoo.intranet.entity.EmployeeTargetMappingEntity;

public interface EmployeeTargetMappingRepository extends JpaRepository<EmployeeTargetMappingEntity, Long> {

    boolean existsByUserIdAndFinancialYearAndTargetAmount(int userId, String financialYear, double targetAmount);

    // Add custom query methods if needed
}

