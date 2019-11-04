package com.exception;

import lombok.Data;

@Data
public class SysExcepetion extends Exception {
    //提示信息
    private String message;
    public SysExcepetion(String message) {
        this.message = message;
    }
}
