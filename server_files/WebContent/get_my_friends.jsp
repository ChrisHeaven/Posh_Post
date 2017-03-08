<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>

<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql, sql2;
int result;
String[] outcome = new String[100];
String[] outcome2 = new String[100];
String[] outcome3 = new String[100];
String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

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
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'users_state'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //out.println("Create table successfully");
            } else {
                sql = "select friends from relations where username in (select username from test.users_state where state = 1)";
                ResultSet rss = stmt.executeQuery(sql);

                int i = 0, x= 0, j;
                while (rss.next()) {
                    i++;
                }
                    out.println("关注：" + i);
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //out.println("用户名已被占用");
        //SQLe.getCause();
    }
%>
