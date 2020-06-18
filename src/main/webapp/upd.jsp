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
		$("#bid").val("${good.bid}");
	})
})
</script>
<body>

	<form action="upd" method="post">
		<table align="center">
		<thead>
			<tr><th>添加<th></tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input type="text" name="gid" value="${good.gid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="gname" value="${good.gname }"  placeholder="请输入商品名">
				</td>
			</tr>
			<tr>
				<td>
					<select name="bid"  id="bid">
						<option value="">--请选择商品品牌--</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="price" value="${good.price }"  placeholder="请输入价格">
				</td>
			</tr>
			<tr>
				<td>
					<select name="status">
						<option value="">--请选择商品上架状态--</option>
						<option ${good.status=='是'?'selected':'' }  value="是">是</option>
						<option  ${good.status=='否'?'selected':'' } value="否">否</option>
					</select>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>
				<input type="submit" value="添加">
				</td>
			</tr>
		</tfoot>
	</table>
	
	</form>
</body>
</html>