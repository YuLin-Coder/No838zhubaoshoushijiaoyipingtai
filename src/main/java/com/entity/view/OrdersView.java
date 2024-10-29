package com.entity.view;

import com.entity.OrdersEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;


/**
 * 订单
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date
 */
@TableName("orders")
public class OrdersView  extends OrdersEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public OrdersView(){
	}
 
 	public OrdersView(OrdersEntity ordersEntity){
 	try {
			BeanUtils.copyProperties(this, ordersEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}

	/**
	 * 售后id
	 */
	private String shouhouid;
	/**
	 * 用户诉求内容
	 */
	private String suqiu;
	/**
	 * 诉求时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date suqiutime;

	/**
	 * 是否处理过 1:已处理  2 未处理
	 */

	private Integer shouhoutype;

	/**
	 * 是否处理过值
	 */

	private String shouhouvalue;

	/**
	 * 处理结果  1:已解决  2:未解决
	 */

	private Integer chulitype;

	/**
	 * 处理结果值
	 */

	private String chulivalue;



	/**
	 * 处理内容
	 */

	private String chulicontent;

	/**
	 * 提交售后时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date chulitime;

	public String getShouhouid() {
		return shouhouid;
	}

	public void setShouhouid(String shouhouid) {
		this.shouhouid = shouhouid;
	}

	public String getSuqiu() {
		return suqiu;
	}

	public void setSuqiu(String suqiu) {
		this.suqiu = suqiu;
	}

	public Date getSuqiutime() {
		return suqiutime;
	}

	public void setSuqiutime(Date suqiutime) {
		this.suqiutime = suqiutime;
	}

	public Integer getShouhoutype() {
		return shouhoutype;
	}

	public void setShouhoutype(Integer shouhoutype) {
		this.shouhoutype = shouhoutype;
	}

	public String getShouhouvalue() {
		return shouhouvalue;
	}

	public void setShouhouvalue(String shouhouvalue) {
		this.shouhouvalue = shouhouvalue;
	}

	public Integer getChulitype() {
		return chulitype;
	}

	public void setChulitype(Integer chulitype) {
		this.chulitype = chulitype;
	}

	public String getChulivalue() {
		return chulivalue;
	}

	public void setChulivalue(String chulivalue) {
		this.chulivalue = chulivalue;
	}

	public String getChulicontent() {
		return chulicontent;
	}

	public void setChulicontent(String chulicontent) {
		this.chulicontent = chulicontent;
	}

	public Date getChulitime() {
		return chulitime;
	}

	public void setChulitime(Date chulitime) {
		this.chulitime = chulitime;
	}
}
