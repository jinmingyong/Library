package com.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
@Data
@JsonIgnoreProperties(value = { "handler" })
public class Reader implements Serializable {
    private Long readId;
    private String rname;
    private String rpwd;
    private String rsex;
    private String remail;
    private String rphone;
    private String raddress;
    private String image;
    private static final long serialVersionUID = 1L;
}