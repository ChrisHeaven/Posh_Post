<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>

<%
String username = "";
String original_username = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql, sql2, sql3, sql4, sql5;
int result;

String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("username") != null && request.getParameter("original_username") != null) {
    username = request.getParameter("username"); //获取输入的信息
    username = username.replaceAll("%2B", "+"); //替换username中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    BASE64Decoder decoder = new BASE64Decoder();
    username = new String(decoder.decodeBuffer(username), "utf-8"); //进行base64解码

    original_username = request.getParameter("original_username"); //获取输入的信息
    original_username = original_username.replaceAll("%2B", "+"); //替换original_username中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    //BASE64Decoder decoder=new BASE64Decoder();
    original_username = new String(decoder.decodeBuffer(original_username), "utf-8"); //进行base64解码

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
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'users_information'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //Statement stmt = con.createStatement();
                sql = "select * from test.users_information where username = '" + original_username + "'";
                rs = stmt.executeQuery(sql);
                if (rs.next() == false) {
                    out.println("NO");
                }
            } else {
                sql = "update users_information set username = '" + username + "' where username = '" + original_username + "'";
                sql2 = "update users_state set username = '" + username + "' where username = '" + original_username + "'";
                sql3 = "update weibo set username = '" + username + "' where username = '" + original_username + "'";
                sql4 = "update relations set username = '" + username + "' where username = '" + original_username + "'";
                sql5 = "update favorite_weibo set username = '" + username + "' where username = '" + original_username + "'";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                PreparedStatement ptmt2 = (PreparedStatement)con.prepareStatement(sql2);
                PreparedStatement ptmt3 = (PreparedStatement)con.prepareStatement(sql3);
                PreparedStatement ptmt4 = (PreparedStatement)con.prepareStatement(sql4);
                PreparedStatement ptmt5 = (PreparedStatement)con.prepareStatement(sql5);

                result = ptmt.executeUpdate();
                result = ptmt2.executeUpdate();
                result = ptmt3.executeUpdate();
                result = ptmt4.executeUpdate();

                out.println("");
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        out.println("用户名已被占用");
        //SQLe.getCause();
    }
}
%>

