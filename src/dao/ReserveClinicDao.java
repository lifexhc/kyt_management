package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import database.Connections;
import tools.Tools;
//import security.PasswordUtil;

public class ReserveClinicDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	private Statement stmt_doctor_avaialble_amount = null;
	private ResultSet rs_doctor_avaialble_amount = null;
	private Connection conn_doctor_avaialble_amount = null;
	private PreparedStatement ps_doctor_avaialble_amount = null;
	
	public String UserName = null;
	public String UserTel = null;
	public int UserGroup = 0;
	
	public int UserNum = 0;
	public String UserNames[];
	
	// 用于切换开发和部署的配置
	//String table_prefix = "";
	String table_prefix = "04";
	
	
	//医生信息  Will Zhou  5/13/2014
	public int department_num;
	//public int  department_id[];	
	public String  department[];
	
	
	//可预约门诊时间信息  Will Zhou  5/13/2014
	//public int department_num;
	public ArrayList<Integer> outpatient_id = new ArrayList<Integer>();
	public ArrayList<String> outpatient_day = new ArrayList<String>();
	public ArrayList<String> day = new ArrayList<String>();
	public ArrayList<String> ampm = new ArrayList<String>();
	public ArrayList<String>  date= new ArrayList<String>();
	public ArrayList<String> time = new ArrayList<String>();
	public ArrayList<String> outpatient_type = new ArrayList<String>();
	public ArrayList<Integer> amount = new ArrayList<Integer>();
	public ArrayList<Integer> status = new ArrayList<Integer>();
	public ArrayList<Long> outpatient_doctor_id = new ArrayList<Long>();
	
	
	
	
	
	
	//患者的预约信息  Will Zhou  5/13/2014
	//public ArrayList<Long> clinic_id = new ArrayList<Long>();
	public ArrayList<String> clinic_site = new ArrayList<String>();
	public ArrayList<String> clinic_type = new ArrayList<String>();
	public ArrayList<String> clinic_department = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_name = new ArrayList<String>();
	public ArrayList<String> user_name = new ArrayList<String>();
	public ArrayList<String> user_mobile = new ArrayList<String>();
	public ArrayList<Integer> clinic_treat_flag = new ArrayList<Integer>();
	public ArrayList<String> clinic_treat_text = new ArrayList<String>();
	public ArrayList<Long> clinic_reservation_id = new ArrayList<Long>();

	
	/*public ArrayList<Long> clinic_doctorid = new ArrayList<Long>();
	public ArrayList<Long> clinic_patient_illness_id = new ArrayList<Long>();
	public ArrayList<Boolean> clinic_treat_flag = new ArrayList<Boolean>();*/
	public ArrayList<String> clinic_date = new ArrayList<String>();
	
	public ArrayList<String> shanggongfang_adjust_type = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_programe = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_book_date = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_book_master = new ArrayList<String>();
	public ArrayList<String> shanggongfang_adjust_name = new ArrayList<String>();
	
	public ArrayList<String> shanggongfang_assess_type = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_programe = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_book_date = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_book_master = new ArrayList<String>();
	public ArrayList<String> shanggongfang_assess_name = new ArrayList<String>();
	
	public ArrayList<String> xuetang = new ArrayList<String>();
	public ArrayList<String> xuetang_name = new ArrayList<String>();
	
	//医生预约信息
	//SELECT  `site`, n.`department`, i.name, i.purpose , `date` FROM   reservation_normal n,  reservation_patient_illness i where n.patient_illness_id = i.id
	public ArrayList<String> clinic_doctor_site = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_department = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_patient_name = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_purpose = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_date = new ArrayList<String>();
	
	//医生信息
	public ArrayList<Long> doctor_id = new ArrayList<Long>();
	public ArrayList<String> dcotor_name = new ArrayList<String>();
	
	
	//场馆信息  Will  20140615
	public ArrayList<Long> site_id = new ArrayList<Long>();
	public ArrayList<String> site_name = new ArrayList<String>();
	
	//科室信息  Will  20140615
		public ArrayList<Long> department_id = new ArrayList<Long>();
		public ArrayList<String> department_name = new ArrayList<String>();
	
	
	
	
	
	
	public int doctor_num;
	//public int  doctor_id[];
	public String  name[];
	public String  title[];
	public int  doctor_available_amount[];
	
	private int NUM = 1000;
	

	
	/**
	 * @function: 获取科室
	 * @author:   Will Zhou
	 * @date:     May 13, 2014 10:37:40 PM 
	 */
	/*public void retrive_deparment() throws SQLException {

		conn = Connections4WeChat.getConnection();
	

		String sql = "SELECT id as department_id, name as department FROM " + table_prefix + "department";


		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 0;
			department = new String[NUM];
			department_id = new int[NUM];
			while (rs.next()) {
				department_id[index] = rs.getInt(1);
				department[index] = rs.getString(2);
				
				index++;
				
			}
			department_num = index;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}*/
	
	//
	
	/**
	 * @function: 添加排期时，根据场馆和科室 显示医生
	 * @author:   Will Zhou
	 * @date:     Jun 14, 2014 7:51:14 PM 
	 */
	public ArrayList retrive_doctors(HashMap hm) throws SQLException {		
		long site_id = (Long) hm.get("site_id");
		long department_id = (Long) hm.get("department_id");
			
		conn = Connections.getConnection();
		String sql = "select u.id, u.name from 04user_doctor u ,04site_doctor s where u.id = s.doctor_id and u.department = " + department_id +" and s.id=" + site_id;	
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);			
			while (rs.next()) {
				doctor_id.add((long) rs.getInt(1));
				dcotor_name.add(rs.getString(2));	
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ArrayList<ArrayList<?>> doctor_list = new ArrayList<ArrayList<?>>();
		doctor_list.add(doctor_id);
		doctor_list.add(dcotor_name);
		
		
		return doctor_list;

	}
	
	
	

	/**
	 * @function: 查询出诊信息
	 * @author:   Will Zhou
	 * @date:     May 20, 2014 7:06:42 PM 
	 */
	public void retrive_outpatient(HashMap hm) throws SQLException {
		//long outpatient_id_hm = (Long) ;
		
		conn = Connections.getConnection();
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";

		//String sql = "select i.id, st.name,i.type,d.name,u.name,i.day,i.ampm, i.time, total_amount - used_amount,u.id, o.status, o.id from 04site_doctor s, 04outpatient_doctor o, 04user_doctor u, 04outpatient_info i, 04department d ,04site st where u.department =d.id and s.doctor_id = u.id and o.doctor_id = u.id and o.outpatient_id = i.id and s.site_id and st.id and u.auth_submit = '1'";
		String sql = "select i.id, st.name,i.type,d.name,u.name,i.day,i.ampm, i.time, total_amount - used_amount,u.id, o.status, o.id from 04site_doctor s, 04outpatient_doctor o, 04user_doctor u, 04outpatient_info i, 04department d, 04site st where u.department =d.id and s.doctor_id = u.id and o.doctor_id = u.id and o.outpatient_id = i.id and u.auth_submit = '1' and st.id = s.site_id";
		if(hm.get("outpatient_id") != null){
			sql += " and i.id = " + hm.get("outpatient_id");
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 0;
			/*public ArrayList<Integer>  = new ArrayList<Integer>();
			public ArrayList<String>  = new ArrayList<String>();
			public ArrayList<String>  = new ArrayList<String>();
			public ArrayList<String> outpatient_type = new ArrayList<String>();*/
		/*	department = new String[NUM];
			department_id = new int[NUM];*/
			clinic_site = new ArrayList();
			clinic_department = new ArrayList();
			clinic_doctor_name = new ArrayList();
			
			doctor_id.clear();
			
			while (rs.next()) {
				outpatient_id.add(rs.getInt(1));				
				clinic_site.add(rs.getString(2));
				outpatient_type.add(rs.getString(3));
				clinic_department.add(rs.getString(4));
				clinic_doctor_name.add(rs.getString(5));				
				outpatient_day.add(rs.getString(6));
				ampm.add(rs.getString(7));				
				time.add(rs.getString(8));				
				amount.add(rs.getInt(9));	
				doctor_id.add(rs.getLong(10));
				status.add(rs.getInt(11));
				outpatient_doctor_id.add(rs.getLong(12));
				index++;
			}
			department_num = index;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	/**
	 * @function: 后去患者的预约信息
	 * @author:   Will Zhou
	 * @date:     May 22, 2014 12:13:16 AM 
	 */
	public void retrive_patien_reservation(int userid) throws SQLException {

		conn = Connections.getConnection();
		
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";
		String sql = "SELECT  `site`, n.`department`, d.name,  `date` FROM  " + table_prefix + "reservation_normal n, " + table_prefix + "reservation_patient_illness i,  " + table_prefix + "user_doctor d where n.patient_illness_id = i.id and n.doctorid = d.id and userid =  " + userid;
		String sql_shanggongfang_adjust = "SELECT type, `adjust_programe`, `book_date` as shanggongfang_adjust_book_date, `adjust_master`, name  as shanggongfang_adjust_name  FROM  " + table_prefix + "reservation_shanggongfang_adjust WHERE  username =  " + userid;
		String sql_shanggongfang_assess = "SELECT type, assess_programe, book_date as shanggongfang_assess_book_date, assess_master, name as shanggongfang_assess_name  FROM   " + table_prefix + "reservation_shanggongfang_assess  WHERE  username =  " + userid;
		String sql_xuetang = "SELECT `xuetang`, `name` as xuetang_name FROM   " + table_prefix + "reservation_xuetang WHERE  username =  " + userid;
		

		try {
			stmt = conn.createStatement();
			Statement stmt_shanggongfang_adjust = conn.createStatement();
			Statement stmt_shanggongfang_assess = conn.createStatement();
			Statement stmt_xuetang = conn.createStatement();
			
			
			
			rs = stmt.executeQuery(sql);
			
			ResultSet rs_shanggongfang_adjust = stmt_shanggongfang_adjust.executeQuery(sql_shanggongfang_adjust);
			
			ResultSet rs_shanggongfang_assess = stmt_shanggongfang_assess.executeQuery(sql_shanggongfang_assess);
			ResultSet rs_xuetang = stmt_xuetang.executeQuery(sql_xuetang);
			
			int index = 0;
			while (rs.next()) {
				clinic_site.add(rs.getString(1));
				clinic_department.add(rs.getString(2));
				clinic_doctor_name.add(rs.getString(3));
				clinic_date.add(rs.getString(4));
				index++;
			}
			
			index = 0;
			while (rs_shanggongfang_adjust.next()) {
				
				shanggongfang_adjust_type.add(rs_shanggongfang_adjust.getString(1));
				shanggongfang_adjust_programe.add(rs_shanggongfang_adjust.getString(2));
				shanggongfang_adjust_book_date.add(rs_shanggongfang_adjust.getString(3));
				shanggongfang_adjust_book_master.add(rs_shanggongfang_adjust.getString(4));
				shanggongfang_adjust_name.add(rs_shanggongfang_adjust.getString(5));
				index++;
			}
			
			
			index = 0;
			while (rs_shanggongfang_assess.next()) {
				
				shanggongfang_assess_type.add(rs_shanggongfang_assess.getString(1));
				shanggongfang_assess_programe.add(rs_shanggongfang_assess.getString(2));
				shanggongfang_assess_book_date.add(rs_shanggongfang_assess.getString(3));
				shanggongfang_assess_book_master.add(rs_shanggongfang_assess.getString(4));
				shanggongfang_assess_name.add(rs_shanggongfang_assess.getString(5));
				index++;
			}
			
			
			index = 0;
			while (rs_xuetang.next()) {
				
				xuetang.add(rs_xuetang.getString(1));
				xuetang_name.add(rs_xuetang.getString(2));
			
				index++;
			}
			
	
			
			
			
			department_num = index;
			stmt.close();
			stmt_shanggongfang_adjust.close();
			stmt_shanggongfang_assess.close();
			stmt_xuetang.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void retrive_doctor_reservation(String user_role) throws SQLException {

		conn = Connections.getConnection();
		
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";
		String sql = "SELECT  `site`, n.`department`, i.name, i.purpose , `date` FROM   " + table_prefix + "reservation_normal n,  " + table_prefix + "reservation_patient_illness i where n.patient_illness_id = i.id ";
		
		if("staff_wjg".equals(user_role)){
			sql += "and site='望京馆'";
		}
		
		
		try {
			stmt = conn.createStatement();
			
			
			
			
			rs = stmt.executeQuery(sql);
			
		
			int index = 0;
			while (rs.next()) {
			
				
				clinic_doctor_site.add(rs.getString(1));
				clinic_doctor_department.add(rs.getString(2));
				clinic_doctor_patient_name.add(rs.getString(3));
				clinic_doctor_purpose.add(rs.getString(4));
				
				clinic_doctor_date.add(rs.getString(5));
				index++;
			}
			
	
			
			
			
			department_num = index;
			stmt.close();
		
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	/**
	 * @function: 获取各个场馆
	 * @author:   Will Zhou
	 * @date:     Jun 15, 2014 9:26:37 AM 
	 */
	public ArrayList retrive_sites() throws SQLException {		
	
		conn = Connections.getConnection();
		String sql = "SELECT id, name FROM `04site` where status = '1'";	
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);			
			while (rs.next()) {
				site_id.add((long) rs.getInt(1));
				site_name.add(rs.getString(2));	
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ArrayList<ArrayList<?>> doctor_list = new ArrayList<ArrayList<?>>();
		doctor_list.add(doctor_id);
		doctor_list.add(dcotor_name);
		
		
		return doctor_list;

	}
	
	
	
	
	/**
	 * @function: 获取各个科室
	 * @author:   Will Zhou
	 * @date:     Jun 15, 2014 10:36:10 AM 
	 */
	public void retrive_department() throws SQLException {		
		
		conn = Connections.getConnection();
		String sql = "SELECT id, name FROM `04department` where valid = '1'";
		//department_id = new ArrayList();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);			
			while (rs.next()) {
				department_id.add((long) rs.getInt(1));
				department_name.add(rs.getString(2));	
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		


	}
	
	
	
	

	/**
	 * @function: 后台患者的预约记录管理
	 * @author:   Will Zhou
	 * @date:     Jun 18, 2014 7:57:16 AM 
	 */
	public void retrive_patient_reservation() throws SQLException {

		conn = Connections.getConnection();
		
	
		String sql = "SELECT  `site`, o.type, n.`department`,u.name,  d.name, u.mobile, o.date, o.day, o.ampm, o.time, case n.treat_flag when 0 then '未就诊' when 1 then '履约' when 2 then '已取消' when 3 then '爽约' end, n.treat_flag, n.id FROM  04reservation_normal n, 04user_doctor d,  04outpatient_info o ,04user u where  n.doctorid = d.id and n.outpatient_id = o.id and n.userid= u.id";
		//String sql_shanggongfang_assess = "SELECT type, assess_programe, book_date as shanggongfang_assess_book_date, assess_master, name as shanggongfang_assess_name, id, treat_flag  FROM   " + table_prefix + "reservation_shanggongfang_assess  WHERE  username =  " + userid;
		

		try {
			stmt = conn.createStatement();
			Statement stmt_shanggongfang_assess = conn.createStatement();
			
			
			
			rs = stmt.executeQuery(sql);
			
			
			//ResultSet rs_shanggongfang_assess = stmt_shanggongfang_assess.executeQuery(sql_shanggongfang_assess);
			
			//门诊预约
			int index = 0;
			while (rs.next()) {
				clinic_site.add(rs.getString(1));
				clinic_type.add(rs.getString(2));
				clinic_department.add(rs.getString(3));
				clinic_doctor_name.add(rs.getString(4));
				user_name.add(rs.getString(5));
				user_mobile.add(rs.getString(6));			
				date.add(rs.getString(7));
				day.add(rs.getString(8));
				ampm.add(rs.getString(9));
				time.add(rs.getString(10));			
				clinic_treat_text.add(rs.getString(11));
				clinic_treat_flag.add(rs.getInt(12));
				clinic_reservation_id.add(rs.getLong(13));			
				
			}
			
			index = 0;
			
			
			
		/*	index = 0;
			while (rs_shanggongfang_assess.next()) {
				
				shanggongfang_assess_type.add(rs_shanggongfang_assess.getString(1));
				shanggongfang_assess_programe.add(rs_shanggongfang_assess.getString(2));
				shanggongfang_assess_book_date.add(rs_shanggongfang_assess.getString(3));
				shanggongfang_assess_book_master.add(rs_shanggongfang_assess.getString(4));
				shanggongfang_assess_name.add(rs_shanggongfang_assess.getString(5));
				shanggongfang_assess_id.add(rs_shanggongfang_assess.getLong(6));
				shanggongfang_assess_treat_flag.add(rs_shanggongfang_assess.getInt(7));
				index++;
			}
			
			
			
	
			
			
			
			department_num = index;*/
			stmt.close();
			
			stmt_shanggongfang_assess.close();
		
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	
	
	
	public static void main(String args[]) throws SQLException{
		ReserveClinicDao d = new ReserveClinicDao();
		//d.retrive_doctor_reservation();
	}
	
}
