<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>
<%
String username = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql, sql2;
int result;
String[] outcome = new String[100];
String[] outcome_username = new String[100];

String userid = "pyz"; // 用户
String passwd = "pyz2016"; // 密码

if (request.getParameter("username") != null) {

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
                sql = "select upvote_number from test.weibo where id in (select weibo_id from test.favorite_weibo where username = '"+ username + "' order by time desc)";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ResultSet rss = ptmt.executeQuery();
                int i = 0, j;
                while (rss.next()) {
                    outcome[i] = rss.getString("upvote_number").toString();
                    //outcome_username[i] = rss.getString("username").toString();
                    i++;
                }
                for (j = 0; j < i; j++){
                    out.println(outcome[j] + "人 点赞");
                }
        }
        con.close();
    } catch (SQLException SQLe) {
        //out.println("用户名已被占用");
        //SQLe.getCause();
    }
}
%>



