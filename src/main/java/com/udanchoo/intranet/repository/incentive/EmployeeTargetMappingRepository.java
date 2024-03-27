package com.udanchoo.intranet.repository.incentive;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.udanchoo.intranet.entity.EmployeeTargetMappingEntity;

public interface EmployeeTargetMappingRepository extends JpaRepository<EmployeeTargetMappingEntity, Long>,JpaSpecificationExecutor {

    boolean existsByUserIdAndFinancialYearAndTargetAmount(int userId, String financialYear, int targetAmount);

    // Add custom query methods if needed
}

