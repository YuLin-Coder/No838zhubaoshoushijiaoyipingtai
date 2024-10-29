package com.entity.view;

import com.entity.DiscussshangpinxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 商品评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date
 */
@TableName("discussshangpinxinxi")
public class DiscussshangpinxinxiView  extends DiscussshangpinxinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscussshangpinxinxiView(){
	}
 
 	public DiscussshangpinxinxiView(DiscussshangpinxinxiEntity discussshangpinxinxiEntity){
 	try {
			BeanUtils.copyProperties(this, discussshangpinxinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}

	private  String yonghuxingming;
	private  String lianxidianhua;
	private  String shangpinmingcheng;


	public String getYonghuxingming() {
		return yonghuxingming;
	}

	public void setYonghuxingming(String yonghuxingming) {
		this.yonghuxingming = yonghuxingming;
	}

	public String getLianxidianhua() {
		return lianxidianhua;
	}

	public void setLianxidianhua(String lianxidianhua) {
		this.lianxidianhua = lianxidianhua;
	}

	public String getShangpinmingcheng() {
		return shangpinmingcheng;
	}

	public void setShangpinmingcheng(String shangpinmingcheng) {
		this.shangpinmingcheng = shangpinmingcheng;
	}
}
