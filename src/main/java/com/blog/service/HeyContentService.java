package com.blog.service;

import com.blog.domain.HeyContent;
import com.blog.repository.HeyContentRepository;
import org.apache.commons.lang3.StringUtils;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class HeyContentService extends BaseService{
	
	@Autowired
	private HeyContentRepository heyContentRepository;

    public List<HeyContent> findAll(HeyContent heyContent){
            List<Object> param=new ArrayList<>();
            StringBuffer sql=new StringBuffer("select s.*,d.name as dictName from hey_content s ");
            sql.append(" left join sys_dict d on s.dict_id=d.id ");
            sql.append(" where 1=1 ");
            if(StringUtils.isNotBlank(heyContent.getTitle())){
            sql.append(" and s.title like  '%%%s%%'");
            param.add(heyContent.getTitle());
            }




            if(heyContent.getCreateDate()!=null){
            sql.append(" and s.create_date =  '%%%s%%'");
            param.add(heyContent.getCreateDate());
            }

            if(heyContent.getUserId()!=null){
            sql.append(" and s.user_id =  '%%%s%%'");
            param.add(heyContent.getUserId());
            }

        List list=this.find(String.format(sql.toString(), param.toArray()),HeyContent.class);
        return list;
    }
    public void save(HeyContent heyContent){
		heyContentRepository.save(heyContent);
    }

    public HeyContent findOne(Integer id){
        return heyContentRepository.findOne(id);
    }

    public void delete(Integer id){
		heyContentRepository.delete(id);
     }


}
