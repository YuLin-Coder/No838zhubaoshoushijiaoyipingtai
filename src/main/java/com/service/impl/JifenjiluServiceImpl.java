package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.JifenjiluDao;
import com.entity.JifenjiluEntity;
import com.entity.view.JifenjiluView;
import com.entity.vo.JifenjiluVO;
import com.service.JifenjiluService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("jifenjiluService")
public class JifenjiluServiceImpl extends ServiceImpl<JifenjiluDao, JifenjiluEntity> implements JifenjiluService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JifenjiluEntity> page = this.selectPage(
                new Query<JifenjiluEntity>(params).getPage(),
                new EntityWrapper<JifenjiluEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JifenjiluEntity> wrapper) {
		  Page<JifenjiluView> page =new Query<JifenjiluView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JifenjiluVO> selectListVO(Wrapper<JifenjiluEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JifenjiluVO selectVO(Wrapper<JifenjiluEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JifenjiluView> selectListView(Wrapper<JifenjiluEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JifenjiluView selectView(Wrapper<JifenjiluEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


	@Override
	public PageUtils queryPage1(Map<String,Object> params) {
		if(params != null && (params.get("limit") == null || params.get("page") == null)){
			params.put("page","1");
			params.put("limit","10");
		}
		Page<JifenjiluView> page =new Query<JifenjiluView>(params).getPage();
		page.setRecords(baseMapper.selectListView1(page,params));
		return new PageUtils(page);
	}
}
