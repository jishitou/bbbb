package com.ts.ssm.dao;

import java.util.List;

import com.ts.ssm.pojo.Department;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer deptId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    List<Department> selectAll();
}