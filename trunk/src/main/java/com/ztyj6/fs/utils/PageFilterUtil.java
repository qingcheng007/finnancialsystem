package com.ztyj6.fs.utils;

import org.apache.commons.lang.StringUtils;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.page.PageFilter;


public class PageFilterUtil {
	public static PageBounds createPageBounds(PageFilter pageFilter){
		StringBuilder sb = new StringBuilder();
		sb.append(pageFilter.getSort()).append(".").append(pageFilter.getOrder());
		return new PageBounds(pageFilter.getPage(), pageFilter.getRows(), Order.formString(sb.toString()));
	}
}
