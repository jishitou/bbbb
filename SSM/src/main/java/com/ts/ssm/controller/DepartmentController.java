package com.ts.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.ssm.pojo.Department;
import com.ts.ssm.pojo.Msg;
import com.ts.ssm.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("/depts")
	public Msg getAllDepts(){
		List<Department> list = departmentService.queryAll();
		
		return Msg.success().addExtend("depts", list);
	}
}
