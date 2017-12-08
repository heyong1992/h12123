package com.blog.config.shiro.tag;

import com.blog.utils.ObjectUtils;
import org.apache.commons.collections.map.HashedMap;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by hey on 2017/11/8.
 */
public class SelectValueTagHandler extends SimpleTagSupport implements DynamicAttributes {
    private static final String ATTR_TEMPLATE = "%s='%s'";
    private static final String OPTION_TEMPLATE = "<option value='%1$s'>%2$s</option>";
    private List optionsList;
    private String name;
    private String size;
    private Map<String, Object> tagAttrs = new HashedMap();

    public void setName(String name) {
        this.name = name;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setOptionsList(List optionsList) {
        this.optionsList = optionsList;
    }

    @Override
    public void doTag() throws JspException, IOException {
        PageContext pageContext = (PageContext) getJspContext();
        JspWriter out = pageContext.getOut();
        out.print("<select ");
        out.print(String.format(ATTR_TEMPLATE, "name", this.name));
        out.print(String.format(ATTR_TEMPLATE, "size", this.size));
        for (String attrName : tagAttrs.keySet()) {
            String attrDefinition = String.format(ATTR_TEMPLATE, attrName, tagAttrs.get(attrName));
            out.print(attrDefinition);
        }
        out.print(">");
        if(tagAttrs.get("isHead")!=null&&"true".equalsIgnoreCase(tagAttrs.get("isHead").toString())){
            out.print("<option value=''>--请选择--</option>");
        }
        for (Object option : this.optionsList) {
            Map<String, Object> map=ObjectUtils.objectToMap(option);
            String optionTag="";
            if(tagAttrs.get("value")!=null&&tagAttrs.get("value").equals(map.get("id"))){
                optionTag=String.format("<option selected value='%1$s'>%2$s</option>",map.get("id"),map.get("name"));
            }else{
                optionTag=String.format(OPTION_TEMPLATE,map.get("id"),map.get("name"));
            }
            //String optionTag = String.format(OPTION_TEMPLATE,map.get("id"),map.get("name"));
            out.println(optionTag);
        }
        out.println("</select>");
    }

    @Override
    public void setDynamicAttribute(String uri, String name, Object value) throws JspException {
        tagAttrs.put(name, value);
    }
}