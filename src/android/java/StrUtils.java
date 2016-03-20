package com.cordova.qiniu.yumemor.util;

import java.lang.annotation.Target;

import com.cordova.qiniu.yumemor.plugin.QiniuKey;

/**
 * @author yy
 * 
 *         字符串工具类
 */
public final class StrUtils {
	private StrUtils() {
	};

	/**
	 * @param filePath
	 *            文件路径
	 * @return 获取文件名
	 */
	public static String getFileName(String filePath) {
		return filePath.substring(filePath.lastIndexOf("/") + 1);
	}

	/**
	 * @param prefix
	 *            前缀
	 * @param target
	 *            目标
	 * @return 处理好的字符串
	 */
	public static String appendPrefix(String prefix, String target) {
		return prefix.concat(QiniuKey.FILE_PREFIX_SEPARATOR).concat(target);
	}
}
