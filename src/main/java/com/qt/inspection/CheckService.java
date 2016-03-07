package com.qt.inspection;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.qt.core.util.HttpClientUtil;
import com.qt.core.util.PropHandler;
import com.qt.inspection.model.CheckContent;
import com.qt.inspection.model.CheckContentMain;
import com.qt.inspection.model.CheckContentSub;
import com.qt.xxtmonitor.MonitorService;


@Component(value="checkService")
public class CheckService {
	
	private static final Log infoLogger = LogFactory.getLog("INFO."+ CheckService.class.getName());
	private static final Log logger = LogFactory.getLog(CheckService.class.getName());
	
	public void sendCheckContent(){
		String flag = PropHandler.get("is_dailycheck");
		String url = PropHandler.get("dailycheck_url");
		if("1".equals(flag)){//开关
			CheckContent content = getCheckContent(PropHandler.get("dailycheck_filename"));
			
			Gson gson = new Gson();
			String reqMsg = gson.toJson(content);
			/*
			List<NameValuePair> list =  new ArrayList<NameValuePair>();
			NameValuePair nvps = new BasicNameValuePair("t_data",reqMsg);
			list.add(nvps);*/
			try {
				RequestConfig config = RequestConfig.custom().setConnectionRequestTimeout(10000)
						.setConnectTimeout(10000)
						.setSocketTimeout(10000)
						.build();
				HttpClientUtil.post(url, reqMsg, config);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private CheckContent getCheckContent(String filename){
		CheckContent obj = new CheckContent();
		obj.setSub(getCheckContentSub(filename));
		
		CheckContentMain main = new CheckContentMain();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String curDate = sdf.format(date);
		int hours = date.getHours();
		if(hours > 12){
			main.setAmpm("pm");
		}else{
			main.setAmpm("am");
		}
		main.setCheckTime(curDate);
		//sw-上午 xw-下午
		obj.setMain(main);
		
		return obj;
	}
	
	private CheckContentSub[] getCheckContentSub(String check) {
		File file = new File("upfile"+File.separator+check);
		FileReader fr = null;
		BufferedReader br = null;
		List<CheckContentSub> list = new ArrayList<CheckContentSub>();
		try {
			fr = new FileReader(file);
			br = new BufferedReader(fr);
			String str;
			while ((str=br.readLine()) != null ){
				CheckContentSub content = new CheckContentSub();
				String [] strArray = str.split(",");
				if(strArray.length == 10){
					content.setServerip((strArray[0]==null||"".equals(strArray[0].trim()))?"0":strArray[0]);
					content.setCpuUsage((strArray[1]==null||"".equals(strArray[1].trim()))?"0":strArray[1]);
					content.setLoad((strArray[2]==null||"".equals(strArray[2].trim()))?"0":strArray[2]);
					content.setDiskUsage((strArray[3]==null||"".equals(strArray[3].trim()))?"0":strArray[3]);
					content.setSwap((strArray[4]==null||"".equals(strArray[4].trim()))?"0":strArray[4]);
//  				content.setC_tomcat((strArray[5]==null||"".equals(strArray[5].trim()))?"0":strArray[5]);
//	   	    		content.setC_jboss((strArray[6]==null||"".equals(strArray[6].trim()))?"0":strArray[6]);
		 			content.setProcessNum((strArray[7]==null||"".equals(strArray[7].trim()))?"0":strArray[7]);
		 			content.setMemory((strArray[8]==null||"".equals(strArray[8].trim()))?"0":strArray[8]);
		 			content.setMemoryUsage((strArray[9]==null||"".equals(strArray[9].trim()))?"0":strArray[9]);
					list.add(content);
				}
			}
		} catch (FileNotFoundException e) {
			logger.error(null, e);
		} catch (IOException e) {
			logger.error(null, e);
		}finally{
			if(br != null){
				try {
					br.close();
				} catch (IOException e) {
					logger.error(null, e);
				}
			}
			if(fr != null){
				try {
					fr.close();
				} catch (IOException e) {
					logger.error(null, e);
				}
			}
		}
		
		CheckContentSub[] contents = new CheckContentSub[list.size()];
		for(int i=0;i<list.size();i++){
			contents[i]=list.get(i);
		}
		return  contents;
	}
	
	public static void main(String [] args){
		CheckContent content = new CheckService().getCheckContent("check.txt");
		Gson gson = new Gson();
		String str = gson.toJson(content);
		
		System.out.println(str);
	}
	
}
