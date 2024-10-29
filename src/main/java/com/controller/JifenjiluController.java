package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.JifenjiluEntity;
import com.entity.ShouhouEntity;
import com.entity.view.JifenjiluView;
import com.service.JifenjiluService;
import com.service.ShouhouService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * 积分记录
 * 后端接口
 * @author 
 * @email 
 * @date
 */
@RestController
@RequestMapping("/jifenjilu")
public class JifenjiluController {
    @Autowired
    private JifenjiluService jifenjiluService;

    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JifenjiluEntity jifenjilu, HttpServletRequest request){
        if(!request.getSession().getAttribute("role").toString().equals("管理员")) {
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        }
        PageUtils page= jifenjiluService.queryPage1(params);
        return R.ok().put("data", page);
    }




    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JifenjiluEntity jifenjilu, HttpServletRequest request){
        jifenjilu.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jifenjilu);
        jifenjilu.setYonghuId((Long)request.getSession().getAttribute("userId"));
        jifenjiluService.insert(jifenjilu);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody JifenjiluEntity jifenjilu, HttpServletRequest request){
        jifenjilu.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
        jifenjiluService.insert(jifenjilu);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody JifenjiluEntity jifenjilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jifenjilu);
        jifenjiluService.updateById(jifenjilu);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jifenjiluService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
