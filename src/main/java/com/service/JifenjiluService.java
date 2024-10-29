package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.JifenjiluEntity;
import com.entity.view.JifenjiluView;
import com.entity.vo.JifenjiluVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 订单
 *
 * @author 
 * @email 
 * @date
 */
public interface JifenjiluService extends IService<JifenjiluEntity> {

    PageUtils queryPage(Map<String, Object> params);
    PageUtils queryPage1(Map<String, Object> params);

   	List<JifenjiluVO> selectListVO(Wrapper<JifenjiluEntity> wrapper);

   	JifenjiluVO selectVO(@Param("ew") Wrapper<JifenjiluEntity> wrapper);

   	List<JifenjiluView> selectListView(Wrapper<JifenjiluEntity> wrapper);

   	JifenjiluView selectView(@Param("ew") Wrapper<JifenjiluEntity> wrapper);

   	PageUtils queryPage(Map<String, Object> params, Wrapper<JifenjiluEntity> wrapper);
   	
}

