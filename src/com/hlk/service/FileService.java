package com.hlk.service;
import java.util.List;
import com.hlk.model.Files;

public interface FileService {
	
	public void save(Files files);
	
	public List<Files> getAllFiles();

}
