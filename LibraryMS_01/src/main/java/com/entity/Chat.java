package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
@Data
public class Chat implements Serializable {
    private Long chatId;
    private Long rid;
    private Long pid;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date chatCreatime;
    private String context;
    private Reader reader;
    private static final long serialVersionUID = 1L;
}