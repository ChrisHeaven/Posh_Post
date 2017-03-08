<%@ page contentType="text/html; charset=utf-8" language="java" import="sun.misc.BASE64Decoder"%>

<%@ page import = "java.sql.*" %>
<%
String username = "";
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/test"; // 连接到 test 数据库
String sql;
int result;
String[] outcome = new String[100];

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
            Statement stmt = con.createStatement();
            sql = "select * from information_schema.TABLES where TABLE_NAME = 'weibo'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == false) {
                //Statement stmt = con.createStatement();
                sql = "create table weibo(id int(10), username char(20), content varchar(100), post_time char(20), upvote_number char(10))";
                result = stmt.executeUpdate(sql);// executeUpdate语句会返回一个受影响的行数，如果返回-1就没有成功
            } else {
                sql = "select id from test.weibo where username = '" + username + "'" + "or username in (select friends from test.relations, test.users_state where state = 1 and relations.username = users_state.username) order by post_time desc";
                PreparedStatement ptmt = (PreparedStatement)con.prepareStatement(sql);
                ResultSet rss = ptmt.executeQuery();
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
        //out.println("用户名已被占用");
        //SQLe.getCause();
    }
}
%>
