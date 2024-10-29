package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.DiscussshangpinxinxiEntity;
import com.entity.view.DiscussshangpinxinxiView;
import com.entity.vo.DiscussshangpinxinxiVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 商品评论表
 * 
 * @author 
 * @email 
 * @date
 */
public interface DiscussshangpinxinxiDao extends BaseMapper<DiscussshangpinxinxiEntity> {
	List<DiscussshangpinxinxiView> selectListView1(Pagination page, @Param("params") Map<String, Object> params);
	
	List<DiscussshangpinxinxiVO> selectListVO(@Param("ew") Wrapper<DiscussshangpinxinxiEntity> wrapper);
	
	DiscussshangpinxinxiVO selectVO(@Param("ew") Wrapper<DiscussshangpinxinxiEntity> wrapper);

	List<DiscussshangpinxinxiView> selectListView(@Param("ew") Wrapper<DiscussshangpinxinxiEntity> wrapper);

	List<DiscussshangpinxinxiView> selectListView(Pagination page, @Param("ew") Wrapper<DiscussshangpinxinxiEntity> wrapper);
	
	DiscussshangpinxinxiView selectView(@Param("ew") Wrapper<DiscussshangpinxinxiEntity> wrapper);
	
}
