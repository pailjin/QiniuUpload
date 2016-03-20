package com.cordova.qiniu.yumemor.plugin;

/**
 * @author yy
 *
 *         七牛云配置
 */
public interface QiniuKey {
	/**
	 * 	上传Token
	 */
	//Token生成算法：http://developer.qiniu.com/docs/v6/api/overview/security.html#upload-token
	//Token在线生成地址：http://jsfiddle.net/gh/get/extjs/4.2/icattlecoder/jsfiddle/tree/master/uptoken
	String UPLOAD_TOKEN = "h2mORFn4Zdd9XO6Nr2yhfz9fi7NtasV4N7aWeKAP:VFU4yVeegOsKaY54qMtgHuw34lk=:eyJyZXR1cm5Cb2R5Ijoie1widXJsXCI6XCJodHRwOi8vN3hsbXBoLmNvbTEuejAuZ2xiLmNsb3VkZG4uY29tLyQoa2V5KVwiLFwia2V5XCI6ICQoa2V5KSwgXCJoYXNoXCI6ICQoZXRhZyksIFwid1wiOiAkKGltYWdlSW5mby53aWR0aCksIFwiaFwiOiAkKGltYWdlSW5mby5oZWlnaHQpfSIsInNjb3BlIjoiaGFvemhpeWluIiwiZGVhZGxpbmUiOjE0NTQyMjUyMzF9";
	/**
	 * 文件前缀分隔符
	 */
	String FILE_PREFIX_SEPARATOR = "/";
}
