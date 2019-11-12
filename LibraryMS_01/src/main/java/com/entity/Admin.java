package com.entity;


import java.io.Serializable;

public class Admin implements Serializable
{
  private Integer id;
  private Integer a_id;
  private String a_name;
  private String a_password;
  private String a_email;
  private String phoneNum;
  private String type;
  private String headImage;
  public Integer getA_id()
  {
    return a_id;
  }

  public void setA_id(Integer a_id)
  {
    this.a_id = a_id;
  }

  public String getA_name()
  {
    return a_name;
  }

  public void setA_name(String a_name)
  {
    this.a_name = a_name;
  }

  public String getA_password()
  {
    return a_password;
  }

  public void setA_password(String a_password)
  {
    this.a_password = a_password;
  }

  public String getA_email()
  {
    return a_email;
  }

  public void setA_email(String a_email)
  {
    this.a_email = a_email;
  }

  public String getPhoneNum()
  {
    return phoneNum;
  }

  public void setPhoneNum(String phoneNum)
  {
    this.phoneNum = phoneNum;
  }

  public String getType()
  {
    return type;
  }

  public void setType(String type)
  {
    this.type = type;
  }

  public Integer getId()
  {
    return id;
  }

  public void setId(Integer id)
  {
    this.id = id;
  }

  public String getHeadImage()
  {
    return headImage;
  }

  public void setHeadImage(String headImage)
  {
    this.headImage = headImage;
  }

  public Admin( Integer a_id, String a_name, String a_password, String a_email, String phoneNum, String type, String headImage)
  {
    this.a_id = a_id;
    this.a_name = a_name;
    this.a_password = a_password;
    this.a_email = a_email;
    this.phoneNum = phoneNum;
    this.type = type;
    this.headImage = headImage;
  }

  @Override
  public String toString()
  {
    return "Admin{" +
            "id=" + id +
            ", a_id=" + a_id +
            ", a_name='" + a_name + '\'' +
            ", a_password='" + a_password + '\'' +
            ", a_email='" + a_email + '\'' +
            ", phoneNum='" + phoneNum + '\'' +
            ", type='" + type + '\'' +
            ", headImage='" + headImage + '\'' +
            '}';
  }

  public Admin(){}
}
