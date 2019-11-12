package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
@JsonIgnoreProperties(value = { "handler" })
public class Attence implements Serializable {
    private static final long serialVersionUID = 1L;

    private int aId;
    private int sId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date attenceTime;

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public Date getAttenceTime() {
        return attenceTime;
    }

    public void setAttenceTime(Date attenceTime) {
        this.attenceTime = attenceTime;
    }
}
