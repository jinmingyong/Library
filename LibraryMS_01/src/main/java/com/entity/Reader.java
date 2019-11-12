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
    private Integer credit;
    private static final long serialVersionUID = 1L;

    public Reader(String rname, String rpwd, String rsex, String remail, String rphone, String raddress, String image, Integer credit)
    {
        this.rname = rname;
        this.rpwd = rpwd;
        this.rsex = rsex;
        this.remail = remail;
        this.rphone = rphone;
        this.raddress = raddress;
        this.image = image;
        this.credit = credit;
    }

    public Reader(){}

}