<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhuye.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>www://http全国学生信息网.com</title>
<style type="text/css">
body{margin:0 auto;
font-size:12pt;
background: url("image/001.jpg");
background-size: cover;

}
#header{
	width:840px;
	height:65px;
	background:;
}
#header1{
	width:200px;
	height:65px;
	float:left;
	background:no-repeat left bottom;
	background: url("");
		background-size: cover;
}
#header2{
	width:635px;
	height:65px;
	float:left;
	text-align:right;
	
}
.page{
	width:850px;
	margin:0 auto;
	background:;
}
.banner{
	height:50px;
	background ;
	}
.nav{
	height:35px;
	background:url("image/f1.jpg");
	margin-top:-17px;
}
.nav ul{
	list-style:none;
	font-size:14px;
}
.nav ul li{
	float:left;
	width:80px;
	text-align:center;
	line-height:35px;
}
.nav ul li a{ color:#fff; 
 text-decoration:none;
}
.nav ul li a:hover{
	text-decoration:underline;
	color:#fba;	
}
.log{ height:25px;
}
.input1{
	width:100px;
}
.login{
	
	float:right;
}
marquee{
	line-height:25px;
}
.leftimg{
	height:200px;
	background: url("image/f3.jpg");
	background-size: cover;
}
.rightimg{
	padding-top:0PX;
	height:200px;
	background:url("image/f2.jpg");
	background-size: cover;
}

	.fg2{ width:200px; height:1000px;
	b;}
	
	.fg1{;}
.n1title{
	height:25px;
	background:blue ;
	;
	line-height:25px;
	font-size:14px;
	padding-left:10px;
	}
	.n2title{
	height:25px;
	background:blue ;
	;
	line-height:25px;
	font-size:14px;
	padding-left:10px;
	margin-top:-9px;
	}
 .content{ background:; width:850px; height:700px; margin:40px auto;  }
 .content1{ width:30%;float:left;;}
	.content2{   width:40%; float:left; background:; }
	.content3{  
	; width:29%;float:left;}
.n1content{color:;}
.n1content ul{
	list-style:none;
	padding:0 5px;
}
.n1content ul li{
	line-height:22px;
	list-style:none;
}

.h1{margin-top:10px; background:;}
#fooy{
	text-align:center;
	margin:0 auto;
	width:835px; height:100px; background:; 	}

</style>
	

  </head>
  
  <body>
   <div class="page">
    <div id="header">
    <div id="header1"></div>
    <div id="header2">
         <h3><a href="login.jsp">收藏本页</a></h3>
<select >
<option >简体中文</option>
<option>繁体中文</option>
<option>ENGLISH</option>
</select>
</div>
</div>
<div class="banner"><h3 align="center">学生信息网</h3>
<div class="nav">
  <ul>
        <li><a href="login.jsp">  首页</a></li>    
        <li><a href="login.jsp"> 用户登录</a></li>
        <li><a href="student.jsp"> 学生信息</a></li>
        <li><a href="register1.jsp">用户注册</a></li>
        <li><a href="stuAddForm.jsp"> 信息提交 </a></li>
        <li><a href="login.jsp">就业 </a></li>
        <li><a href="login.jsp">荣誉榜</a> </li>
        <li><a href="login.jsp"> 在线验证 </a></li>
        </ul>
         
 </div>
 
<div class="log">
     <marquee width=" 835px" height="25px" scrollamount="3" direction="left" scrolldelay="10">招募公告:</marquee>
     </div>
     
     </div>
    <div class="content" >
   <div class="content1" >
	 <div class="rightimg"></div>
     <div class="n1title">专业百科</div>
     <div class="n1content">
        <ul>
         <li>1.【图解专业】软件工程：玩“积木”的高手.</li>
         <li>2. 【图解专业】数据科学与大数据技术：万物...</li>
         <li>3.社工专业人才培养要以能力为本</li>
         <li>  4. 中学和大学为何要重视数学建模教育  </li> 
        
         </ul></div>
         <div class="n1title">教育时评</div>
     <div class="n1content">
        <ul>
         <li>1. “云毕业”更值得铭记</li>
         <li>2. 学生唱主角催生高质量职业教育. </li>
         <li>3. 清考”被清倒逼学生用功</li>
        <li>  4.“迟交作业”成论文，这样的师生互动当提...</li>
         </ul></div></div>
    
     <div class="content2">
    
      <div class="n1title">院校新闻</div>
     <div class="n1content">
       <ul>
         <li>1. 
中国计量大学标准化研究团队牵头起草的</li>
         <li>2. 港中文大学（深圳）夏令营报名倒计时：.... </li>
         <li>3.宝鸡文理学院物理学学术型硕士研究生接...</li>
         <li>  4. 3000余名一志愿考生“云复试”！北京交大...  </li> 
         <li>  5. 疫情催生的热门生物技术专业，温肯就有！</li>
         </ul></div>
         <div class="n1title">考研动态</div>
     <div class="n1content">
       <ul>
          <li>1. 
教育部公布2020年全国硕士研究生招生考试...</li>
          <li>2.黑龙江：高校毕业生就业率超去年同期... </li>
          <li>3. 太原面向全国引进2000名硕士博士</li>
          <li>  4. 北京大学校长郝平：让我国医学教育与世界...  </li> 
          <li>  5. 教育部临床医学专业认证工作委员会主任委.</li>
          </ul></div>
          <div  class="fg1"></div>
          <div class="h1" >
         <h3 id="h1" class="n2title" align="center"><strong>志愿者</strong></h3>
          <table  background="12.jpg" border="1" width="100%" align="center">
           <caption id="h1">工作日程安排表</caption>
<tr align="center">
<td colspan="2">上午</td>
<td colspan="2">下午</td>
</tr>
<tr>
<td>8:00-10:00</td>
<td>10:10-12:00</td>
<td>14:00-16:00</td>
<td>16:10-18:00</td>
</tr>
<tr align="center">
<td rowspan="2">领导讲话</td>
<td>大会主题报告</td>
<td>班会专题报告</td>
<td rowspan="2">总结报告</td>
</tr>
<tr align=" center">
<td >专家报告</td>
<td> 分组讨论</td>
</tr>
<tr align="center">
<td colspan="4">全体全天等候</td>
        </tr>
        </table> </div></div>
        
          <div  class="content3"  >
      <div class="leftimg"></div>
      <div class="n1title">最新资讯</div>
      <div class="n1content">
        <ul>
         <li>1. 
翁铁慧调研指导首都师范大学毕业生就业工...

</li>
         <li>2李克强：用改革的办法破除大学生执业障碍. . </li>
         <li>3. 24365校园招聘活动发挥社会化市场化力量 ...</li>
         <li>  4.谨防非法代办学历认证  </li> 
        
         </ul></div>
         <div class="n1title">热点推荐</div>
     <div class="n1content">
        <ul>
         <li>1. 教育部：继续实施三大专项计划</li>
         <li>2.研招网上调剂.. </li>
         <li>3.考研专业解析汇总</li>
       <li>  4. 四川建2003个监多所高校为毕业生拓宽求职路  </li> 
        
         </ul></div></div>
        
       </div></div>
       <hr style="height: 2px;border: none;border-top: 10px dotted; margin-top: -90px">//dotted虚线
        <h3 align="center" >联系方式：18734803191</h3>
  </body>
</html>
