package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User4DTO;

public class User4DAO extends DBHelper{
	
	private static User4DAO instance = new User4DAO();
	public static User4DAO getInstance() {
		return instance;
	}
	private User4DAO() {}
	
	// 기본 CRUD
	public void insertUser4(User4DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `User4` VALUES (?,?,?,?,?,?)");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getGender());
			psmt.setInt(4, user.getAge());
			psmt.setString(5, user.getHp());
			psmt.setString(6, user.getAddr());
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public User4DTO selectUser4(String uid) {
		User4DTO user = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `User4` WHERE `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				user = new User4DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setGender(rs.getString(3));
				user.setAge(rs.getString(4));
				user.setHp(rs.getString(5));
				user.setAddr(rs.getString(6));
			}
			closeAll();
									
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
			
	}
	public List<User4DTO> selectUser4s() {
		
		List<User4DTO> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `User4`");
			
			while(rs.next()) {
				User4DTO user = new User4DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setGender(rs.getString(3));
				user.setAge(rs.getString(4));
				user.setHp(rs.getString(5));
				user.setAddr(rs.getString(6));
				users.add(user);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
			
	}
	public void updateUser4(User4DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `User4` SET `name`=?, `gender`=?, `age`=?, `hp`=?, `addr`=? WHERE `uid`=?");
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getGender());
			psmt.setInt(3, user.getAge());
			psmt.setString(4, user.getHp());
			psmt.setString(5, user.getAddr());
			psmt.setString(6, user.getUid());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser4(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `User4` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}