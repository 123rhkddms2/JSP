package kr.co.jboard2.service;

public class FileService {
	private static FileService instance = new FileService();
	public static FileService getInstance() {
		return instance;
	}
	
	private FileService() {}

}
