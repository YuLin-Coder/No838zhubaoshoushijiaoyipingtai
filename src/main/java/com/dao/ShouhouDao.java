package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.ShouhouEntity;
import com.entity.YonghuEntity;
import com.entity.view.YonghuView;
import com.entity.vo.YonghuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 用户
 * 
 * @author 
 * @email 
 * @date 2021-01-08 22:38:58
 */
public interface ShouhouDao extends BaseMapper<ShouhouEntity> {

	/*List<YonghuVO> selectListVO(@Param("ew") Wrapper<ShouhouEntity> wrapper);

	YonghuVO selectVO(@Param("ew") Wrapper<ShouhouEntity> wrapper);

	List<YonghuView> selectListView(@Param("ew") Wrapper<YonghuEntity> wrapper);

	List<YonghuView> selectListView(Pagination page, @Param("ew") Wrapper<YonghuEntity> wrapper);
	
	YonghuView selectView(@Param("ew") Wrapper<YonghuEntity> wrapper);*/
	
}
