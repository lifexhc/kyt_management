package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReserveClinicDao;
import database.UserDao;
import login.Validate;

/**
 * @function: 添加排期时，根据场馆和科室 显示医生
 * @author:   Will Zhou
 * @date:     7:44:55 PM
 */
public class RetrieveDoctor extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RetrieveDoctor() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			retrieveDoctor(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
			try {
				ArrayList doctor_list = retrieveDoctor(request, response);
				//解决乱码问题
				response.setCharacterEncoding("utf-8");
				PrintWriter pw = response.getWriter();
				
				pw.print(doctor_list);
				//pw.print("hello");
				pw.flush();
				pw.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

	public ArrayList retrieveDoctor(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException {
		String site_id_str = request.getParameter("site");
		String department_id_str = request.getParameter("department");
		
		long site_id = 0;
		long department_id = 0;
		if(site_id_str !=null){
			site_id = Long.parseLong(site_id_str);
			
		}
		if(department_id_str != null){
			department_id = Long.parseLong(department_id_str);
		}
		
		
		HashMap hm = new HashMap();
		
		
		
		hm.put("site_id", site_id);
		hm.put("department_id", department_id);
		/*hm.put("site_id", 1);
		hm.put("department_id", 1);*/
		
		ReserveClinicDao reserverClinicDao = new ReserveClinicDao();
		return reserverClinicDao.retrive_doctors(hm);
		
		
		
	}
}
