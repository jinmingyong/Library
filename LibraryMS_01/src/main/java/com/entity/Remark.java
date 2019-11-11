package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
@JsonIgnoreProperties(value = { "handler" })
public class Remark implements Serializable {
    private Long remId;
    private Long rid;
    private Long comid;
    private Long fatherremid;
    private String replyname;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createtime;
    private String rcontext;
    private Reader reader;
    private static final long serialVersionUID = 1L;

}