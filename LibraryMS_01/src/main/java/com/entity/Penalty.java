package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
@Data
public class Penalty implements Serializable {
    private Long penId;
    private String isbn;
    private Long rid;
    private String penType;
    private Double repay;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date penTime;
    private BookRes bookRes;
    private Reader reader;

    private static final long serialVersionUID = 1L;
}