package com.blog.utils.jsonp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import us.codecraft.webmagic.selector.Html;

import javax.swing.text.html.HTML;

public class HTMLConvert {
	
	
	/**
	 * 解析html中输入框和单选框 的name和value
	 * @param html
	 * @return
	 */
	public static Map<String,String>  convert(String html) {
		try
		{
			Document doc = Jsoup.parse(html);
			Elements texts = doc.select("input[type=text]");
			Map<String,String> keyvalues= new HashMap<String,String>(0);
			for(Element text:texts)
			{

				String key =text.attr("name");
				
					if(keyvalues.containsKey(key))
					{
						if(text.val()!=null && !"".equals(text.val()))
						{
							keyvalues.put(key, text.val());

						}
						continue;
					}	
					
				
					keyvalues.put(key, text.val());
			}
			
			Elements textclass = doc.select("input[class=input Wdate]");
			for(Element text:textclass){
				keyvalues.put(text.attr("name"), text.val());
			}
			
			Elements textclass2 = doc.select("input[class=Wdate]");
			for(Element text:textclass2){
				String key =text.attr("name");
				
				if(keyvalues.containsKey(key))
				{
					if(text.val()!=null && !"".equals(text.val()))
					{
						keyvalues.put(key, text.val());

					}
					continue;
				}	
				
			
				keyvalues.put(key, text.val());
			}
			
			
			
			Elements radios = doc.select("input[type=radio]");
			for(Element radio:radios){
				if(radio.hasAttr("checked"))
				{
				  keyvalues.put(radio.attr("name"), radio.val());
				}
			}
			Elements selects = doc.select("select");
			for(Element select:selects){
				Elements options =  select.children();
				for(Element option:options){
					if(	option.hasAttr("selected")){
						//System.out.println("选中==========="+option.attr("value"));
						keyvalues.put(select.attr("name"), option.attr("value"));
					}
					//System.out.println(option.attr("value"));
				}
			}
			
			return 		keyvalues;
		}catch(Exception ex){
			 ex.printStackTrace();
		}
	   return null;
	}


 	public static List<String> convertList(String html,String listID){
		try
		{
			Document doc = Jsoup.parse(html);
			Elements list = doc.select(".tableYL");
			List datas = new ArrayList<String>(0);
			Element torget_table = null;
			for(Element table:list){
				Elements th = table.select("th");
				String title = th.text();
				if(title.indexOf(listID)!=-1){
					torget_table = table;
					break;
				}
			}
			
			if(torget_table!=null){
				Elements trlist =   torget_table.select("tr");
				for(int i=1;i<trlist.size();i++){
					Elements tdlist = trlist.get(i).select("td");
						String td_Datas=  "";
						for(Element td:tdlist){
							td_Datas =td_Datas+td.text()+"@";
						}
						System.out.println("td_Datas====="+td_Datas);
						datas.add(td_Datas);
				 }
			}
			return datas;
		}catch(Exception ex){
			 ex.printStackTrace();
		}
	   return null;
		
	}
	
	
	public static String getStringNoBlank(String str) {      
        if(str!=null && !"".equals(str)) {      
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");      
            Matcher m = p.matcher(str);      
            String strNoBlank = m.replaceAll("");      
            return strNoBlank;      
        }else {      
            return str;      
        }           
    }     
	
	public static  void convertJS(String html,String jsId){
		  Document doc = Jsoup.parse(html);
		  /*取得script下面的JS变量*/  
	      Elements e = doc.getElementsByTag("script");  
	      Element ele = null;
	      /*循环遍历script下面的JS变量*/  
	      for (Element element : e) {  
	           	if(element.data().indexOf("var investor")!=-1){
	    	  		ele = element;
	    	  		break;
	    	  	}
	      }
	      if(ele!=null){
	        String srcipt = getStringNoBlank(ele.data());
	        System.out.println(srcipt);
	        //investor.annlInvestorId = "08ea1f8830964f74823b4b18d744408b";
	    	String regEx = "investor.annlInvestorId=\"([A-Za-z0-9]|[-])*\"";
	        Pattern pattern = Pattern.compile(regEx);
			Matcher matcher = pattern.matcher(srcipt);
			int n = matcher.groupCount();
			String code ="";
			    int i=0;
	            while (matcher.find()) {
	                 code = matcher.group(0);
	                System.err.println("第"+i+"匹配" + code);
	                i++;
	            }
	        }
	   }
	
	public static void parseLocalPage(String filenae){
		try{
			ClassLoader classLoader = Thread.currentThread() .getContextClassLoader();  
			if (classLoader == null) {  
			classLoader = ClassLoader.getSystemClassLoader();  
			}  
			java.net.URL url = classLoader.getResource("");  
			String ROOT_CLASS_PATH = url.getPath() + "/";  
			File rootFile = new File(ROOT_CLASS_PATH);  
			String WEB_INFO_DIRECTORY_PATH = rootFile.getParent() + "/";  
			File webInfoDir = new File(WEB_INFO_DIRECTORY_PATH);  
			String SERVLET_CONTEXT_PATH = webInfoDir.getParent() ;  
			//String path = SERVLET_CONTEXT_PATH+ "\\clientfile\\app\\yearreport\\view\\yr_view.html" ;
			String path = "E:\\Workspaces\\MyEclipse Professional 2014\\iacmanager\\WebRoot\\clientfile\\app\\yearreport\\view\\yr_view.html" ;
			System.out.println(path);
			File f = new File(path);  
			Document doc = Jsoup.parse(f, "UTF-8");
			Elements elements = doc.getElementsByTag("p");// 根据标签获取
			Element e = elements.get(0);// 因为我知道只有一个p
			System.out.println(e.text());
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public static void parseLocalPage1(String filenae){
		try{
			ClassLoader classLoader = Thread.currentThread() .getContextClassLoader();
			if (classLoader == null) {
				classLoader = ClassLoader.getSystemClassLoader();
			}
			java.net.URL url = classLoader.getResource("");
			String ROOT_CLASS_PATH = url.getPath() + "/";
			File rootFile = new File(ROOT_CLASS_PATH);
			String WEB_INFO_DIRECTORY_PATH = rootFile.getParent() + "/";
			File webInfoDir = new File(WEB_INFO_DIRECTORY_PATH);
			String SERVLET_CONTEXT_PATH = webInfoDir.getParent() ;
			String path =System.getProperty("user.dir")+"/src/main/java/com/blog/utils/jsonp/image_list.html";
			//String path = "E:\\Workspaces\\MyEclipse Professional 2014\\iacmanager\\WebRoot\\clientfile\\app\\yearreport\\view\\yr_view.html" ;
			File f = new File(path);
			Document doc = Jsoup.parse(f, "UTF-8");
			Element element = doc.getElementById("test");// 根据标签获取
			System.out.println(element.toString());
			String content=fileRead(path);
			System.out.println(content);


		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public static String fileRead(String fileName){
		String str="";
		try{
			//fileName=System.getProperty("user.dir")+"/src/main/java/com/blog/utils/jsonp/image_list.html";
			File file = new File(fileName);//定义一个file对象，用来初始化FileReader
			FileReader reader = new FileReader(file);//定义一个fileReader对象，用来初始化BufferedReader
			BufferedReader bReader = new BufferedReader(reader);//new一个BufferedReader对象，将文件内容读取到缓存
			StringBuilder sb = new StringBuilder();//定义一个字符串缓存，将字符串存放缓存中
			String s = "";
			while ((s =bReader.readLine()) != null) {//逐行读取文件内容，不读取换行符和末尾的空格
				sb.append(s + "\n");//将读取的字符串添加换行符后累加存放在缓存中
			}
			bReader.close();
			str = sb.toString();

		}catch (Exception e){

		}
		return str;

	}


	
	
	public static void main(String[] args){
		//fileRead("");
		HTMLConvert.parseLocalPage1("");
		//String path =System.getProperty("user.dir")+"/src/main/java/com/blog/utils/jsonp/image_list.html";
		//String str=fileRead(path);
		//String str = "<body><div id='1'><div id='2'><div id='3'>test3<div id='4'>test4</div></div></div></div></body>";

		/*String delId = "slider";
		Html html = new Html(str);
		String delStr = html.xpath(String.format("/*//*[@id='%s']", delId)).replace("\n","").replace("> +<","><").get().replaceAll(" ","");
		String s1=html.replace("\n","").replace("> +<","><").get().replaceAll(" ","");
		System.out.println("delID:"+delId);
		//System.out.println(html);
		System.out.println("----------------------------------");
		System.out.println(new Html(s1.replace(delStr, "")));*/


		/*


		//正则表达式
		/*Pattern p = Pattern.compile("<div.*id='test'.*</div>");
//测试用的html代码
		//String str = "<html><body>aa<div id='test' class=''>bb</div></body></html>";
		Matcher m = p.matcher(str);
//去除标签
		String result = m.replaceAll("");
		System.out.println(result);*/
	}
}
