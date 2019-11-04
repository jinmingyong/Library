package com.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Btype implements Serializable {
    private Integer id;
    private String typename;
    private List<BookRes> resList;
    private static final long serialVersionUID = 1L;
}