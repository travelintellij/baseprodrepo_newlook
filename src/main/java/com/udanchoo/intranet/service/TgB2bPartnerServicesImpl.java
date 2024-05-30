package com.udanchoo.intranet.service;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Ti_Leads_Team_Map_Entity;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.partner.FilterPartnerObj;
import com.udanchoo.intranet.model.partner.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.repository.TgB2bPartnersRepository;
import com.udanchoo.intranet.util.UdanChooConstants;





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
    	if (partnerObj.getLogoFile() != null && !partnerObj.getLogoFile().isEmpty())
    		fileStorageService.storePartnerLogo(partnerObj.getLogoFile(),directoryPath,partnerObj.getPartnerShortName().trim());
    }
    
    public boolean checkPartnerExistByShortName(String partnerShortName) {
    	return b2bPartnerRepository.existsByPartnerShortName(partnerShortName);
    }
    
    
    public boolean checkPartnerLogoExists(Tg_B2bPartner_Obj partnerObj) {
    	Path directoryPath = Paths.get(fileStorageService.getPartnerLogoLocation().toString());
    	Path jpgFilePath = Paths.get(directoryPath.toString(), partnerObj.getPartnerShortName() + ".jpg");
        Path pngFilePath = Paths.get(directoryPath.toString(), partnerObj.getPartnerShortName() + ".png");
        
        System.out.println(" Absolute PAth is " + jpgFilePath.getParent().toAbsolutePath().toString());
        return Files.exists(jpgFilePath) || Files.exists(pngFilePath);
    	
    }
    
	public Page<Tg_B2b_Partner_Entity>  filterPartners(int pageNo, int pageSize,String sorting,FilterPartnerObj filterPartnerObj,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
		Date criteriaDate = cal.getTime();
		Page<Tg_B2b_Partner_Entity> filteredPartnersList = b2bPartnerRepository.findAll(new Specification<Tg_B2b_Partner_Entity>() {
			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Tg_B2b_Partner_Entity> partnerRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//query.distinct(true);
				List<Predicate> predicates = new ArrayList<>();
				if(filterPartnerObj.getPartnerId()!=0) {
					predicates.add(criteriaBuilder.equal(partnerRootEntity.get("partnerId"), filterPartnerObj.getPartnerId()));
				}
				
				if(filterPartnerObj.getCityId()!=0) {
					predicates.add(criteriaBuilder.equal(partnerRootEntity.get("cityId"), filterPartnerObj.getCityId()));
				}
				if ((filterPartnerObj.getPartnerBrandName() != null) && (filterPartnerObj.getPartnerBrandName().trim().length()>0)) {
					predicates.add(criteriaBuilder.like(criteriaBuilder.lower(partnerRootEntity.get("partnerBrandName")),"%" + filterPartnerObj.getPartnerBrandName().toLowerCase() + "%"));
				}

				if ((filterPartnerObj.getPartnerName() != null) && (filterPartnerObj.getPartnerName().trim().length()>0)) {
					predicates.add(criteriaBuilder.like(criteriaBuilder.lower(partnerRootEntity.get("partnerName")),"%" + filterPartnerObj.getPartnerName().toLowerCase() + "%"));
				}
			
			return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
		}
	},paging);
	
	return filteredPartnersList;
}
	
	public Tg_B2bPartner_Obj getPartnerVoFromEntity(Tg_B2b_Partner_Entity tgPartnerEntity) {
		Tg_B2bPartner_Obj tgPartnerVO = new Tg_B2bPartner_Obj(tgPartnerEntity);
		return tgPartnerVO;
	}
	
	
	
}
