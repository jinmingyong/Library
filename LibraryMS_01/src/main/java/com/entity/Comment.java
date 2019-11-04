package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
@Data
public class Comment implements Serializable {
    private Long comId;
    private Long rid;
    private String isbn;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date comCreatetime;
    private String context;
    private Reader reader;
    private BookRes bookRes;
    private static final long serialVersionUID = 1L;
}