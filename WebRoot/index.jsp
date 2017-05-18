<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ 
	page contentType="text/html;charset=utf-8"%><%@
	page import="org.apache.commons.lang.StringUtils" %><%
/*	
	更新记录：
		2013-01-25 取消对SmartUpload的使用，改用commons-fileupload组件。因为测试发现SmartUpload有内存泄露的问题。
*/
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String clientCookie = request.getHeader("Cookie");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<title>WordPaster-jsp-ueditor-1.2.6.0</title>
	<script type="text/javascript" src="ueditor.config.js" charset="utf-8"></script>
	<script type="text/javascript" src="ueditor.all.min.js" charset="utf-8"></script>
	<link type="text/css" rel="Stylesheet" href="WordPaster/css/WordPaster.css"/>
    <link type="text/css" rel="Stylesheet" href="WordPaster/js/skygqbox.css" />
    <script type="text/javascript" src="WordPaster/js/json2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/jquery-1.4.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.edge.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.app.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.file.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/skygqbox.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/WordPaster.js" charset="utf-8"></script>
</head>
<body>
	<textarea name="后台取值的key" id="myEditor">这里写你的初始化内容</textarea>
	<script type="text/javascript">
        var pasterMgr = new WordPasterManager();
    	pasterMgr.Config["PostUrl"] = "http://localhost:8080/WordPaster2UEditor1.4x/upload.jsp"
    	pasterMgr.Config["Cookie"] = '<%=clientCookie%>';
    	pasterMgr.Load();//加载控件

        var ue = UE.getEditor('myEditor');
		
		ue.ready(function() {
		    //设置编辑器的内容
		    ue.setContent('hello');
		    //获取html内容，返回: <p>hello</p>
		    var html = ue.getContent();
		    //获取纯文本内容，返回: hello
		    var txt = ue.getContentTxt();
		    pasterMgr.SetEditor(ue);
		});
				
	</script>
</body>
</html>