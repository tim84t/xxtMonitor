package com.qt.xxtmonitor.handler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.conn.ConnectTimeoutException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.qt.core.util.CompareUtil;
import com.qt.core.util.HttpClientUtil;
import com.qt.xxtmonitor.dao.impl.MonRestartDao;
import com.qt.xxtmonitor.model.MonitorObj;
import com.qt.xxtmonitor.model.UrlMonitor;

@Component(value="urlMonitorHandler")
public class UrlMonitorHandler extends MonitorHandler{

	private static final Log loggerInfo = LogFactory.getLog("INFO."
			+ UrlMonitorHandler.class.getName());
	private static final Log logger = LogFactory
			.getLog(UrlMonitorHandler.class.getName());
	
	@Resource(name="monRestartDao")
	private MonRestartDao monRestartDao;

	public void process(final List<MonitorObj> list) throws MonitorException {
		for (MonitorObj obj : list) {
			long curTime = System.currentTimeMillis();
			UrlMonitor urlMonitor = (UrlMonitor) obj;
			String result="";
			try{
				RequestConfig requestConfig = null;
				requestConfig = RequestConfig.custom().setSocketTimeout(urlMonitor.getConnTimeout()).
							setConnectTimeout(urlMonitor.getConnTimeout()).setConnectionRequestTimeout(urlMonitor.getConnTimeout()).build();
				if(urlMonitor.getIsCheckStatus() == 1){
					result = HttpClientUtil.returnStatus(urlMonitor.getUrl(), urlMonitor.getReqType(),requestConfig)+"";
				}else{
					result = HttpClientUtil.post(urlMonitor.getUrl(), "",requestConfig);
				}
				
				boolean flag = CompareUtil.compare(result,
						urlMonitor.getMonitorContent(),
						urlMonitor.getCompareParam());
				if (flag) {
					urlMonitor.setError(false);
				}else{
					urlMonitor.setWarnMsg(urlMonitor.getWarnMsg()+":"+result);
					//重启标识+1
					if(monRestartDao.exist(urlMonitor.getErrorCode())){
						monRestartDao.increaceFault(urlMonitor.getErrorCode());
					}
				}
				Date date = new Date();
				loggerInfo.info(urlMonitor.getUrl() + " : " + result.trim() + " : "
						+ urlMonitor.getRemark() + " : "
						+ (date.getTime() - curTime));
			}catch (ConnectTimeoutException e1){
				urlMonitor.setWarnMsg(urlMonitor.getWarnMsg()+"connection timeout");
				urlMonitor.setError(true);
			}catch (Exception e){
				logger.error(null,e);
				urlMonitor.setWarnMsg(urlMonitor.getWarnMsg()+"error");
				urlMonitor.setError(true);
			}
		}
	}
	
	public List<MonitorObj> getMonitorList(int warnInterval) {
		String sql = "select error_code,type,monitor_content,warn_interval,"
				+ "warn_msg,remark,phones,url,conn_time_out,compareParam,req_type,is_check_status from SUP_MON_URL where enable=1 and warn_interval=?";
		
		List<MonitorObj> list = getJdbcTemplate().query(sql, new Object[]{warnInterval},new RowMapper<MonitorObj>(){

			public MonitorObj mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				UrlMonitor obj = new UrlMonitor();
				obj.setMonitorContent(rs.getString("monitor_content"));
				obj.setMonitorInterval(rs.getInt("warn_interval"));
				obj.setConnTimeout(rs.getInt("conn_time_out"));
				obj.setWarnMsg(rs.getString("warn_msg"));
				obj.setRemark(rs.getString("remark"));
				obj.setPhones(rs.getString("phones"));
				obj.setCompareParam(rs.getString("compareParam"));
				obj.setUrl(rs.getString("url"));
				obj.setReqType(rs.getString("req_type"));
				obj.setIsCheckStatus(rs.getInt("is_check_status"));
				obj.setErrorCode(rs.getString("error_code"));
				return obj;
			}
		});
		
		return list;
	}

}
