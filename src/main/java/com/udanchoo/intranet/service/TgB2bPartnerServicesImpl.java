package com.udanchoo.intranet.service;


import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.model.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.repository.TgB2bPartnersRepository;





@Service
public class TgB2bPartnerServicesImpl {

	
	@Autowired
	TgB2bPartnersRepository b2bPartnerRepository;
	
	@Autowired
	 private FileStorageService fileStorageService;
	
	
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
	
	
	private static final String UPLOAD_DIR = "c:/uploads/deals";
	

    @Transactional(rollbackFor = Exception.class)
    public void savePartnerAndFile(Tg_B2bPartner_Obj partnerObj) throws IOException {
    	Path directoryPath = Paths.get(fileStorageService.getPartnerLogoLocation().toString());
    	Tg_B2b_Partner_Entity b2bPartnerEntity = new Tg_B2b_Partner_Entity(partnerObj);
    	b2bPartnerRepository.save(b2bPartnerEntity);
        // Upload file
    	String fileName = fileStorageService.storeFile(partnerObj.getLogoFile(),directoryPath);
    }
	
}
