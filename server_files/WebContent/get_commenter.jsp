<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>
<%
String id = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;
String[] outcome = new String[100];
String[] outcome_commenter = new String[100];


String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("id") != null) {

    id = request.getParameter("id"); //获取输入的信息

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
                sql = "select comment_time, commenter from comment where weibo_id = '" + id + "'";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ResultSet rss = ptmt.executeQuery();
                int i = 0, j;
                while (rss.next()) {
                    outcome[i] = rss.getString("comment_time").replaceAll("2016-", "").substring(0, 10).toString();
                    outcome_commenter[i] = rss.getString("commenter").toString();
                    i++;
                }
                for (j = 0; j < i; j++){
                    out.println(outcome_commenter[j] + " 于" + outcome[j] + "发表评论：");
                }
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //SQLe.getCause();
    }
}
%>