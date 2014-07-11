package com.ztyj6.fs.utils;

import org.apache.commons.lang3.StringUtils;

public class SqlUtil {  
	  
    private static final String H = "#";  
    private static final String S = "$";  
  
    /** 
     * mapper.xml中的取�?方式�?{}�?
     * @param str like的查询条�?
     * @return 
     */  
    public static String likeEscapeH(String str) {  
        return likeEscapeZ(str, H, true, true);  
    }  
      
    /** 
     * mapper.xml中的取�?方式�?{}�?
     * @param str like的查询条�?
     * @return 
     */  
    public static String likeEscapeS(String str) {  
        return likeEscapeZ(str, S, true, true);  
    }  
      
    /** 
     * @param str   like的查询条�?
     * @param type  mapper.xml中的取�?方式，只能�?#”或�?�?
     * @param start 字符串前部是否拼接�?%�?
     * @param end   字符串尾部是否拼接�?%�?
     * @return 
     */  
    public static String likeEscapeZ(String str, String type, boolean start, boolean end) {  
        if (StringUtils.isBlank(str)) {  
            return null;  
        }  
        StringBuffer buffer = new StringBuffer();  
        // 拼接顺序不能改变  
        if (S.equals(type)) {  
            buffer.append(" '");  
        }  
        if (start) {  
            buffer.append("%");  
        }  
          
        //注意�?]"不能处理  
        for (int i = 0; i < str.length(); i++) {  
            char c = str.charAt(i);  
            switch (c) {  
            case '\'':  
                if (S.equals(type)) {  
                    buffer.append("''");// 单引号替换成两个单引�? 
                } else {  
                    buffer.append(c);  
                }  
                break;  
            case '[':  
                buffer.append("[[]");  
                break;  
            case '_':  
                buffer.append("[_]");  
                break;  
            case '%':  
                buffer.append("[%]");  
                break;  
            case '^':  
                buffer.append("[^]");  
                break;  
            case '!':  
                buffer.append("[!]");  
                break;  
            default:  
                buffer.append(c);  
            }  
        }  
          
        if (end) {  
            buffer.append("%");  
        }  
        if (S.equals(type)) {  
            buffer.append("' ");  
        }  
        return buffer.toString();  
    }  
}  
