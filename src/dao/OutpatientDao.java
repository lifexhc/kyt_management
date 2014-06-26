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

public class OutpatientDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private ResultSet rs2 = null;
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
	public ArrayList<String> ampm = new ArrayList<String>();
	public ArrayList<String> time = new ArrayList<String>();
	public ArrayList<String> outpatient_type = new ArrayList<String>();
	public ArrayList<Integer> amount = new ArrayList<Integer>();
	
	
	
	
	
	
	
	//患者的预约信息  Will Zhou  5/13/2014
	//public ArrayList<Long> clinic_id = new ArrayList<Long>();
	public ArrayList<String> clinic_site = new ArrayList<String>();
	public ArrayList<String> clinic_department = new ArrayList<String>();
	public ArrayList<String> clinic_doctor_name = new ArrayList<String>();
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
	

	public void add_outpatient(HashMap hm) throws SQLException {
		long site_id = (Long) hm.get("site_id");
		String type = (String) hm.get("type");
		long department_id = (Long) hm.get("department_id");
		long doctor_id = (Long) hm.get("doctor_id");
		String day_list[] = (String[]) hm.get("day_list"); 
		String ampm_list[] = (String[]) hm.get("ampm_list");
		String time_list[] = (String[]) hm.get("time_list");
		String amount_list[] = (String[]) hm.get("amount_list");
		
		long outpatient_id = 0;
		
		
		String sql = new String();
		for(int i=0; i < day_list.length; i++){
			conn = Connections.getConnection();
			sql = "SELECT id FROM `04outpatient_info` WHERE day ='" + day_list[i] + "' and ampm = '" + ampm_list[i] + "' and time ='"+ time_list[i] +"'  and type = '" + type + "'";
			//sql = "SELECT id FROM `04outpatient_info` WHERE day ='" + day_list[i] + "' and ampm = '" + ampm_list[i] + "' and time ='"+ time_list[i] + "'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				
				if(!rs.next()){
					sql = "INSERT INTO `04outpatient_info`( `day`, `ampm`, `time`, `type`) VALUES ( '"+ day_list[i] + "','" + ampm_list[i]+ "','" +  time_list[i]+ "','" + type + "')";
					stmt.execute(sql);
					
					sql = "select max(id) as id  from 04outpatient_info";
					stmt = conn.createStatement();
					rs2 = stmt.executeQuery(sql);
					if(rs2.next()){
						outpatient_id = rs2.getLong("id");
					}					
				}else{
					//某天 某个上下午 某个时间段 存在，则应该去修改操作
					outpatient_id = rs.getLong("id");
				}
				
				sql = "INSERT INTO `04outpatient_doctor`(`outpatient_id`, `doctor_id`, `total_amount`) VALUES ( "+ outpatient_id + "," + doctor_id+ "," +  amount_list[i] +")";
				stmt = conn.createStatement();
				
				//stmt.equals(sql);
				stmt.execute(sql);
				
				
				
				
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		}
		
		stmt.close();
		conn.close();

	}
	
	
	public void cancell_outpatient(HashMap hm) {

		long outpatient_doctor_id = (Long) hm.get("outpatient_doctor_id");
		String type = (String) hm.get("type");
		
		
		Connection conn = Connections.getConnection();
		
		
		
		int status = 2;
		if("enable".equals(type)){
			status = 1;
		}else if("disable".equals(type)){
			status = 0;
		}

		String sql = "UPDATE `04outpatient_doctor` SET status = " + status + " where id=" + outpatient_doctor_id;

	
		try {
			PreparedStatement ps;

		
				/*ps = conn.prepareStatement(sql);
			

			ps.execute();*/
			stmt = conn.createStatement();
			stmt.execute(sql);

			conn.close(); 

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void set_reservation_status(HashMap hm) {

		long clinic_reservation_id = (Long) hm.get("clinic_reservation_id");
		String type = (String) hm.get("type");
		
		
		Connection conn = Connections.getConnection();
		
		
		
		int status = 4;
		if("cancel".equals(type)){
			status = 2;
		}else if("unvisited".equals(type)){
			status = 3;
		}else if("visited".equals(type)){
		status = 1;
	}
		//when 0 then '未就诊' when 1 then '履约' when 2 then '已取消' when 3 then '爽约' 

		String sql = "UPDATE `04reservation_normal` SET treat_flag = " + status + " where id=" + clinic_reservation_id;

	
		try {
			PreparedStatement ps;

		
				/*ps = conn.prepareStatement(sql);
			

			ps.execute();*/
			stmt = conn.createStatement();
			stmt.execute(sql);

			conn.close(); 

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	public void update_outpatient(HashMap hm) {

		long outpatient_id = (Long) hm.get("outpatient_id");
		long doctor_id = (Long) hm.get("doctor_id");
		
		String day = (String) hm.get("day");
		String ampm = (String) hm.get("ampm");
		String time = (String) hm.get("time");
		int amount = (Integer) hm.get("amount");
		
		/* int amount = 0;
		 if(amount_str != null){
			 amount = Integer.parseInt(amount_str);
		 }*/
		 String type = (String) hm.get("type");
		
	
		//long doctor_id = (Long) hm.get("doctor_id");
		
		
		Connection conn = Connections.getConnection();
		
		
		long outpatient_id_db = 0 ;
		
		//conn = Connections.getConnection();
		String sql = "SELECT id FROM `04outpatient_info` WHERE day ='" + day + "' and ampm = '" + ampm + "' and time ='"+ time +"'  and type = '" + type + "'";
		//sql = "SELECT id FROM `04outpatient_info` WHERE day ='" + day_list[i] + "' and ampm = '" + ampm_list[i] + "' and time ='"+ time_list[i] + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			if(!rs.next()){
				sql = "INSERT INTO `04outpatient_info`( `day`, `ampm`, `time`, `type`) VALUES ( '"+ day + "','" + ampm+ "','" +  time+ "','" + type + "')";
				stmt.execute(sql);
				
				sql = "select max(id) as id  from 04outpatient_info";
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql);
				if(rs2.next()){
					outpatient_id_db = rs2.getLong("id");
				}					
			}else{
				//某天 某个上下午 某个时间段 存在，则应该去修改操作
				outpatient_id_db = rs.getLong("id");
			}
			
			
			sql = "UPDATE `04outpatient_doctor` SET `outpatient_id`="+ outpatient_id_db +",`total_amount`="+amount+" WHERE outpatient_id = " + outpatient_id + "  and doctor_id="+ doctor_id;
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			
			
			

			conn.close(); 

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
