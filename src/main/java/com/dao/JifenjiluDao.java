package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.JifenjiluEntity;
import com.entity.view.JifenjiluView;
import com.entity.vo.JifenjiluVO;
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
public interface JifenjiluDao extends BaseMapper<JifenjiluEntity> {

	List<JifenjiluVO> selectListVO(@Param("ew") Wrapper<JifenjiluEntity> wrapper);

	JifenjiluVO selectVO(@Param("ew") Wrapper<JifenjiluEntity> wrapper);

	List<JifenjiluView> selectListView(@Param("ew") Wrapper<JifenjiluEntity> wrapper);

	List<JifenjiluView> selectListView(Pagination page, @Param("ew") Wrapper<JifenjiluEntity> wrapper);

	JifenjiluView selectView(@Param("ew") Wrapper<JifenjiluEntity> wrapper);

	List<JifenjiluView> selectListView1(Pagination page, @Param("params") Map<String, Object> params);
	
}
