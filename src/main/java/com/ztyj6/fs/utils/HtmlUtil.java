package com.ztyj6.fs.utils;

public class HtmlUtil {
	public static String htmlEncode(String str) {
		StringBuffer buffer = new StringBuffer();
		int len = str.length();
		for (int i = 0; i < len; i++) {
			char ch = str.charAt(i);
			switch (ch) {
			case '>':
				buffer.append("&gt;");
				break;
			case '<':
				buffer.append("&lt;");
				break;
			case ' ':
				buffer.append("&nbsp;");
				break;
			case '\n':
				buffer.append("<br/>");;
				break;
			default:
				buffer.append(ch);
				break;
			}
		}
		return buffer.toString();
	}
}
