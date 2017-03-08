<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>

<%
String username = "";
String password = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;

String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("username") != null && request.getParameter("password") != null) {
    username = request.getParameter("username"); //获取输入的信息
    username = username.replaceAll("%2B", "+"); //替换username中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    BASE64Decoder decoder = new BASE64Decoder();
    username = new String(decoder.decodeBuffer(username), "utf-8"); //进行base64解码

    password = request.getParameter("password"); //获取输入的信息
    password = password.replaceAll("%2B", "+"); //替换password中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    //BASE64Decoder decoder=new BASE64Decoder();
    password = new String(decoder.decodeBuffer(password), "utf-8"); //进行base64解码

    try {
        Class.forName(driver);
    } catch (Exception e) {
        //out.println(" 无法载入 " + driver + " 驱动程序 !");
        e.printStackTrace();
    }

    try {
        Connection con = DriverManager.getConnection(url, userid, passwd);
        if (!con.isClosed()) {
            //out.println("Connnected");
            Statement stmt = con.createStatement();
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'users_information'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //Statement stmt = con.createStatement();
                sql = "create table users_information(username char(20), password char(20), primary key(username))";
                result = stmt.executeUpdate(sql);// executeUpdate语句会返回一个受影响的行数，如果返回-1就没有成功
                if (result != -1) {
                    //out.println("Create table successfully");
                    sql = "insert into users_information(username, password) values(?, ?)";
                    PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                    ptmt.setString(1, username);
                    ptmt.setString(2, password);
                    result = ptmt.executeUpdate();
                }
            } else {
                sql = "insert into users_information(username, password) values(?, ?)";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ptmt.setString(1, username);
                ptmt.setString(2, password);
                result = ptmt.executeUpdate();
                out.println("h");
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //out.println("Disconnected");
        SQLe.printStackTrace();
    }
}
%>