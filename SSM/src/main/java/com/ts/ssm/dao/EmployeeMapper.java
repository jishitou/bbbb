package com.ts.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ts.ssm.pojo.Employee;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer empId);

    Employee selectByPrimaryKeyWithDept(Integer empId);
    
    List<Employee> selectAllWithDept(Employee employee);
    
    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    
    int selectByName(String empName);
    
    int deleteBatch(@Param("empIds")List<Integer> empIds);
}