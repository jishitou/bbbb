<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>"/>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	
	
	<div class="container">
		<!-- 标题部分 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM_CRUD</h1>
			</div>
		</div>
		
		<!-- 添加以及删除按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">添加</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		
		<!-- 显示数据的表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>email</th>
						<th>gender</th>
						<th>department</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td>${emp.empId }</td>
							<td>${emp.empName }</td>
							<td>${emp.email }</td>
							<td>${emp.gender == 1 ? "男" : "女" }</td>
							<td>${emp.department.deptName }</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<!-- 页码的显示 -->
		<div class="row">
			<div class="col-md-6">
				当前第${pageInfo.pageNum }页,共有${pageInfo.pages }页,总记录数${pageInfo.total }
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li><a href="emps?pageNo=1">首页</a></li>
				  	<c:if test="${pageInfo.hasPreviousPage }">
					    <li>
					      <a href="emps?pageNo=${pageInfo.pageNum-1 }" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				  	</c:if>
				  	
				    <c:forEach items="${pageInfo.navigatepageNums}" var="page_No"> 
				    	<c:if test="${page_No == pageInfo.pageNum }">
						    <li class="active"><a href="emps?pageNo=${page_No }">${page_No }</a></li>
				    	</c:if>
				    	<c:if test="${page_No != pageInfo.pageNum }">
						    <li ><a href="emps?pageNo=${page_No }">${page_No }</a></li>
				    	</c:if>
				    	
				    </c:forEach>
				    <c:if test="${pageInfo.hasNextPage}">
					   <li>
					      <a href="emps?pageNo=${pageInfo.pageNum+1 }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				  	</c:if>
				    <li><a href="emps?pageNo=${pageInfo.pages }">末页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	
</body>
</html>