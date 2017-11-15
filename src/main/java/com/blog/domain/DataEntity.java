package com.blog.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Administrator on 2017/8/24 0024.
 */

@MappedSuperclass
public class DataEntity {

    @Id
    @GeneratedValue
    private Long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Timestamp createDate;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }
}
