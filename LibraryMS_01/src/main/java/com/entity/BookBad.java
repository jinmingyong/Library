package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class BookBad implements Serializable {
    private Integer badId;
    private String isbn;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date badtime;
    private Integer badnum;
    private BookRes bookRes;
    private static final long serialVersionUID = 1L;

}