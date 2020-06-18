<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String path=request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="<%=path%>/css/index_work.css"/> 
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.js"></script>
</head>
<script type="text/javascript">

	$(function() {
		$.post('getBrandSelect',function(bate){
			var str='';	
			for(var i in bate){
				str+="<option value="+bate[i].bid+">"+bate[i].bname+"</option>"
			}
			$("#bid").append(str);
			$("#bid").val("${goods.bid}");
		})
	})
</script>
<body>
	<form action="list" method="post">
		<select name="bid" id="bid">
			<option value="">--请选择--</option>
		</select>&nbsp;
		<select name="status" id="status">
			<option value="">--请选择--</option>
			<option ${goods.status=='是'?'selected':'' } value="是">是</option>
			<option ${goods.status=='否'?'selected':'' } value="否">否</option>
		</select>&nbsp;
		价格区间：
		<input type="date" name="startTime" value="${goods.startTime }">~
		<input type="date" name="endTime" value="${goods.endTime }">&nbsp;
		<input type="submit" value="查询">&nbsp;
		<a href="add.jsp"><input type="button" value="添加"></a>
	</form>
	<table>
		<tr>
			<td>id</td>
			<td>商品名</td>
			<td>价格</td>
			<td>所属品牌</td>
			<td>上线时间</td>
			<td>是否下架</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${goodsList }" var="gl">
			<tr>
				<td>${gl.gid }</td>
				<td>${gl.gname }</td>
				<td>${gl.price }</td>
				<td>${gl.bname }</td>
				<td>${gl.uptime }</td>
				<td>${gl.status }</td>
				<td><a href="updUtil?gid=${gl.gid }"> <input type="button" value="修改"></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>