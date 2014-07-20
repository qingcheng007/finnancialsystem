package com.ztyj6.fs.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/fileController")
public class FileController extends BaseController {

	private static final String TYPE_QUESTION = "question";
	private static final String TYPE_ADD_STUDENT_EXCEL = "addStudentExcel";

	private static final String UPLOAD_DIR = "upload";
	private static final String TEMP_DIR = "temp";

	private static final int MAXSIZE = 1000000;

	private static HashMap<String, String> extMap;
	static {
		extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
		extMap.put("other", "");
	}

	@RequestMapping(value = "/upload", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public JSONObject upload(HttpServletRequest request) throws ServletException, IOException, FileUploadException {

		if (!ServletFileUpload.isMultipartContent(request)) {
			return getError("请选择文件。");
		}

		ServletContext application = request.getSession().getServletContext();

		String dirName = request.getParameter("dir");
		String type = request.getParameter("type");

		// 文件保存目录URL
		StringBuilder savePath = new StringBuilder();
		// 访问URL
		StringBuilder saveUrl = new StringBuilder();

		if (type != null) {
			if (type.equals(TYPE_QUESTION)) {
				savePath.append(application.getRealPath("/")).append(UPLOAD_DIR).append("/");
				saveUrl.append(request.getContextPath()).append("/").append(UPLOAD_DIR).append("/");
			} else if (type.equals(TYPE_ADD_STUDENT_EXCEL)) {
				savePath.append(application.getRealPath("/")).append(TEMP_DIR).append("/");
				saveUrl.append(request.getContextPath()).append("/").append(TEMP_DIR).append("/");
			}
		} else
			return getError("类型不能为空。");

		// 检查目录
		File uploadDir = new File(savePath.toString());
		if (!uploadDir.isDirectory()) {
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
		}

		// 检查目录写权限
		if (!uploadDir.canWrite()) {
			return getError("上传目录没有写权限。");
		}

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		List items = upload.parseRequest(request);
		Iterator itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			String fileName = item.getName();
			long fileSize = item.getSize();
			if (!item.isFormField()) {
				// 检查文件大小
				if (fileSize > MAXSIZE) {
					return getError("上传文件大小超过限制。");
				}
				// 检查扩展名
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

				if (dirName != null) {
					if (!extMap.containsKey(dirName)) {
						return getError("目录名不正确。");
					}
					if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(fileExt)) {
						return getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
					}
				} else {
					dirName = getDir(fileExt);
				}
				if (type.equals(TYPE_QUESTION)) {
					savePath.append(type).append("/").append(dirName).append("/");
					saveUrl.append(type).append("/").append(dirName).append("/");

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String ymd = sdf.format(new Date());

					savePath.append(ymd).append("/");
					saveUrl.append(ymd).append("/");

				} else if (type.equals(TYPE_ADD_STUDENT_EXCEL)) {
					savePath.append(dirName).append("/");
					saveUrl.append(dirName).append("/");
				}

				File saveDirFile = new File(savePath.toString());
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}

				File dirFile = new File(savePath.toString());
				if (!dirFile.exists()) {
					dirFile.mkdirs();
				}

				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				try {
					File uploadedFile = new File(savePath.toString(), newFileName);
					item.write(uploadedFile);
				} catch (Exception e) {
					return getError("上传文件失败。");
				}

				JSONObject obj = new JSONObject();
				obj.put("error", 0);
				if (type.equals(TYPE_ADD_STUDENT_EXCEL))
					obj.put("url", savePath + newFileName);
				else
					obj.put("url", saveUrl + newFileName);
				return obj;
			}
		}
		return null;
	}

	@RequestMapping(value = "/getFiles", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getFiles(HttpServletRequest request) {

		ServletContext application = request.getSession().getServletContext();

		StringBuilder rootPath = new StringBuilder();
		rootPath.append(application.getRealPath("/")).append("upload/");

		StringBuilder rootUrl = new StringBuilder();
		rootUrl.append(request.getContextPath()).append("/upload/");

		String dirName = request.getParameter("dir");
		if (dirName != null) {
			if (!extMap.containsKey(dirName)) {
				return null;
			}
		}

		String type = request.getParameter("type");
		if (type != null) {
			rootPath.append(type).append("/");
			rootUrl.append(type).append("/");
			File saveDirFile = new File(rootPath.toString());
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}

		// 根据path参数，设置各路径和URL
		String path = request.getParameter("path") != null ? request.getParameter("path") : "";
		String currentPath = rootPath.append(path).toString();
		String currentUrl = rootUrl.append(path).toString();
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}

		// 排序形式，name or size or type
		String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

		// 不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			return null;
		}
		// 最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			return null;
		}
		// 目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if (!currentPathFile.isDirectory()) {
			return null;
		}

		// 遍历目录取的文件信息
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		if (currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if (file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if (file.isFile()) {
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", extMap.get(dirName).contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		JSONObject result = new JSONObject();
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);
		return result;
	}

	private String getDir(String fileExt) {
		Iterator iter = extMap.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			Object val = entry.getValue();
			if (Arrays.<String> asList(((String) val).split(",")).contains(fileExt)) {
				return (String) entry.getKey();
			}
		}
		return "other";
	}

	private JSONObject getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj;
	}

	private static class NameComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir")) && !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir")) && ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filename")).compareTo((String) hashB.get("filename"));
			}
		}
	}

	private static class SizeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir")) && !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir")) && ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long) hashA.get("filesize")) > ((Long) hashB.get("filesize"))) {
					return 1;
				} else if (((Long) hashA.get("filesize")) < ((Long) hashB.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}

	private static class TypeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir")) && !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir")) && ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filetype")).compareTo((String) hashB.get("filetype"));
			}
		}
	}
}
