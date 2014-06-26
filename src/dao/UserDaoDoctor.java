package dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import database.Connections;
import tools.Tools;
//import security.PasswordUtil;

public class UserDaoDoctor {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	private int NUM = 1000;
	
	public String UserName = null;
	public String UserTel = null;
	public int UserGroup = 0;
	
	public int UserDoctorNum = 0;
	public String UserDoctorTels[];
	
	public String doctor_Name_Given = null;
	public String doctor_Title_Given = null;
	public String doctor_Department_Given = null;
	public String doctor_Portrait_Given = null;
	
	//新建用户
	public void insertUser_Doctor(String userName, int userGender, int userAge, int userRole, String userTel, String userPWD) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04user_doctor values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04user_doctor");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setString(2, userName);
			ps.setInt(3, userGender);
			ps.setInt(4, userAge);
			ps.setInt(5, userRole);
			ps.setString(6, userTel);
			ps.setString(7, "");
			ps.setString(8, "");
			ps.setString(9, "");
			ps.setString(10, "");
			ps.setString(11, "");
			ps.setString(12, "");
			ps.setString(13, "");
			ps.setInt(14, 0);
			ps.setString(15, userPWD);
			ps.setInt(16, 0); //validate_flag
			ps.setString(17, "");
			ps.setString(18, "");
			ps.setInt(19, 1);//belong_outpatient_department
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(20, ts);
			ps.setTimestamp(21, ts);

			ps.execute();
			//System.out.println("doctor insert success!");
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据id查询用户名
	public String getUserName_Doctor(int id) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where id=" + id;
		String userName= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				userName = rs.getString("name");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userName;
	}
	
	//根据用户名查询id
	public int getUserId_Doctor(String name) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where name='" + name + "'";
		int id= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt("id");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
	//根据id查询Tel
	public String getUserTel_Doctor(int id) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where id=" + id;
		String userTel= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				userTel = rs.getString("mobile");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userTel;
	}
	
	//根据Tel查询id
	public int getUserId_by_Tel_Doctor(String tel) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where mobile='" + tel + "'";
		int id= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt("id");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
	//查询所有Tel
	public void getAllUserTel_Doctor() throws SQLException {
		
		UserDoctorTels = new String[NUM];
		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor ";
		try {
			int index = 1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				UserDoctorTels[index] = rs.getString("mobile");
				index++;
			}
			UserDoctorNum = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询指定用户USERID的个人信息
	public void getAllUserInfo_Doctor(int id) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where id = '" + id + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				doctor_Name_Given = rs.getString("name");
				doctor_Title_Given  = rs.getString("title");
				doctor_Department_Given = rs.getString("department");
				doctor_Portrait_Given = rs.getString("doctor_portrait");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据mobile查询Doctor用户是否禁用
	public int IsDoctorExist(String mobile) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where mobile='" + mobile + "'"
			+ " and validate_flag = '" + 1 + "'" ;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = 1;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//根据userID查询Doctor用户是否禁用
	public int IsDoctorExist_by_userID(int id) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where id='" + id + "'"
			+ " and validate_flag = '" + 1 + "'" ;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = 1;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//医生修改密码
	public void modifyPassword_Doctor(String mobile, String password) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		String sql = "update 04user_doctor set password = '" + password + "'"
			 	+ " , updateDate = '" + ts + "'" 
			 	+ " where mobile = '" + mobile + "'";

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//医生认证
	public void authentication_Doctor(int id, String identity_ID, String doctor_criteria, 
			String certified_type, String title, String hospital_owned, String department, 
				String master, String doctor_criteria_photo, String doctor_portrait) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		String sql = "update 04user_doctor set identity_ID = '" + identity_ID + "'"
				+ " , doctor_criteria = '" + doctor_criteria + "'" 
				+ " , certified_type = '" + certified_type + "'" 
				+ " , title = '" + title + "'" 
				+ " , hospital_owned = '" + hospital_owned + "'" 
				+ " , department = '" + department + "'" 
				+ " , master = '" + master + "'" 
				+ " , doctor_criteria_photo = '" + doctor_criteria_photo + "'" 
				+ " , doctor_portrait = '" + doctor_portrait + "'" 
				+ " , auth_submit = '" + 1 + "'" 
			 	+ " , updateDate = '" + ts + "'" 
			 		+ " where id = '" + id + "'";

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据userID查询Doctor用户是否提交认证资料
	public int IsDoctorSubmitAuth_by_userID(int id) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from 04user_doctor where id='" + id + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("auth_submit");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
	/*
	
	//用户修改用户信息
	public void modifyUser(int userID, String userPWD, String userTel) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		if(null==userPWD||userPWD.equals("")){
			sql = "update usercharts set userTel = '" + userTel + "'"
				+ " , updateDate = '" + ts + "'" + " where userID = " + userID ;
		}else{
			sql = "update usercharts set userPWD = '" + userPWD + "'"
			 	+ " , userTel = '" + userTel + "'" + " , updateDate = '" + ts + "'" 
			 	+ " where userID = " + userID ;
		}

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//管理员修改用户信息
	public void modifyUserByAdmin(int userID, String userPWD, String userTel, int userGroup, int deleteUser) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		if(null==userPWD||userPWD.equals("")){
			sql = "update usercharts set userTel = '" + userTel + "'"
				+ " , userGroup = '" + userGroup + "'" + " , updateDate = '" + ts + "'"	
				+ " , deleteUser = '" + deleteUser + "'" + " where userID = " + userID ;
		}else{
			sql = "update usercharts set userPWD = '" + userPWD + "'"
				+ " , userTel = '" + userTel + "'" + " , userGroup = '" + userGroup + "'" 
				+ " , updateDate = '" + ts + "'" + " , deleteUser = '" + deleteUser + "'" 
				+ " where userID = " + userID ;
		}

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除用户
	public void deleteUser(int userID) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update usercharts set updateDate = '" + ts + "'"
		+ " , deleteUser = '" + 1 + "'" + " where userID = " + userID ;

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户信息
	public void getUserInfo(int userID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID=" + userID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				UserName = rs.getString("userName");
				UserTel = rs.getString("userTel");
				UserGroup = rs.getInt("userGroup");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//查询所有用户名
	public void getAllUserNames() throws SQLException {
		int NUM = 500;
		UserNames = new String[NUM];
		conn = Connections.getConnection();
		String sql = "select * from usercharts";
		//String userName= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 1;
			while (rs.next()) {
				UserNames[index] = rs.getString("userName");
				index++;
			}
			UserNum = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户id(根据用户名)
	public int getUserID(String userName) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'";
		int id= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt("userID");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
	//查询用户数量
	public int getUserNum() throws SQLException {
		int userNum = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				userNum++;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userNum;
	}
	
	//查询用户是否禁用
	public int IsUserDel(int userID) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID = " + userID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("deleteUser");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//查询用户是否为管理员
	public int IsUserAdmin(String userName) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("userGroup");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
*/
}
