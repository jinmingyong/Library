package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: MrLiu
 * Date: 2019/11/7
 */
@Data
public class BookBooking implements Serializable {
    private Integer id;
    private Integer bid;
    private Integer rid;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date bookingTime;
}
