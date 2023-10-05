package com.udanchoo.intranet.repository.reminder;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.reminder.Tts_Lead_Reminder_Recorder_Entity;

@Repository
public interface TTS_Leads_Reminder_Repository extends JpaRepository<Tts_Lead_Reminder_Recorder_Entity,Long>,JpaSpecificationExecutor{

	List<Tts_Lead_Reminder_Recorder_Entity> findByLeadIdOrderByCreatedAtDesc(long leadId);
} 
