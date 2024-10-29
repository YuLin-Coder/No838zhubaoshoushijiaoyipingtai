package com.entity.model;

import java.io.Serializable;
import java.util.Date;


/**
 * 积分记录
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date
 */
public class JifenjiluModel implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	private Long id;


	/**
	 * 用户id
	 */
	private Long yonghuId;

	/**
	 * 商品id
	 */
	private Long shangpinxinxiId;


	/**
	 * 积分类型
	 */
	private String jifenjiluTypes;


	/**
	 * 积分数量
	 */
	private Integer buynumber;


	/**
	 * 记录时间
	 */
	private Date insertTime;


	/**
	 * 创建时间
	 */
	private Date createTime;


	/**
	 * 设置：主键
	 */
	public Long getId() {
		return id;
	}


	/**
	 * 获取：主键
	 */

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：积分类型
	 */
	public String getJifenjiluTypes() {
		return jifenjiluTypes;
	}


	/**
	 * 获取：积分类型
	 */

	public void setJifenjiluTypes(String jifenjiluTypes) {
		this.jifenjiluTypes = jifenjiluTypes;
	}
	/**
	 * 设置：积分数量
	 */
	public Integer getBuynumber() {
		return buynumber;
	}


	/**
	 * 获取：积分数量
	 */

	public void setBuynumber(Integer buynumber) {
		this.buynumber = buynumber;
	}
	/**
	 * 设置：记录时间
	 */
	public Date getInsertTime() {
		return insertTime;
	}


	/**
	 * 获取：记录时间
	 */

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	/**
	 * 设置：创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}


	/**
	 * 获取：创建时间
	 */

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Long getYonghuId() {
		return yonghuId;
	}

	public void setYonghuId(Long yonghuId) {
		this.yonghuId = yonghuId;
	}

	public Long getShangpinxinxiId() {
		return shangpinxinxiId;
	}

	public void setShangpinxinxiId(Long shangpinxinxiId) {
		this.shangpinxinxiId = shangpinxinxiId;
	}

	@Override
	public String toString() {
		return "JifenjiluModel{" +
				"id=" + id +
				", yonghuId=" + yonghuId +
				", shangpinxinxiId=" + shangpinxinxiId +
				", jifenjiluTypes='" + jifenjiluTypes + '\'' +
				", buynumber=" + buynumber +
				", insertTime=" + insertTime +
				", createTime=" + createTime +
				'}';
	}
}
