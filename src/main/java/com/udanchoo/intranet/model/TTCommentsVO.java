package com.udanchoo.intranet.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TTCommentsVO {
	private long commentId;
	private String ttComment;
	private String commentedBy;
	private LocalDateTime lastUpdated;
	
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
	
	public long getCommentId() {
		return commentId;
	}
	public void setCommentId(long commentId) {
		this.commentId = commentId;
	}
	public String getCommentedBy() {
		return commentedBy;
	}
	public void setCommentedBy(String commentedBy) {
		this.commentedBy = commentedBy;
	}
	
	public LocalDateTime getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(LocalDateTime lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public String getTtComment() {
		return ttComment;
	}
	public void setTtComment(String ttComment) {
		this.ttComment = ttComment;
	}
	
	
	
}
