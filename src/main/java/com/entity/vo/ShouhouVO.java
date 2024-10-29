package com.entity.vo;

import com.baomidou.mybatisplus.annotations.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class ShouhouVO   implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId
    private Long id;
    /**
     * 订单id
     */

    private String orderid;
    /**
     * 用户诉求
     */

    private String suqiu;

    /**
     * 提交售后时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date suqiutime;

    /**
     * 是否处理过 1:已处理  2 未处理
     */

    private Integer shouhoutype;

    /**
     * 处理结果  1:已解决  2:未解决
     */

    private Integer chulitype;



    /**
     * 处理内容
     */

    private String chulicontent;

    /**
     * 提交售后时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date chulitime;




    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
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

    public Integer getChulitype() {
        return chulitype;
    }

    public void setChulitype(Integer chulitype) {
        this.chulitype = chulitype;
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

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
