package com.entity;

import lombok.Data;

import java.io.Serializable;
@Data
public class Reader implements Serializable {
    private Long readId;
    private String rname;
    private String rpwd;
    private String rsex;
    private String remail;
    private String rphone;
    private String raddress;
    private static final long serialVersionUID = 1L;
}