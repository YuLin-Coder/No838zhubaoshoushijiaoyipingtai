package com.controller;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.ShouhouEntity;
import com.entity.YonghuEntity;
import com.entity.view.YonghuView;
import com.service.ShouhouService;
import com.service.TokenService;
import com.service.YonghuService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;


/**
 * 用户
 * 后端接口
 * @author 
 * @email 
 * @date 2021-01-08 22:38:58
 */
@RestController
@RequestMapping("/shouhou")
public class ShouhouController {
    @Autowired
    private ShouhouService shouhouService;


    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ShouhouEntity shouhouEntity, HttpServletRequest request){
		String orderid = shouhouEntity.getOrderid();
		if(orderid!= null && orderid !="" && orderid!="null"){

			EntityWrapper<ShouhouEntity> wrapper = new EntityWrapper<>();
			wrapper.eq("orderid",orderid);
			ShouhouEntity s1 = shouhouService.selectOne(wrapper);
			if(s1==null){
				Date date = new Date();
				shouhouEntity.setAddtime(date);
				shouhouEntity.setSuqiutime(date);
				shouhouEntity.setShouhoutype(2);//设置为未处理
				shouhouService.insert(shouhouEntity);
			}else{
				return R.error("该订单已经有售后了");
			}
		}else{
			return R.error("没有订单号");
		}
		return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ShouhouEntity shouhouEntity, HttpServletRequest request){
        //ValidatorUtils.validateEntity(yonghu);
		shouhouEntity.setChulitime(new Date());
		shouhouEntity.setShouhoutype(1);//设置为已处理
		shouhouService.updateById(shouhouEntity);
        return R.ok();
    }


	
	


}
