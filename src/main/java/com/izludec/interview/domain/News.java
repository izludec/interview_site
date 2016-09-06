package com.izludec.interview.domain;
import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "NEWS")
public class News implements Serializable {
 
 private static final long serialVersionUID = -5527566248002296042L;
  
 @Id
 @Column(name = "ID")
 @GeneratedValue
 private Integer id;
 
 @Column(name = "HEAD")
 private String head;
  
 @Column(name = "TEXT")
 private String text;
  
 @Column(name = "PUBLDATE")
 private Date date;
 
 @Column(name = "CATEGORY")
 private String category;

 public String getHead() {
  return head;
 }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
 

 public void setHead(String head) {
  this.head = head;
 }

 public static long getSerialVersionUID() {
  return serialVersionUID;
 }

 public Integer getId() {
  return id;
 }

 public void setId(Integer id) {
  this.id = id;
 }

 public String getText() {
  return text;
 }

 public void setText(String text) {
  this.text = text;
 }

 public Date getDate() {
  return date;
 }

 public void setDate(Date date) {
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  this.date = new Date();
 }
}