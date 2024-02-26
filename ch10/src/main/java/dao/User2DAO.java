package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User2DTO;

public class User2DAO extends DBHelper{
	
	private static User2DAO instance = new User2DAO();
	public static User2DAO getInstance() {
		return instance;
	}
	private User2DAO() {}
	
	// 기본 CRUD
	public void insertUser2(User2DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `User2` VALUES (?,?,?,?)");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getBirth());
			psmt.setString(4, user.getAddr());
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public User2DTO selectUser2(String uid) {
		User2DTO user = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `User2` WHERE `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				user = new User2DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setAddr(rs.getString(4));
			}
			closeAll();
									
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
			
	}
	public List<User2DTO> selectUser2s() {
		
		List<User2DTO> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `User2`");
			
			while(rs.next()) {
				User2DTO user = new User2DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirth(rs.getString(3));
				user.setAddr(rs.getString(4));
				users.add(user);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
			
	}
	public void updateUser2(User2DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `User2` SET `name`=?, `birth`=?, `addr`=? WHERE `uid`=?");
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getBirth());
			psmt.setString(3, user.getAddr());
			psmt.setString(4, user.getUid());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser2(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `User2` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}