package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 积分记录表
 *
 * @author 
 * @email
 * @date
 */
@TableName("jifenjilu")
public class JifenjiluEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public JifenjiluEntity() {

	}

	public JifenjiluEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")

    private Long id;


    /**
     * 用户id
     */
    @TableField(value = "yonghu_id")

    private Long yonghuId;

    /**
     * 商品id
     */
    @TableField(value = "shangpinxinxi_id")

    private Long shangpinxinxiId;


    /**
     * 积分类型
     */
    @TableField(value = "jifenjilu_types")

    private String jifenjiluTypes;


    /**
     * 积分数量
     */
    @TableField(value = "buynumber")

    private Integer buynumber;


    /**
     * 记录时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "create_time",fill = FieldFill.INSERT)

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getJifenjiluTypes() {
        return jifenjiluTypes;
    }

    public void setJifenjiluTypes(String jifenjiluTypes) {
        this.jifenjiluTypes = jifenjiluTypes;
    }

    public Integer getBuynumber() {
        return buynumber;
    }

    public void setBuynumber(Integer buynumber) {
        this.buynumber = buynumber;
    }

    public Date getInsertTime() {
        return insertTime;
    }

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "JifenjiluEntity{" +
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
