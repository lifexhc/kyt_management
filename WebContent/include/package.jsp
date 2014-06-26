<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="security.*" %>
<%@page import="dao.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adminCheck = null;
String loginedUserName = null;
int GROUP_INTERVAL = 100;
String loginRole = null;

String sysName = "孔医堂后台管理系统";
String sysColor = "#d8a14f";//#FF8C47
String sysFontColor = "#FF8C47";//#d8a14f
String hrSize  = "999 1px";
String P_IMAGES = "http://121.201.7.153/KYTPic/IllnessDes/";
String D_IMAGES = "http://121.201.7.153/KYTPic/Portrait/";
String ImageUrl_tmp = "E:\\code\\web-java\\file\\" ;

//String sysColor = "#d8a14f";//#FF8C47
//String sysFontColor = "#FF8C47";//#d8a14f

%>