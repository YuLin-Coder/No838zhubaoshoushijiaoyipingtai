package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.ShouhouDao;
import com.dao.YonghuDao;
import com.entity.ShouhouEntity;
import com.entity.YonghuEntity;
import com.entity.view.YonghuView;
import com.entity.vo.YonghuVO;
import com.service.ShouhouService;
import com.service.YonghuService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("shouhouService")
public class ShouhouServiceImpl extends ServiceImpl<ShouhouDao, ShouhouEntity> implements ShouhouService {


}
