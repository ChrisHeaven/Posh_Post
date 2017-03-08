<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>
<%@ page import = "java.sql.*" %>

<%
 String password="";
 String driver = "com.mysql.jdbc.Driver";
 String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
 String sql;

 String userid = "pyz"; // 用户
 String passwd = "pyz2016"; // 密码

 if(request.getParameter("password")!=null){
 	password=request.getParameter("password");//获取输入的信息
	password=password.replaceAll("%2B","+");	//替换password中的加号，这是由于在进行URL编码时，将+号转换为%2B了
 	BASE64Decoder decoder=new BASE64Decoder();
	password=new String(decoder.decodeBuffer(password),"utf-8");	//进行base64解码

	try {
	Class.forName(driver);
    } catch (Exception e) {
	out.println(" 无法载入 " + driver + " 驱动程序 !");
	e.printStackTrace();
    }

    try {
	Connection con = DriverManager.getConnection(url, userid, passwd);
	if (!con.isClosed()){
			out.println(" YES");
                sql = "insert into users(username, password) values(?, ?)";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ptmt.setString(1, null);
                ptmt.setString(2, password);
                int result = ptmt.executeUpdate();
	}
	con.close();
    } catch (SQLException SQLe) {
	out.println(" NO");
    }
 }
%>
<%="Password:"%>
<%=password%>