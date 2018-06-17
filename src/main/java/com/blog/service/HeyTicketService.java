package com.blog.service;

import com.blog.domain.HeyTicket;
import com.blog.repository.HeyTicketRepository;
import org.apache.commons.lang3.StringUtils;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class HeyTicketService extends BaseService{
	
	@Autowired
	private HeyTicketRepository heyTicketRepository;

    public List<HeyTicket> findAll(HeyTicket heyTicket){
            List<Object> param=new ArrayList<>();
            StringBuffer sql=new StringBuffer("select s.* from hey_ticket s");
            sql.append(" where 1=1 ");
            if(StringUtils.isNotBlank(heyTicket.getCardInfos())){
            sql.append(" and s.card_infos like  '%%%s%%'");
            param.add(heyTicket.getCardInfos());
            }

            if(StringUtils.isNotBlank(heyTicket.getEndAddress())){
            sql.append(" and s.end_address like  '%%%s%%'");
            param.add(heyTicket.getEndAddress());
            }

            if(StringUtils.isNotBlank(heyTicket.getGoDate())){
            sql.append(" and s.go_date like  '%%%s%%'");
            param.add(heyTicket.getGoDate());
            }

            if(StringUtils.isNotBlank(heyTicket.getQqNumber())){
            sql.append(" and s.qq_number like  '%%%s%%'");
            param.add(heyTicket.getQqNumber());
            }

            if(StringUtils.isNotBlank(heyTicket.getStartAddress())){
            sql.append(" and s.start_address like  '%%%s%%'");
            param.add(heyTicket.getStartAddress());
            }

            if(StringUtils.isNotBlank(heyTicket.getTelPhone())){
            sql.append(" and s.tel_phone like  '%%%s%%'");
            param.add(heyTicket.getTelPhone());
            }

        List list=this.find(String.format(sql.toString(), param.toArray()),HeyTicket.class);
        return list;
    }
    public void save(HeyTicket heyTicket){
		heyTicketRepository.save(heyTicket);
    }

    public HeyTicket findOne(Long id){
        return heyTicketRepository.findOne(id);
    }

    public void delete(Long id){
		heyTicketRepository.delete(id);
     }


}
