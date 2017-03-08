<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>
<%
String username = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;
String[] outcome = new String[100];
String outcome_commenter = "";


String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("username") != "") {

    username = request.getParameter("username"); //获取输入的信息
    username = username.replaceAll("%2B", "+"); //替换username中的加号，这是由于在进行URL编码时，将+号转换为%2B了
    BASE64Decoder decoder = new BASE64Decoder();
    username = new String(decoder.decodeBuffer(username), "utf-8"); //进行base64解码

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
                sql = "select comment_number from test.weibo where username = '" + username + "'" + "or username in (select friends from test.relations, test.users_state where state = 1 and relations.username = users_state.username) order by post_time desc";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ResultSet rss = ptmt.executeQuery();
                int i = 0, j;
                while (rss.next()) {
                    outcome[i] = rss.getString("comment_number").toString();
                    i++;
                }
                for (j = 0; j < i; j++){
                    out.println(outcome[j] + "条评论");
                }
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //SQLe.getCause();
    }
} else {

    try {
        Class.forName(driver);
    } catch (Exception e) {
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
                sql = "select comment_number from test.weibo order by upvote_number desc";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ResultSet rss = ptmt.executeQuery();
                int i = 0, j;
                while (rss.next()) {
                    outcome[i] = rss.getString("comment_number").toString();
                    i++;
                }
                for (j = 0; j < i; j++){
                    out.println(outcome[j] + "条评论");
                }
            }
        }
        con.close();
    } catch (SQLException SQLe) {
        //SQLe.getCause();
    }
}
%>