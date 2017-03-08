<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>
<%
String content = "";
String username = "";
String picpath = "";
String date = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;

String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("content") != null) {
    content = request.getParameter("content"); //获取输入的微博信息
    content = content.replaceAll("%2B", "+");   //替换content中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    BASE64Decoder decoder = new BASE64Decoder();
    content = new String(decoder.decodeBuffer(content), "utf-8");   //进行base64解码

    username = request.getParameter("username"); //获取输入的信息
    username = username.replaceAll("%2B", "+"); //替换username中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    //BASE64Decoder decoder = new BASE64Decoder();
    username = new String(decoder.decodeBuffer(username), "utf-8"); //进行base64解码

    picpath = request.getParameter("picpath"); //获取输入的微博信息

    try {
        Class.forName(driver);
    } catch (Exception e) {
        //out.println(" 无法载入 " + driver + " 驱动程序 !");
        e.printStackTrace();
    }

    try {
        Connection con = DriverManager.getConnection(url, userid, passwd);
        if (!con.isClosed()) {
            //out.println("Connected");
            Statement stmt = con.createStatement();
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'weibo'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //Statement stmt = con.createStatement();
            } else {
                sql = "insert into weibo(username, content, post_time, picture) values(?, ?, ?, ?)";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ptmt.setString(1, username);
                ptmt.setString(2, content);
                ptmt.setString(3, date = new java.util.Date().toLocaleString());    //获取系统时间
                ptmt.setString(4, picpath);    //获取系统时间
                result = ptmt.executeUpdate();
                out.println("h");
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //out.println("用户名已被占用");
        //SQLe.getCause();
    }
}
%>



