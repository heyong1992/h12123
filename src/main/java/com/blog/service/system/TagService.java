package com.blog.service.system;

import com.blog.domain.SysPermission;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hey on 2017/10/18.
 */
@Service
public class TagService {

    @Autowired
    private SysPermissionRepository menuRepository;

    public static <T> List<T> copyIterator(Iterable<T> iter) {
        List<T> copy = new ArrayList<T>();
        while (iter.iterator().hasNext())
            copy.add(iter.iterator().next());
        return copy;
    }

    public List<SysPermission> findPermissions(){
       return menuRepository.findAll();
    }

    public void save(SysPermission permission){
        menuRepository.save(permission);
    }

    public SysPermission findOne(Integer id){
        return menuRepository.findOne(id);
    }

    public void delete(Integer id){
        menuRepository.delete(id);
    }

}
