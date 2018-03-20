package com.ts.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.ssm.dao.DepartmentMapper;
import com.ts.ssm.pojo.Department;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> queryAll(){
		
		return departmentMapper.selectAll();
	}
}
