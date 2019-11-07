package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
@JsonIgnoreProperties(value = { "handler" })
public class BookRes implements Serializable {
    private Integer bid;
    private String isbn;
    private String bname;
    private Integer btype;
    private String author;
    private String publisher;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date importTime;
    private Integer amount;
    private String image;
    private String introduce;
    private Btype booktype;

}
