package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User3DTO;

public class User3DAO extends DBHelper{
	
	private static User3DAO instance = new User3DAO();
	public static User3DAO getInstance() {
		return instance;
	}
	private User3DAO() {}
	
	// 기본 CRUD
	public void insertUser3(User3DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `User3` VALUES (?,?,?,?,?)");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getBirth());
			psmt.setString(4, user.getHp());
			psmt.setString(5, user.getAddr());
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public User3DTO selectUser3(String uid) {
		User3DTO user = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `User3` WHERE `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				user = new User3DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setHp(rs.getString(4));
				user.setAddr(rs.getString(5));
			}
			closeAll();
									
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
			
	}
	public List<User3DTO> selectUser3s() {
		
		List<User3DTO> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `User3`");
			
			while(rs.next()) {
				User3DTO user = new User3DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setHp(rs.getString(4));
				user.setAddr(rs.getString(5));
				users.add(user);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
			
	}
	public void updateUser3(User3DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `User3` SET `name`=?, `birth`=?, `hp`=?, `addr`=? WHERE `uid`=?");
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getBirth());
			psmt.setString(3, user.getHp());
			psmt.setString(4, user.getAddr());
			psmt.setString(5, user.getUid());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser3(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `User3` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}