package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
@Data
public class BookInuse implements Serializable {
    private Integer inuId;
    private String isbn;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date inusetime;
    private Integer amount;
    private BookRes bookRes;

    private static final long serialVersionUID = 1L;

}