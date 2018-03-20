package com.ts.ssm.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ts.ssm.dao.EmployeeMapper;
import com.ts.ssm.pojo.Employee;
import com.ts.ssm.service.IEmpService;


public class TestSSM {

	private EmployeeMapper employeeMapper;
	private SqlSession sqlSession;
	
	@Test
	public void testSpring(){
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext.xml");
	
//		employeeMapper = (EmployeeMapper) context.getBean("employeeMapper");
//		employeeMapper.insertSelective(new Employee(null, "王二", "@qq.com", 2, 2));
		sqlSession = (SqlSession) context.getBean("sqlSession");
		
		employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i = 0; i<500; i++){
			String empName = UUID.randomUUID().toString().substring(0,5) + i;
			employeeMapper.insertSelective(new Employee(null, empName, empName+"@qq.com", 2, 1));
		}
		
		System.out.println("批量完成~~");
	}
	
	
	@Test
	public void testSpring2(){
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("applicationContext.xml");
	
//		employeeMapper = (EmployeeMapper) context.getBean("employeeMapper");
//		employeeMapper.insertSelective(new Employee(null, "王二", "@qq.com", 2, 2));
		sqlSession = (SqlSession) context.getBean("sqlSession");
		
		employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
	/*	PageHelper.startPage(1, 5);
		List<Employee> emps = employeeMapper.selectAllWithDept(null);
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		System.out.println("一共有："+pageInfo.getTotal());
		System.out.println("当前是："+pageInfo.getPageNum());
		System.out.println("当前是："+pageInfo.getEndRow());
		System.out.println("当前是："+pageInfo.getList().get(1).getDepartment().getDeptName());*/
		
		
		
	}
	@Test
	public void test3(){
		System.out.println(IEmpService.SM);
	}
}
