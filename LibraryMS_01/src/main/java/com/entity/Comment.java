package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@JsonIgnoreProperties(value = { "handler" })
public class Comment implements Serializable {
    private Long comId;
    private Long rid;
    private String isbn;
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date comCreatetime;
    private String image;
    private String context;
    private Reader reader;
    private BookRes bookRes;
    private List<Remark> remarks;
    private static final long serialVersionUID = 1L;
}