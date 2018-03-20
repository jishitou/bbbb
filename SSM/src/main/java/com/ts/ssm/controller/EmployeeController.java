package com.ts.ssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ts.ssm.pojo.Employee;
import com.ts.ssm.pojo.Msg;
import com.ts.ssm.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService empService;
	
	//根据id删除员工的信息,将单个删除以及批量删除结合在一块
	@ResponseBody
	@RequestMapping(value="/emps/{empIds}",method=RequestMethod.DELETE)
	public Msg remove(@PathVariable("empIds") String empIds){
		if(empIds.contains("-")){//此时表示是批量删除
			String[] empIdStr = empIds.split("-");
			List<Integer> empidList = new ArrayList<>();
			for(String id : empIdStr){//将分解开的字符串都放入到list中
				empidList.add(Integer.parseInt(id));
			}
			empService.deleteEmp(empidList);
		}else{
			empService.deleteEmp(Integer.parseInt(empIds));
		}
		return Msg.success();
	}
	
	//根据表单中的数据更新用户的数据
	//此处，需要根据用户的id进行更新，若要将传入的参数正确的封装到emp对象中
	//参数名名字必须和emp对象的属性名一致-->{empId}
	@ResponseBody
	@RequestMapping(value="/emps/{empId}",method=RequestMethod.PUT)
	public Msg updateEmp(Employee employee){
		System.out.println(employee);
		int count = empService.updateEmp(employee);
		System.out.println(count);
		if(count > 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	
	//根据id查询用户的数据,显示在模态框中
	@ResponseBody
	@RequestMapping(value="/emps/{id}",method=RequestMethod.GET)
	public Msg getEmpById(@PathVariable("id") Integer id){
		Employee employee = empService.queryById(id);
		return Msg.success().addExtend("employee", employee);
	}
	
	//校验用户名是否可用
	@ResponseBody
	@RequestMapping("/checkUser")
	public Msg checkUser(@RequestParam("empName")String empName){
		String reg = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!empName.matches(reg)){
			return Msg.fail().addExtend("check_val", "用户名可以是2-5位中文或者6-16位英文和数字~~");
		}
		boolean flag = empService.queryByName(empName);
		if(!flag){
			return Msg.success();
		}else{
			return Msg.fail().addExtend("check_val", "用户名不可用");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/empsWithJson",method=RequestMethod.POST)
	public Msg saveEmp(@Valid Employee employee, BindingResult result){
		//在添加用户数据的时候进行后台的数据校验
		if(result.hasErrors()){
			Map<String , Object> map = new HashMap<>();
			//有错误的时候循环将错误的信息放到Msg中
			for(FieldError field: result.getFieldErrors()){
				System.out.println(field.getField());
				System.out.println(field.getDefaultMessage());
				map.put(field.getField(), field.getDefaultMessage());
			}
			return Msg.fail().addExtend("fieldError", map);
		}
		empService.saveEmp(employee);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/empsWithJson",method=RequestMethod.GET)
	public Msg getEmpsWithJson(@RequestParam(value="pageNo",defaultValue="1") Integer pageNo){
		PageHelper.startPage(pageNo, 5);
		List<Employee> emps = empService.queryAll();
		
		//使用pageInfo包装查询的数据，并显示连续的页码
		PageInfo<Employee> pageInfo= new PageInfo<>(emps, 5);
		
		//使用json的方式返回数据
		return Msg.success().addExtend("pageInfo", pageInfo);
	}
	
	/**
	 * 查询所有的员工，并按照分页显示
	 * @return
	 */
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pageNo",defaultValue="1") Integer pageNo,
			Map<String , Object> map){
//		PageHelper.startPage(pageNo, 5);
		List<Employee> emps = empService.queryAll();
		
		//使用pageInfo包装查询的数据，并显示连续的页码
//		PageInfo<Employee> pageInfo= new PageInfo<>(emps, 5);
//		map.put("pageInfo", pageInfo);
		return "empList";
	}
}
