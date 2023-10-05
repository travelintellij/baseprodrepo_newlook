package com.udanchoo.intranet.model;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;

public class Tg_B2bPartner_Obj extends Tg_B2b_Partner_Entity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Tg_B2bPartner_Obj() {}
	
	public Tg_B2bPartner_Obj(Tg_B2b_Partner_Entity agentEntity) {
		this.partnerId = agentEntity.getPartnerId();
		this.partnerName=agentEntity.getPartnerName();
		this.partnerShortName=agentEntity.getPartnerShortName();
		this.partnerBrandName=agentEntity.getPartnerBrandName();
		this.mobile=agentEntity.getMobile();
		this.address=agentEntity.getAddress();
		this.email = agentEntity.getEmail();
		this.cityId=agentEntity.getCityId();
		this.active=agentEntity.isActive();
	}
	
	public void updateVoFromEntity(Tg_B2b_Partner_Entity agentEntity) {
		this.partnerId = agentEntity.getPartnerId();
		this.partnerName=agentEntity.getPartnerName();
		this.mobile=agentEntity.getMobile();
		this.partnerShortName=agentEntity.getPartnerShortName();
		this.partnerBrandName=agentEntity.getPartnerBrandName();
		this.address=agentEntity.getAddress();
		this.email = agentEntity.getEmail();
		this.cityId=agentEntity.getCityId();
		this.active=agentEntity.isActive();
	}
	

}