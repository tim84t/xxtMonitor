package com.qt.core.command;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

/**
 * 服务器连接
 * 
 * @author Administrator
 * 
 */

public class SHH2Client {
	public boolean is_Enable() {
		return _Enable;
	}

	private static Log log = LogFactory.getLog(SHH2Client.class.getName());
	private static long startTime, endTime;
	private Connection conn = null;
	private String hostIP, userName, password;
	int port;
	private boolean _Enable;
	// private Logger log = Logger.getLogger(BaseCheck.class.getName());
	// 命令列表
	private ArrayList<String> cmdList = null;

	public SHH2Client() {

	}
	
	public SHH2Client(String hostIP, int port, String userName) {
		cmdList = new ArrayList<String>();
		this.userName = userName;
		this.hostIP = hostIP;
		this.port = port;
	}

	public SHH2Client(String hostIP, int port, String userName, String password) {
		cmdList = new ArrayList<String>();
		this.hostIP = hostIP;
		this.userName = userName;
		this.password = password;
		this.port = port;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SHH2Client remote = null;
		try {
//			remote = new SHH2Client("61.142.114.237", 22, "root",
//					"qT*13b#aN^jk713(t");
			//账号密码
//			remote = new SHH2Client("192.168.210.70", 22, "xxtuser","w(fk76Ef32Hf");
//			remote.openConnect();
			
			//public key
			remote = new SHH2Client("192.168.210.70", 22, "xxtuser");
			remote.openConnect("D:\\SVN\\xxt2_gd\\trunk\\sub\\xxtMonitor\\src\\main\\resources\\key");
			
//			remote = new SHH2Client("61.142.114.242", 22, "gdxxt","QT&*fe3334r3");
//			remote.openConnect("D:/workspace_support_qt/support-qt/metedata/242publickey.txt");
//			remote.addCmd("ls -l");
//			remote.addCmd("cd /data/fpsSocket");
//			remote.addCmd("./fpsSocketStart.sh");
//			remote.addCmd("tail -10 nohup.out");
//			remote.addCmd("/usr/local/Python-2.7.2/bin/ansible test -m shell -a \"sh /tmp/test.sh\"");
//			remote.addCmd("/usr/local/Python-2.7.2/bin/ansible test -m shell -a \"echo 测试\"");
			
//			remote.addCmd("/data/release/fpssocket_new/5.checklog.sh");
//			remote.addCmd("/usr/local/Python-2.7.2/bin/ansible test -m shell -a \"echo 娴嬭瘯\"");
			remote.addCmd("sh /data/xxtMonitor/start.sh");
			
			// remote.addCmd("tail -10 nohup.out");
			remote.addCmd("echo 'finished'");
			ExecuteResult result = remote.executeCmd();
			remote.closeConnect();
			System.out.println(result.getExitCode()+":"+result.getExecuteOut());
			
			/**
			byte[] resp1 = resp.getBytes("GBK");
			System.out.println(new String(resp1,"UTF8"));
			System.out.println(new String(resp1,"GBK"));
			
			byte[] resp2 = resp.getBytes("UTF8");
			System.out.println(new String(resp2,"UTF8"));
			System.out.println(new String(resp2,"GBK"));
			**/
			
			
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			// remote.executeCmd("cat /tmp/test.txt");

			/*
			 * Connection conn1 = new Connection("61.142.114.237",22);
			 * conn1.connect(); boolean isAuthenticated =
			 * conn1.authenticateWithPassword("root", "Q*13b#aN3SaH420!t");
			 * System.out.println( isAuthenticated);
			 */

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			remote.closeConnect();
		}
	}

	/**
	 * 使用安全密码方式登录
	 * 
	 * @throws IOException
	 *             If you get an IOException saying something like
	 *             "Authentication method password not supported by the server
	 *             at this stage." then please check the FAQ.
	 */
	public void openConnect() throws IOException {
		boolean isAuthenticated = false;
		// conn = new Connection(hostIP);
		conn = new Connection(hostIP, port);
		/* Now connect */
		conn.connect();
		isAuthenticated = conn.authenticateWithPassword(userName, password);
		if (isAuthenticated == false)
			throw new IOException("鉴权失败，无法连接服务器");
	}

	public boolean isAuthenticated() {
		try {
			conn = new Connection(hostIP, port);
			conn.connect();
			boolean isAuthenticated = conn.authenticateWithPassword(userName,
					password);

			return isAuthenticated;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			conn.close();
		}
	}

	/**
	 * 使用公共密钥文件登录
	 * 
	 * @param publickey
	 *            公共密钥文件的本地存储路径
	 * @throws IOException
	 *             If you get an IOException saying something like
	 *             "Authentication method password not supported by the server
	 *             at this stage." then please check the FAQ.
	 */
	public void openConnect(String publickey) throws IOException {
		boolean isAuthenticated = false;
		conn = new Connection(hostIP, port);
		/* Now connect */
		conn.connect();
		isAuthenticated = conn.authenticateWithPublicKey(userName, new File(
				publickey), password);
		if (isAuthenticated == false)
			throw new IOException("鉴权失败，无法连接服务器");
	}

	public void closeConnect() {
		conn.close();
	}

	public String executeCmd(String cmd) throws IOException {
		// startTime = System.currentTimeMillis();
		String result = null;
		/* Create a session */
		Session sess = conn.openSession();
		sess.requestPTY("bash");
		sess.execCommand(cmd);
		// log.debug("正在执行命令：# " + cmd);
		result = readInStreamToStr(sess.getStdout());
		// log.debug("返回结果：-----------------------------------------------------");
		if (result != null)
			result = result.replace("\n", "");
		log.debug("数据源： 命令返回结果：" + result);
		/* Close this session */
		sess.close();
		// endTime = System.currentTimeMillis();
		// log.debug("执行完毕,花费时间:" + (endTime - startTime) + "ms");
		// log.debug("-------------------------------------------------------------");
		return result;
	}

	/**
	 * 判断命令是否能正常执行，无错误返回NULL,有错误返回错误信息
	 */
	public String checkCmdRun() {
		startTime = System.currentTimeMillis();
		String result = null;
		try {
			if (cmdList == null) {
				return "";
			}
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < cmdList.size(); i++) {
				sb.append(cmdList.get(i) + ";");
			}
			/* Create a session */
			Session sess = conn.openSession();
			sess.execCommand(sb.toString());
			// log.debug("正在执行命令：" + sb.toString());
			result = readInStreamToStr(sess.getStdout());
			if (result != null)
				result = result.replaceAll("\n", "");
			System.out.println("ExitCode: " + sess.getExitStatus());
			log.debug("命令返回结果：" + result);
			// log.debug("-------------------------------------------------------------");
			sess.close();
		} catch (IOException e) {
			e.printStackTrace(System.err);
			System.exit(2);
		} finally {
			cmdList = new ArrayList<String>();
		}
		endTime = System.currentTimeMillis();
		// log.debug("执行完毕,花费时间:" + (endTime - startTime) + "ms");
		return result;
	}

	public void addCmd(String cmd) {
		cmdList.add(cmd.trim());
	}

	public ExecuteResult executeCmd() throws IOException{
		startTime = System.currentTimeMillis();
		BufferedReader br = null;
		BufferedReader brErr = null;
		String result = "";
		ExecuteResult er = null;
		Session sess = null;
		try {
			if (cmdList == null) {
				return null;
			}
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < cmdList.size(); i++) {
				sb.append(cmdList.get(i) + ";");
			}
			/* Create a session */
			sess = conn.openSession();
			sess.execCommand(sb.toString());
			// log.debug("正在执行命令：" + sb.toString());
			InputStream stdout = new StreamGobbler(sess.getStdout());
			br = new BufferedReader(new InputStreamReader(stdout,"GBK"));
			while (true) {
				String line = br.readLine();
				if (line == null)
					break;
				result += line+System.getProperty("line.separator");
//				System.out.print(line);
				if ("finished".equals(line)) {
					sess.close();
				}
			}
			
			InputStream stdErr = new StreamGobbler(sess.getStderr());
			brErr = new BufferedReader(new InputStreamReader(stdErr));
			while(true){
				String line = brErr.readLine();
				if(line == null)
					break;
				result += line + System.getProperty("line.separator");
			}
			
			// log.debug("命令返回结果：" + result);
			er = new ExecuteResult(sess.getExitStatus(), result);
			log.debug("ExitCode: " + sess.getExitStatus());
			// log.debug("-------------------------------------------------------------");
			
		} catch (IOException e) {
			throw e;
		} finally {
			cmdList = new ArrayList<String>();
			if(br != null){
				br.close();
			}
			if(br != null){
				brErr.close();
			}
			if(sess != null){
				sess.close();
			}
		}
		endTime = System.currentTimeMillis();
		// log.debug("执行完毕,花费时间:" + (endTime - startTime) + "ms");
		return er;
	}

	private static String readInStreamToStr(InputStream in) {
		String str = "";
		byte[] bytearray = new byte[1024];
		int len;
		try {
			while ((len = in.read(bytearray, 0, 1024)) > 0) {
				str = str + new String(bytearray, 0, len, "utf-8");
				if (len < 1024)
					break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static ArrayList<String> readInStreamToStrArray(InputStream in) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			String line;
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(in));
			line = reader.readLine(); // 读取第一行
			while (line != null) { // 如果 line 为空说明读完了
				list.add(line); // 将读到的内容添加到 buffer 中
				line = reader.readLine(); // 读取下一行
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getHostIP() {
		return hostIP;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public String getPassword() {
		return password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}
}
