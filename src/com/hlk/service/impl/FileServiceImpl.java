package com.hlk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hlk.dao.FileDao;
import com.hlk.model.Files;
import com.hlk.service.FileService;

@Transactional
@Service("FileService")
public class FileServiceImpl implements FileService {

	@Resource
	private FileDao fileDao;
	
	@Override
	public void save(Files files) {
		try {
			fileDao.save(files);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Files> getAllFiles() {
		return fileDao.getAllFiles();
	}
}