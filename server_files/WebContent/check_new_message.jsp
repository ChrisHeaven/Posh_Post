<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>

<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;
String[] outcome = new String[100];
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
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'message_content'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //out.println("Create table successfully");
            } else {
                sql = "select id from message_content where flag = 1 and receiver in (select username from users_state where state = 1)";
                ResultSet rss = stmt.executeQuery(sql);
                int i = 0, j;
                while (rss.next()) {
                    outcome[i] = rss.getString("id").toString();
                    i++;
                }
                for (j = 0; j < i; j++){
                    out.println(outcome[j]);
                }
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //SQLe.getCause();
    }
%>
