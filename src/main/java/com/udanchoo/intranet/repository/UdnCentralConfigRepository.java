package com.udanchoo.intranet.repository;

import com.udanchoo.intranet.entity.UdnCentralConfigEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UdnCentralConfigRepository extends JpaRepository<UdnCentralConfigEntity, Long> {

    UdnCentralConfigEntity findTopByOrderByIdAsc();
}
