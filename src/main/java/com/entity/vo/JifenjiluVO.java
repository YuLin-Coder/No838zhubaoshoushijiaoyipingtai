package com.entity.vo;

import java.io.Serializable;
import java.util.Date;


/**
 * 积分记录
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date
 */
public class JifenjiluVO implements Serializable {
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
	 * 用户id
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
}
