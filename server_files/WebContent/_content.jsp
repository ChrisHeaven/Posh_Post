<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>
<%
String to = "";
String content = "";
String date = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;

String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("content") != null) {

    to = request.getParameter("to"); //获取输入的信息
    to = to.replaceAll("%2B", "+"); //替换id中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    BASE64Decoder decoder = new BASE64Decoder();
    to = new String(decoder.decodeBuffer(to), "utf-8"); //进行base64解码

    content = request.getParameter("content"); //获取输入的信息
    content = content.replaceAll("%2B", "+"); //替换content中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    //BASE64Decoder decoder = new BASE64Decoder();
    content = new String(decoder.decodeBuffer(content), "utf-8"); //进行base64解码

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
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'message_content'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //Statement stmt = con.createStatement();
            } else {
                date = new java.util.Date().toLocaleString();
                sql = "insert into message_content(sender, receiver, message_content, post_time) select username, '" + to + "', '" + content + "', '" + date + "' from users_state where state = '1'";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                result = ptmt.executeUpdate();
                out.println("h");
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //SQLe.getCause();
    }
}
%>