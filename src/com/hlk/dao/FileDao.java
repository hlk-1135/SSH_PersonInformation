package com.hlk.dao;

import java.util.List;

import com.hlk.model.Files;

public interface FileDao {
	
	public boolean save(Files files);
	
	public List<Files> getAllFiles();

}
