package com.hlk.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Files entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "files", catalog = "information")
public class Files implements java.io.Serializable {

	// Fields

	private Integer fileId;
	private User user;
	private String fileTitle;
	private String fileName;
	private String description;
	private Date fileDate;
	private String contentType;
	private String filePath;

	// Constructors

	/** default constructor */
	public Files() {
	}

	/** full constructor */
	public Files(User user, String fileTitle, String fileName,
			String description, Date fileDate, String contentType,
			String filePath) {
		this.user = user;
		this.fileTitle = fileTitle;
		this.fileName = fileName;
		this.description = description;
		this.fileDate = fileDate;
		this.contentType = contentType;
		this.filePath = filePath;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "fileId", unique = true, nullable = false)
	public Integer getFileId() {
		return this.fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "fileTitle", nullable = false)
	public String getFileTitle() {
		return this.fileTitle;
	}

	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}

	@Column(name = "fileName", nullable = false)
	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "description", nullable = false)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fileDate", nullable = false, length = 0)
	public Date getFileDate() {
		return this.fileDate;
	}

	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}

	@Column(name = "contentType", nullable = false)
	public String getContentType() {
		return this.contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	@Column(name = "filePath", nullable = false)
	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}