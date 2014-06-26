package test;

import java.sql.SQLException;
import java.util.*; 
import java.text.*;

//import login.Validate;
//import security.PasswordUtil;
import dao.*;
import database.*;

public class test {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub

		//商店测试
		//ShopDao shopDao = new ShopDao();
		//shopDao.insertShop("云海肴(单)");
		//shopDao.modifyShop(4, "云海肴(西单)", "王五", "1520198888", 0);
		//shopDao.deleteShop(5);
		//System.out.println("shopName:" + shopDao.getShopName(2) + "\nshopNum:" + shopDao.getShopNum() + "\n");
		
		//用户测试
		//UserDao userDao = new UserDao();
		//userDao.insertUser("Bob", "Bob", "1111111", 0);
		//userDao.modifyUser(3,"", "222222222");
		//userDao.modifyUserByAdmin(4, "", "3333333", 1, 0);
		//userDao.deleteUser(4);
		//userDao.getUserInfo(4);
		//System.out.println("userName:" + userDao.UserName + "\nuserTel:" + userDao.UserTel + "\nuserGroup:" + userDao.UserGroup + "\nuserNum:" + userDao.getUserNum() + "\n");
		//System.out.println("isUserAdmin:" + userDao.IsUserAdmin("liming") + "\n");
		
		//财务测试
		//System.out.println("DateFormat.getDateInstance():" +  DateFormat.getDateInstance());
		//FinancialDao financialDao = new FinancialDao();
		//financialDao.insertFinancial(2, 2, "2014-03-26", 200, 50, 0, 1, 2, 90, 30, 20, 0, 2, 20, 30, 70, 30, 100, 90, 20, 15, 5);
		//financialDao.insertFinancial(userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks);
		//financialDao.modifyFinancial(2, 1, 2, "2014-03-26", 200, 50, 0, 1, 2, 90, 30, 20, 0, 2, 20, 30, 70, 30, 100, 120, 20, 15, 5);
		//financialDao.modifyFinancialByAdmin(2, 1, 2, "2014-03-26", 200, 50, 0, 1, 2, 90, 30, 20, 0, 2, 20, 30, 70, 30, 100, 120, 20, 15, 5, 1);
		//financialDao.modifyFinancialByAdmin(chartID, userID, shopID, chartDate, Cash, ShuaKa, YaGaoKa, ThirtyDaiJinQuan, FiftyDaiJinQuan, TongKa, MeiTuan, NuoMi, DianPing, ElevenDaiJinQuan, PreVipCash, PreVipShuaKa, PreTongKaCash, PreTongKaShuaKa, StandardSeats, ActualitySeats, StandardDesks, ActualityDesks, NoPeopleDesks, deleteChart)
		//financialDao.deleteFinancial(3);
		//financialDao.getFinancialInfo(3);
		//System.out.println("userName:" + userDao.UserName + "\nuserTel:" + userDao.UserTel + "\nuserGroup:" + userDao.UserGroup + "\nuserNum:" + userDao.getUserNum() + "\n");
		//System.out.println("isUserDel:" + userDao.IsUserDel(4));
		
		//密码验证
		//Validate check = new Validate();
		//PasswordUtil GP = new PasswordUtil();
    	//String pw = "admin";
    	//pw = GP.generatePassword(pw);
		//UserDao userDao = new UserDao();
		//userDao.modifyUserByAdmin(3, pw, "3333333", 1, 0);
		
		//添加删除问题列表
		//DeleteQuestionDao deleteQuestionDao = new DeleteQuestionDao();
		//deleteQuestionDao.insertDelQuestion(40,0);
		
		/*
		//添加删除患者列表
		DeletePatientDao deletePatientDao = new DeletePatientDao();
		deletePatientDao.insertDelPatient(2);
		*/
		
		//System.out.println("validate:");
		
		/*
		//新建场馆
		ChangGuanDao changGuanDao = new ChangGuanDao();
		String name = "测试场馆";
		int NeiKe = 1;
		int WaiKe =1;
		int FuKe =0;
		int ErKe =1;
		int ZhenTuiKe =1;
		int PingGu =0;
		int TiaoLi =0;
		int ShaLong =1;
		int JiangZuo = 0;
		//changGuanDao.insertChangGuan(name, NeiKe, WaiKe, FuKe, ErKe, ZhenTuiKe, PingGu, TiaoLi, ShaLong, JiangZuo);
		changGuanDao.modifyChangGuan(id, NeiKe, WaiKe, FuKe, ErKe, ZhenTuiKe, PingGu, TiaoLi, ShaLong, JiangZuo, deleteChangGuan);
		changGuanDao.deleteChangGuan(1);
		*/
		
		/*
		//新建学堂
		XueTangDao xueTangDao = new XueTangDao();
		xueTangDao.insertXueTang("测试学堂");
		*/
		
		/*
		//测试问题列表
		ASKPatient aSKPatient = new ASKPatient();
		aSKPatient.getAllQuestionInfos();
		System.out.println(aSKPatient.userID + ",\n" + aSKPatient.user_gender + ",\n" + aSKPatient.user_age + ",\n"
				+ aSKPatient.content + ",\n" + aSKPatient.picture_path + ",\n" + aSKPatient.department + ",\n"
				+ aSKPatient.answered_flag + ",\n" + aSKPatient.createDate);
		*/
		
		/*
		//测试答案
		AnswerDao answerDao = new AnswerDao();
		answerDao.getAnswers_Given(2);
		System.out.println(answerDao.num_Given_Patient + ",\n");
		System.out.println(answerDao.answers_Given_Patient[1] + ",\n");
		System.out.println(answerDao.answers_doctor_name_Given_Patient[1]);
		*/
		
	}

}
