<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>
<%
String id = "";
String comment = "";
String date = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;

String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("comment") != null) {

    id = request.getParameter("id"); //获取输入的信息
    comment = request.getParameter("comment"); //获取输入的信息

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
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'comment'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //Statement stmt = con.createStatement();
            } else {
                date = new java.util.Date().toLocaleString();
                sql = "insert into comment(weibo_id, comment, comment_time, commenter) select '" + id + "', '" + comment + "', '" + date + "', username from users_state where state = '1'";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                result = ptmt.executeUpdate();

                sql = "update weibo set comment_number = comment_number + 1 where id = '" + id + "'";
                PreparedStatement ptmt2 = (PreparedStatement)con.prepareStatement(sql);
                result = ptmt2.executeUpdate();

                out.println("h");
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //SQLe.getCause();
    }
}
%>