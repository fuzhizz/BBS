<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*,
beab.*,
org.hibernate.Session,
db.HibernateSessionFactory,
org.hibernate.Transaction,
java.text.SimpleDateFormat,
org.hibernate.Query"  %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
		String now=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	%>
 <%
	String strId=request.getParameter("id");
	if(strId==null||strId.trim().equals("")){
		out.println("Error Id");
		%>
		<a href="login.jsp">请登录</a>
		<%
		return;
	}
	try{
	}catch(NumberFormatException r){
		out.println("Error Id");
		%>
		<a href="login.jsp">请登录</a>
		<%
		return;
	}
	User07 a =null;
	String hql ="from User07 u where u.userid =?";
	Session se=HibernateSessionFactory.getSession();
	Query q=se.createQuery(hql);
	q.setString(0,strId);
	List<User07> p07=q.list();
	a=p07.iterator().next();
	if(a==null){
	%>
	该用户不存在
	<%
		return;
	}%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <base href="">
    <title>发帖</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head><div align="right"><a href=shouye.jsp>返回首页</a></table></div>
<body><div align="right"> 
</div><form method="post" action="de/fabiao">
<div align="center">
  <table width="780" height="247" border="1">

    <tr>
      <td width="185" height="107">楼主名:<input name="p07.usname" value=<%=a.getNickname()%> size="19" readonly="readonly"></input>
      <td width="579">文章标题:<input name="p07.name" ></input>  </br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>
    </tr>

    <tr>
      <td height="132">
      				发表时间：<input name="p07.posttime" value=<%=now%> size="19" readonly="readonly"></input>
      </td>
      <td>内容：<textarea name="p07.conten" id="textarea" cols="45" rows="5"></textarea>

      </td>
    </tr>     
    </table>
  <p>
    <label>
    
    <input type="submit" name="button" id="button" value="提交" />
    </label>
    
    <label>
    <input type="reset" name="button2" id="button2" value="重置" />
    </label>
  </p>
  </div>
  </form>
    		<style type="text/css">
<!--
body {
	background: url(img/001.jpg);
	background_repeat: repeat;
	font-size: 30px;
	color: #65c294;
}
.btn_login {
	font-size: 14px;
	font-family: 宋体;
	width: 120px;
	height: 28px;
	line-height: 28px;
	color: white;
	background-color: #65c294;
	border-radius: 6px;
	border: 0;
}
a:link {
color: white;/*链接文字本身的颜色*/
text-decoration: none;
}a:visited {
color: white;/*链接文字被别人点击后，颜色的变化*/
text-decoration: none;
}a:hover {
color: #333333;/*鼠标移到链接文字上，文字变色效果*/
text-decoration: underline;
}
-->
</body>
</html>
