package com.udanchoo.intranet.service;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.repository.TgB2bPartnersRepository;





@Service
public class TgB2bPartnerServicesImpl {

	
	@Autowired
	TgB2bPartnersRepository b2bPartnerRepository;
	
	
	public Tg_B2b_Partner_Entity findPartnerById(int partnerId) {
		Optional<Tg_B2b_Partner_Entity> entityOptional = b2bPartnerRepository.findById(partnerId);
		if(entityOptional.isPresent()) {
			return entityOptional.get();
		}
		else {
			return null;
		}
		
	}
	
	public List<Tg_B2b_Partner_Entity> findAllActivePartners() {
		return b2bPartnerRepository.find_All_Active_Agents();
	}
	
	public HashMap<Integer, String> find_All_B2bPartners_Map() {
		List<Tg_B2b_Partner_Entity> b2bPartnersList =  findAllActivePartners();
		Iterator<Tg_B2b_Partner_Entity> itrPartnerEntity = b2bPartnersList.iterator();
		HashMap<Integer, String> b2bPartnerMap = new HashMap<Integer, String>();
		while(itrPartnerEntity.hasNext()) {
			Tg_B2b_Partner_Entity partnerEntity = (Tg_B2b_Partner_Entity)itrPartnerEntity.next();
			b2bPartnerMap.put(partnerEntity.getPartnerId(), partnerEntity.getPartnerName());
		}
		return b2bPartnerMap ;
	}
	
}
