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
	<!-- 员工编辑的model -->
	<div class="modal fade" id="emp_update_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更新员工</h4>
	      </div>
	      <div class="modal-body">
	       		<form class="form-horizontal">
				  <div class="form-group">
				    <label for="emp_add_empName" class="col-sm-2 control-label">empName</label>
				    <div class="col-sm-10">
				      <p class="form-control-static" name="empName" id="emp_update_empName"></p>
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="emp_add_email" class="col-sm-2 control-label">email</label>
				    <div class="col-sm-10">
				      <input type="text" name="email" class="form-control" id="emp_update_email" placeholder="123@qq.com">
				    	<span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    	<label for="gender" class="col-sm-2 control-label">gender</label>
				      	 <div class="col-sm-10">
					      	<label class="radio-inline">
							  <input type="radio" name="gender" checked="checked" id="gender" value="1"> 男
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" id="gender" value="2"> 女
							</label>
						</div>
				  </div>
				  <div class="form-group">
				  		<label  class="col-sm-2 control-label">department</label>
				  		<div class="col-sm-4">
					    	<select class="form-control" name="deptId">
							 
							</select>
						</div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="update_emp_btn" class="btn btn-primary">更新</button>
	      </div>
	    </div>
	  </div>
	</div>


	<!-- 员工添加的model -->
	<div class="modal fade" id="emp_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加员工</h4>
	      </div>
	      <div class="modal-body">
	       		<form class="form-horizontal">
				  <div class="form-group">
				    <label for="emp_add_empName" class="col-sm-2 control-label">empName</label>
				    <div class="col-sm-10">
				      <input type="text" name="empName" class="form-control" id="emp_add_empName" placeholder="zhaosi">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="emp_add_email" class="col-sm-2 control-label">email</label>
				    <div class="col-sm-10">
				      <input type="text" name="email" class="form-control" id="emp_add_email" placeholder="123@qq.com">
				    	<span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    	<label for="gender" class="col-sm-2 control-label">gender</label>
				      	 <div class="col-sm-10">
					      	<label class="radio-inline">
							  <input type="radio" name="gender" checked="checked" id="gender" value="1"> 男
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" id="gender" value="2"> 女
							</label>
						</div>
				  </div>
				  <div class="form-group">
				  		<label  class="col-sm-2 control-label">department</label>
				  		<div class="col-sm-4">
					    	<select id="dept_select" class="form-control" name="deptId">
							 
							</select>
						</div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="save_emp_btn" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
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
				<button id="add_emp_btn" class="btn btn-primary" data-toggle="modal" data-target="#emp_model">添加</button>
				<button class="btn btn-danger" id="emp_deleteAll_btn">删除</button>
			</div>
		</div>
		
		<!-- 显示数据的表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="table_emps">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all" />
							</th>
							<th>#</th>
							<th>empName</th>
							<th>email</th>
							<th>gender</th>
							<th>department</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 页码的显示 -->
		<div class="row">
			<div class="col-md-6" id="page_info_area">
				
			</div>
			<div class="col-md-6" id="page_nav_area">
			</div>
		</div>
	</div>
<script type="text/javascript">
//全局变量，用来记录总的记录数
	var totalPageNum,currentPage;

	$(function(){
		to_page(1);
	})
	
	/* //在输入框失去焦点的时候进行前端的数据校验
	$("#emp_add_empName").blur(function(){
		valide_add_from();
	});
	$("#emp_add_email").blur(function(){
		valide_add_from();
	}) */
	
	//在用户名输入框的值改变的时候发送ajax校验用户名是否可用
	$("#emp_add_empName").change(function(){
		var empName = $(this).val();
		$.ajax({
			url:"${pageContext.request.contextPath}/checkUser",
			data:"empName="+empName,
			type:"POST",
			success:function(data){
				if(data.code == 100){
					show_valied_form("#emp_add_empName","has-success","用户名可用");
					//给提交按钮创建一个属性，用来鉴别是否可以提交表单
					$("#save_emp_btn").attr("check-val","success");
				}else{
					console.log(data);
					show_valied_form("#emp_add_empName","has-error",data.extend.check_val);
					$("#save_emp_btn").attr("check-val","error");
				}
			}
		})
	})
	
	//控制校验的样式显示
	function show_valied_form(ele,className,msg){
		//先清空class，以及span中的字符
		$(ele).parent().parent().remove("has-error has-success");
		$(ele).next("span").html("");
		
		$(ele).parent().parent().addClass(className);
		$(ele).next("span").html(msg);
	}
	
	//进行表单数据的校验
	function valide_add_from(){
		var empName = $("#emp_add_empName").val();
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		//如果验证没有通过，添加失败的样式
		if(!regName.test(empName)){
			show_valied_form("#emp_add_empName","has-error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
			return false;
		}
		//反之添加成功的样式aaa
		show_valied_form("#emp_add_empName","has-success","");
		
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		var email = $("#emp_add_email").val();
		
		if(!regEmail.test(email)){
			show_valied_form("#emp_add_email","has-error","邮箱格式不正确");
			return false;
		}
		show_valied_form("#emp_add_email","has-success","");
		return true;
	}

	//点击保存按钮保存表单数据
	$("#save_emp_btn").click(function(){
		
		if(!valide_add_from()){
			return false;
		}
		if($(this).attr("check-val") == "error"){
			return false;
		}
		//发送ajax请求，保存数据
		$.ajax({
			url:"${pageContext.request.contextPath}/empsWithJson",
			data:$("#emp_model form").serialize(),
			type:"POST",
			success:function(data){
				if(data.code == 100){
					//数据保存成功关闭模态框，并且回到末页
					$("#emp_model").modal('hide');
					to_page(totalPageNum);
				}else{
					if(null != data.extend.fieldError.email){
						show_valied_form("#emp_add_email","has-error",data.extend.fieldError.email);
					}
					if(null != data.extend.fieldError.empName){
						show_valied_form("#emp_add_email","has-error",data.extend.fieldError.empName);
					}
				}
			}
		});
	})
	
	
	//点击添加按钮显示添加的界面
	$("#add_emp_btn").click(function(){
		$("#emp_add_empName").val("");
		$("#emp_add_email").val("");
		
		build_depts("#emp_model");
	})
	
	//构建部门下拉列表
	function build_depts(element){
		$.ajax({
			url:"${pageContext.request.contextPath}/depts",
			type:"get",
			success:function(data){
				var $detpSelect = $(element+" select");
				$detpSelect.empty();
				$.each(data.extend.depts,function(index,item){
					var $deptOpt = $("<option></option>").append(item.deptName).attr("value",item.deptId);
					$detpSelect.append($deptOpt);
				});
			}
		})
	}
	
	
	function to_page(pageNo){
		$.ajax({
			url:"${pageContext.request.contextPath}/empsWithJson",
			data:"pageNo="+pageNo,
			type:"get",
			success:function(data){
				build_tabl_emps(data);
				build_info_area(data);
				build_page_nav_area(data);
			}
		})
	};
	
	//构建table的表格中的元素
	function build_tabl_emps(data){
		$("tbody").empty();
		$.each(data.extend.pageInfo.list,function(index,item){
			var $tr = $("<tr></tr>");
			var $checkBox = $("<td><input type='checkbox' class='check_item'/></td>")
			var $empIdTd = $("<td></td>").append(item.empId);
			var $empNameTd = $("<td></td>").append(item.empName);
			var $emailTd = $("<td></td>").append(item.email);
			var $genderTd = $("<td></td>").append(item.gender==1?"男":"女");
			var $departmentTd = $("<td></td>").append(item.department.deptName);
			
			//在构建编辑与产出按钮的时候，将当前用户的数据的id赋值给一个属性
			var $editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
							.append("编辑");
			$editBtn.attr("edit_empId",item.empId);
			var $delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash"))
						.append("删除");
			$delBtn.attr("del_empId",item.empId);
			var $btnTd = $("<td></td>").append($editBtn).append(" ").append($delBtn);
			
			$tr.append($checkBox)
				.append($empIdTd).append($empNameTd)
				.append($emailTd).append($genderTd)
				.append($departmentTd).append($btnTd)
				.appendTo("#table_emps tbody");
		})
	};
	
	//构建分页的信息
	function build_info_area(data){
		$("#page_info_area").empty();
		$("#page_info_area").append("当前第"+data.extend.pageInfo.pageNum+"页,共有"+data.extend.pageInfo.pages+"页,总记录数"+data.extend.pageInfo.total+"")
		totalPageNum = data.extend.pageInfo.total;
		currentPage = data.extend.pageInfo.pageNum;
	};
	
	//构建分页导航栏
	function build_page_nav_area(data){
		$("#page_nav_area").empty();
		
		//创建分页导航栏所需要的元素
		var $nav = $("<nav></nav>")
		var $ul = $("<ul></ul>").addClass("pagination");
		var $fisPage = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
		var $lastPage = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
		var $prePage = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("&laquo;"));
		var $nextPage = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("&raquo;"));
		
		//判断是否有上一页，用来进行首页以及上一页的操作
		if(data.extend.pageInfo.hasPreviousPage != true){
			$fisPage.addClass("disabled");
			$prePage.addClass("disabled");
		}else {
			$fisPage.click(function(){
				to_page(1);
			});
			$prePage.click(function(){
				to_page(data.extend.pageInfo.pageNum - 1);
			});
		}
		
		
		$ul.append($fisPage);
		$ul.append($prePage);
		
		//创建连续显示的页码
		$.each(data.extend.pageInfo.navigatepageNums,function(index,item){
			// <li class="active"><a href="emps?pageNo=${page_No }">${page_No }</a></li>
			var $li = $("<li></li>");
			if(item == data.extend.pageInfo.pageNum){
				$li.append($("<a></a>").attr("href","#").append(item))
							  .addClass("active");
			}else {
				$li.append($("<a></a>").attr("href","#").append(item));
			}
			//为当前的页码绑定单击事件
			$li.click(function(){
				to_page(item);
			})
			
			$ul.append($li);
		});
		$ul.append($nextPage).append($lastPage);
		$nav.append($ul).appendTo("#page_nav_area");
		
		//判断是否有下一页，用来进行末页以及下一页的操作
		if(data.extend.pageInfo.hasNextPage != true){
			$nextPage.addClass("disabled");
			$lastPage.addClass("disabled");
		}else {
			$lastPage.click(function(){
				to_page(data.extend.pageInfo.pages);
			});
			$nextPage.click(function(){
				to_page(data.extend.pageInfo.pageNum + 1);
			});
		}
	}
	
	//1、我们是按钮创建之前就绑定了click，所以绑定不上。
	//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
	//jquery新版没有live，使用on进行替代
	//为所有的编辑按钮绑定事件
	$(document).on("click",".edit_btn",function(){
		//alert("edit");
		$("#emp_update_model").modal('show');
		//构建修改模态框的部门下拉列表
		build_depts("#emp_update_model");
		
		//在点解更新的时候发送ajax请求，根据用户的id查询用户的数据
		selectEmp($(this).attr("edit_empId"));
		
		//获取到  ，在点击编辑按钮的时候，为修改的模态框更新按钮设置当前员工的id属性值
		$("#update_emp_btn").attr("update_empId",$(this).attr("edit_empId"));
	});
	
	$("#update_emp_btn").click(function(){
		//alert($("#emp_update_model form").serialize()+"&_method=PUT");
		$.ajax({
			url:"${pageContext.request.contextPath}/emps/"+$(this).attr("update_empId"),
			data:$("#emp_update_model form").serialize(),
			type:"PUT",
			success:function(result){
				
				if(data.code == 100){
					//关闭模态框
					$("#emp_update_model").modal('hide');
					//回到当前的页的数据
					to_page(currentPage);
				}else{
					if(null != data.extend.fieldError.email){
						show_valied_form("#emp_add_email","has-error",data.extend.fieldError.email);
					}
					if(null != data.extend.fieldError.empName){
						show_valied_form("#emp_add_email","has-error",data.extend.fieldError.empName);
					}
				}
			}
		})
		
	})
	
	//根据id值查询出对应的员工的数据
	function selectEmp(id){
		$.ajax({
			url:"${pageContext.request.contextPath}/emps/"+id,
			type:"GET",
			success:function(data){
				$("#emp_update_empName").html(data.extend.employee.empName);
				$("#emp_update_email").val(data.extend.employee.email);
				//让对应的性别被选中
				$("#emp_update_model input[name=gender]").val([data.extend.employee.gender]);
				//让对应的下拉框对应的值选中
				$("#emp_update_model select").val([data.extend.employee.deptId]);
			}
		})
	};
	
	//为每一个后加的删除按钮绑定单击事件
	$(document).on("click",".delete_btn",function(){
		var empName = $(this).parents("tr").find("td:eq(2)").text();
		var empId = $(this).attr("del_empId");
		if(confirm("是否要删除【"+empName+"】的数据")){
			$.ajax({
				url:"${pageContext.request.contextPath}/emps/"+empId,
				type:"DELETE",
				success:function(result){
					to_page(currentPage);
				}
			})
		}
	});
	
	//为全选的单选按钮绑定事件
	$("#check_all").click(function(){
		//使用prop()方法可以得知该单选框是否被选中了
		//并将全选按钮的选中与没有选中的属性交给每一个单选按钮
		$(".check_item").prop("checked",$(this).prop("checked"));
	});
	
	//为余下的所有的单选框添加单击事件
	$(document).on("click",".check_item",function(){
		var flag = $(".check_item:checked").length == $(".check_item").length;
		if(flag){
			$("#check_all").prop("checked",true);
		}else{
			$("#check_all").prop("checked",false);
		}
	});
	
	//批量删除操作
	$("#emp_deleteAll_btn").click(function(){
		var empNames = "";
		var empIds = "";
		$.each($(".check_item:checked"),function(){
			empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
			empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
		})
		var newEmpNames = empNames.substring(0,empNames.length-1);
		var newEmpIds = empIds.substring(0,empIds.length-1);
		if(confirm("确认要删除【"+newEmpNames+"】的数据吗？")){
			$.ajax({
				url:"${pageContext.request.contextPath}/emps/"+newEmpIds,
				type:"DELETE",
				success:function(result){
					to_page(currentPage);
				}
			})
		}
	})
</script>
</body>
</html>