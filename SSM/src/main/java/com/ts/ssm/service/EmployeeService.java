package com.ts.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.ssm.dao.EmployeeMapper;
import com.ts.ssm.pojo.Employee;

@Service
public class EmployeeService {

	//adfasdfasdfasdfas
	//asdfsadfsafasfasfd
	//asdfasfdasfsa
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<Employee> queryAll(){
		List<Employee> list = employeeMapper.selectAllWithDept(null);
		return list;
	}
	
	public void saveEmp(Employee employee){
		employeeMapper.insertSelective(employee);
	}
	
	public boolean queryByName(String empName){
		int count = employeeMapper.selectByName(empName);
		
		return count > 0 ? true : false;
	}

	public Employee queryById(Integer id) {
		
		return employeeMapper.selectByPrimaryKey(id);
	}
	
	public int updateEmp(Employee employee){
		return employeeMapper.updateByPrimaryKeySelective(employee);
	}
	
	public int deleteEmp(Integer id){
		return employeeMapper.deleteByPrimaryKey(id);
	}
	
	public int deleteEmp(List<Integer> empIds){
		return employeeMapper.deleteBatch(empIds);
	}
}
