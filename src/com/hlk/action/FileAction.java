package com.hlk.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.hlk.model.Files;
import com.hlk.model.User;
import com.hlk.service.FileService;
import com.hlk.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 文件上传Action
 * @author lenovo
 *
 */
public class FileAction extends ActionSupport implements ModelDriven<Files>,RequestAware{
	
	private static final long serialVersionUID = 1L;
	
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String savePath;
	
	private int userId;
	
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	private Files files = new Files();
	public void setFiles(Files files) {
		this.files = files;
	}
	public Files getFiles() {
		return files;
	}
	@Override
	public Files getModel() {
		return files;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserId() {
		return userId;
	}
	
	@Resource
	private FileService fileService;
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	
	//用户Service
	@Resource
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	 * 进入到上传文件页面
	 * @return
	 */
	public String viewUpload() {
		return "viewFile";
	}
	
	/**
	 * 
	 * 上传文件
	 * @return
	 * @throws Exception
	 */
	public String upload() {
		files.setFileName(uploadFileName);
		files.setContentType(uploadContentType);
		files.setFilePath(savePath);
		
		try {
			InputStream in = new FileInputStream(upload);
			String dir = ServletActionContext.getRequest().getRealPath(savePath);
			File uploadFile = new File(dir, uploadFileName);
			OutputStream out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[1024*1024];
			int len;
			while((len = in.read(buffer)) > 0) {
				out.write(buffer,0,len);
			}
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		User user = userService.findUserById(userId);
		files.setUser(user);
		fileService.save(files);
		return "fileListAction";
	}
	
	/**
	 * 文件列表
	 */
	public String list() {
		List<Files> listFiles = fileService.getAllFiles();
		request.put("listFiles", listFiles);
		return "list";
	}
	// 接收框架运行时候传入的代表request对象的map
	private Map<String, Object> request;
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}