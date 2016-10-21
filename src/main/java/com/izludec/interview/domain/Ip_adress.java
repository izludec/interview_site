package com.izludec.interview.domain;
import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;


@Entity
@Table(name = "ip_adresses")
public class Ip_adress implements Serializable {
 

 //protected static Logger logger = Logger.getLogger("service");
  
 @Id
 @Column(name = "ID")
 @GeneratedValue
 private Integer id;
 
 @Column(name = "Adress")
 private String Adress;
 
  @Column(name = "VISITDATE")
 private String date;

    public Integer getId() {
        return id;
    }

    public String getAdress() {
        return Adress;
    }

    public String getDate() {
        return date;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setAdress(String Adress) {
        this.Adress = Adress;
    }
    
    
    public void setDate(Date date) {    
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy/HH:mm:ss");
   // dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+3:00"));
   Date mydate = new Date();
   mydate.setHours(new Date().getHours()+3);
    this.date = dateFormat.format(mydate);
  
 }
}