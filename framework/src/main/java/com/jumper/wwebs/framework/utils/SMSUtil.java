package com.jumper.wwebs.framework.utils;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cloopen.rest.sdk.CCPRestSDK;

/**
 * 短信发送工具类
 */
public class SMSUtil
{

	private static final Logger logger = LoggerFactory.getLogger(SMSUtil.class);
	private static CCPRestSDK restAPI = new CCPRestSDK();

	/**
	 * 配置短信网关
	 * 
	 * @param map
	 */
	public void setSmsConfig(HashMap<String, String> map)
	{
		// ******************************注释*********************************************
		// *初始化服务器地址和端口 *
		// *沙盒环境（用于应用开发调试）：restAPI.init("sandboxapp.cloopen.com", "8883");*
		// *生产环境（用户应用上线使用）：restAPI.init("app.cloopen.com", "8883"); *
		// *******************************************************************************
		restAPI.init(map.get("serverIP"), map.get("serverPort"));

		// ******************************注释*********************************************
		// *初始化主帐号和主帐号令牌,对应官网开发者主账号下的ACCOUNT SID和AUTH TOKEN *
		// *ACOUNT SID和AUTH TOKEN在登陆官网后，在“应用-管理控制台”中查看开发者主账号获取*
		// *参数顺序：第一个参数是ACOUNT SID，第二个参数是AUTH TOKEN。 *
		// *******************************************************************************
		restAPI.setAccount(map.get("accountSid"), map.get("accountToken"));

		// ******************************注释*********************************************
		// *初始化应用ID *
		// *测试开发可使用“测试Demo”的APP ID，正式上线需要使用自己创建的应用的App ID *
		// *应用ID的获取：登陆官网，在“应用-应用列表”，点击应用名称，看应用详情获取APP ID*
		// *******************************************************************************
		restAPI.setAppId(map.get("appId"));
	}

	/**
	 * 发送短信，并返回请求的发送状态
	 * 
	 * @param mobileNum 手机号码
	 * @param templateId 短信模板id
	 * @param params 短信内容参数
	 * @return
	 */
	public static String sendSMS(String mobileNum, String templateId, String[] params)
	{
		HashMap<String, Object> result = null;
		result = restAPI.sendTemplateSMS(mobileNum, templateId, params);
		if (!"000000".equals(result.get("statusCode")))
		{
			// 异常返回输出错误码和错误信息
			logger.error("发送短信失败，发送手机号码：{}，返回错误码：{}", mobileNum, result.get("statusCode"));
		}
		return (String) result.get("statusCode");
	}
}
