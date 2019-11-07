package com.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@JsonIgnoreProperties(value = { "handler" })
public class Btype implements Serializable {
    private Integer id;
    private String typename;
    private List<BookRes> resList;
    private static final long serialVersionUID = 1L;
}