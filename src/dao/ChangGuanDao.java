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

public class ChangGuanDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	private int NUM = 1000;
	
	public int nums;
	public int ids[];
	public String names[];
	public int NeiKes[];
	public int WaiKes[];
	public int FuKes[];
	public int ErKes[];
	public int ZhenTuiKes[];
	public int PingGus[];
	public int TiaoLis[];
	public int ShaLongs[];
	public int JiangZuos[];
	public int deletes[];
	
	public String name;
	public int NeiKe;
	public int WaiKe;
	public int FuKe;
	public int ErKe;
	public int ZhenTuiKe;
	public int PingGu;
	public int TiaoLi;
	public int ShaLong;
	public int JiangZuo;
	public int delete;
	
	public int name_nums;
	public String name_infos[];
	public int name_info_ids[];
	

	//新建场馆列表
	public void insertChangGuan(String name, int NeiKe, int WaiKe, int FuKe, int ErKe, int ZhenTuiKe,
			int PingGu, int TiaoLi, int ShaLong, int JiangZuo) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04changguan values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04changguan");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setInt(3, NeiKe);
			ps.setInt(4, WaiKe);
			ps.setInt(5, FuKe);
			ps.setInt(6, ErKe);
			ps.setInt(7, ZhenTuiKe);
			ps.setInt(8, PingGu);
			ps.setInt(9, TiaoLi);
			ps.setInt(10, ShaLong);
			ps.setInt(11, JiangZuo);

			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(12, ts);
			ps.setTimestamp(13, ts);
			ps.setInt(14, 0);

			ps.execute();
			
			//同步更新到04site表中
			insertSite(name);
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//同步更新到04site表中
	//新建场馆列表
	public void insertSite(String name) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04site values(?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04site");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setInt(3, 1);

			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//修改更新场馆
	public void modifySite(int id,int flag) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		sql = "update 04site set status = '" + flag + "'"
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
	
	
	
	//查询所有场馆信息
	public void getAllChangGuanInfo() throws SQLException {
		
		ids = new int[NUM];
		names = new String[NUM];
		NeiKes = new int[NUM];
		WaiKes = new int[NUM];
		FuKes = new int[NUM];
		ErKes = new int[NUM];
		ZhenTuiKes = new int[NUM];
		PingGus = new int[NUM];
		TiaoLis = new int[NUM];
		ShaLongs = new int[NUM];
		JiangZuos = new int[NUM];
		deletes = new int[NUM];

		conn = Connections.getConnection();
		String sql = "select * from 04changguan ";
		try {
			int index = 1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ids[index] = rs.getInt("id");
				names[index] = rs.getString("name");
				NeiKes[index] = rs.getInt("NeiKe");
				WaiKes[index] = rs.getInt("WaiKe");
				FuKes[index] = rs.getInt("FuKe");
				ErKes[index] = rs.getInt("ErKe");
				ZhenTuiKes[index] = rs.getInt("ZhenTuiKe");
				PingGus[index] = rs.getInt("PingGu");
				TiaoLis[index] = rs.getInt("TiaoLi");
				ShaLongs[index] = rs.getInt("ShaLong");
				JiangZuos[index] = rs.getInt("JiangZuo");
				deletes[index] = rs.getInt("deleteChangGuan");
				
				index++;
			}
			nums = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询指定id场馆信息
	public void getChangGuanInfo_by_id(int id) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04changguan where id = '" + id + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				name = rs.getString("name");
				NeiKe = rs.getInt("NeiKe");
				WaiKe = rs.getInt("WaiKe");
				FuKe = rs.getInt("FuKe");
				ErKe = rs.getInt("ErKe");
				ZhenTuiKe = rs.getInt("ZhenTuiKe");
				PingGu = rs.getInt("PingGu");
				TiaoLi = rs.getInt("TiaoLi");
				ShaLong = rs.getInt("ShaLong");
				JiangZuo = rs.getInt("JiangZuo");
				delete = rs.getInt("deleteChangGuan");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询所有场馆名字及ID
	public void getAllChangGuanName() throws SQLException {
		
		name_infos = new String[NUM];
		name_info_ids = new int[NUM];

		conn = Connections.getConnection();
		String sql = "select * from 04changguan ";
		try {
			int index = 1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				name_info_ids[index] = rs.getInt("id");
				name_infos[index] = rs.getString("name");
				
				index++;
			}
			name_nums = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据id查询场馆名字
	public String getChangGuanName_by_id(int id) throws SQLException {
		
		String name = null;
		conn = Connections.getConnection();
		String sql = "select * from 04changguan where id = '" + id + "'";
		try {
			int index = 1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				name = rs.getString("name");
			}
			name_nums = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}
	
	//修改场馆.未删除的场馆有效
	public void modifyChangGuan(int id, int NeiKe, int WaiKe, int FuKe, int ErKe, int ZhenTuiKe,
			int PingGu, int TiaoLi, int ShaLong, int JiangZuo, int deleteChangGuan) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		sql = "update 04changguan set NeiKe = '" + NeiKe + "'" 
			+ " , WaiKe = '" + WaiKe + "'" 
			+ " , FuKe = '" + FuKe + "'" 
			+ " , ErKe = '" + ErKe + "'" 
			+ " , ZhenTuiKe = '" + ZhenTuiKe + "'" 
			+ " , PingGu = '" + PingGu + "'" 
			+ " , TiaoLi = '" + TiaoLi + "'" 
			+ " , ShaLong = '" + ShaLong + "'" 
			+ " , JiangZuo = '" + JiangZuo + "'" 
			+ " , updateDate = '" + ts + "'" 
			+ " , deleteChangGuan = '" + deleteChangGuan + "'" 
			+ " where id = '" + id + "'" ;

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			//同步更新04site
			if(deleteChangGuan==1){
				modifySite(id,0);
			}else if(deleteChangGuan==0){
				modifySite(id,1);
			}
			
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除场馆
	public void deleteChangGuan(int id) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		sql = "update 04changguan set deleteChangGuan = '" + 1 + "'"
			+ " , updateDate = '" + ts + "'" 
		 	+ " where id = '" + id + "'";

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			//同步更新04site
			modifySite(id,0);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
