package com.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hey on 2017/11/12.
 */
@Service
public class BaseService {

    @Autowired
    private EntityManager entityManager;

    public static <T> List<T> copyIterator(Iterable<T> iter) {
        List<T> copy = new ArrayList<T>();
        while (iter.iterator().hasNext())
            copy.add(iter.iterator().next());
        return copy;
    }

    /**
     * 查询的结果是实体的集合
     */
    public List find(String sql,Class c) {
        //创建原生SQL查询QUERY实例,指定了返回的实体类型
        Query query =  entityManager.createNativeQuery(sql, c);
        //执行查询，返回的是实体列表,
        List resultList = query.getResultList();
        return resultList;
    }

    /**
     * 只取第一个查询结果
     */
    public Object  findFrist(String sql,Class c) {
        //创建原生SQL查询QUERY实例,指定了返回的实体类型
        Query query =  entityManager.createNativeQuery(sql, c);
        //执行查询，返回的是实体列表,
        List resultList = query.getResultList();
       return resultList.size()>0?resultList.get(0):null;
    }

    /**
     * 查询单个属性
     * 返回的是这个属性值的集合
     */
    public List<String> find1(String sql) {
        //创建原生SQL查询QUERY实例
        Query query =  entityManager.createNativeQuery(sql);
        //执行查询，返回的是String类型的集合，因为name这个属性是String类型
        List<String>  resultList = query.getResultList();
        return resultList;
    }


    /**
     * 查询多个属性
     * 返回的是这些属性值的数组的集合
     */
    public List<Object[]> find2(String sql) {
        //创建原生SQL查询QUERY实例
        Query query =  entityManager.createNativeQuery(sql);
        //执行查询，返回的是查询属性值数组的集合
        List<Object[]> resultList = query.getResultList();
        /*for(int i=0;i<resultList.size();i++) {
            Object[] obj = (Object[]) resultList.get(i);
            //使用obj[0],obj[1],obj[2]取出属性
        }*/
        return resultList;

    }

    public int executeUpdate(String sql){
        System.out.println(sql);
        Query query =  entityManager.createNativeQuery(sql);
        int result = query.executeUpdate(); //影响的记录数
        return result;
    }
}
