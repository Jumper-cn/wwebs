package com.jumper.wwebs.framework.utils;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * 七牛文件上传token生成工具类
 */
public class QiniuUtil {
	private static final Logger logger = LoggerFactory.getLogger(QiniuUtil.class);
	// 访问密钥
	public static String accessKey;
	// 私钥
	public static String secertKey;

	// 网站及后台生产空间名称
	public static String bucketWebsite;
	// 测试空间名称
	public static String bucketTest;

	// 过期时间 单位 ：秒
	public static long expiresTime;
	// 有效时间 单位： 毫秒 [此参数必须小于过期时间，且差值大于或等于accessToken的过期时间]
	public static long validTime;

	// 运行时环境标识  test-测试  product-生产
	public static String environment;
	
	// 生成时间
	private static long createTime;
	// 测试时间
	private static long createTimeTest;

	// 测试上传token
	private static String uploadTestToken;
	// 网站的上传令牌
	private static String uploadWebsiteToken;

	private static Auth auth;

	/**
	 * 生成网站的上传token
	 * 
	 * @return
	 */
	public static String getWebsiteUpToken()
	{
		if( auth == null ){//初始化sdk实例
			auth = Auth.create(accessKey, secertKey);
		}
		long currentTime = System.currentTimeMillis();
		if (uploadWebsiteToken == null || currentTime - createTime > validTime)
		{
			// website上传token
			createTime = currentTime;
			if( environment.equals("test")){//测试环境
				uploadWebsiteToken = auth.uploadToken(bucketTest, null, expiresTime, null);
			}
			else{// 生产环境
				uploadWebsiteToken = auth.uploadToken(bucketWebsite, null, expiresTime, null);
			}
		}

		return uploadWebsiteToken;
	}
	
	/**
	 * 生成测试的token
	 * 
	 * @return
	 */
	public static String getUploadTestToken()
	{
		if( auth == null ){//初始化sdk实例
			auth = Auth.create(accessKey, secertKey);
		}
		long currentTime = System.currentTimeMillis();
		if (uploadTestToken == null || currentTime - createTimeTest > validTime)
		{
			// 图片上传token
			createTimeTest = currentTime;
			uploadTestToken = auth.uploadToken(bucketTest, null, expiresTime, null);
		}
		return uploadTestToken;
	}
	
	/**
	 * 文件上传到七牛
	 * 
	 * @param data
	 * @param key
	 * @param upToken
	 */
	public static void upload(File file, String fileName, String upToken)
	{
		try
		{
			UploadManager uploadManager = new UploadManager();
			Response res = uploadManager.put(file, fileName, upToken);
			if (res.isOK())
			{
				logger.info("upload success fileName:{}", fileName, res.toString());
			} else
			{
				logger.error("uoload error fileName:{} ", fileName, res.toString());
			}
		} catch (QiniuException e)
		{
			Response r = e.response;
			// 请求失败时简单状态信息
			logger.error(r.toString(), e);
		}
	}
	
	public static String getAccessKey() {
		return accessKey;
	}

	public static void setAccessKey(String accessKey) {
		QiniuUtil.accessKey = accessKey;
	}

	public static String getSecertKey() {
		return secertKey;
	}

	public static void setSecertKey(String secertKey) {
		QiniuUtil.secertKey = secertKey;
	}

	public static String getBucketWebsite() {
		return bucketWebsite;
	}

	public static void setBucketWebsite(String bucketWebsite) {
		QiniuUtil.bucketWebsite = bucketWebsite;
	}

	public static String getBucketTest() {
		return bucketTest;
	}

	public static void setBucketTest(String bucketTest) {
		QiniuUtil.bucketTest = bucketTest;
	}

	public static long getExpiresTime() {
		return expiresTime;
	}

	public static void setExpiresTime(long expiresTime) {
		QiniuUtil.expiresTime = expiresTime;
	}

	public static long getValidTime() {
		return validTime;
	}

	public static void setValidTime(long validTime) {
		QiniuUtil.validTime = validTime;
	}

	public static String getEnvironment() {
		return environment;
	}

	public static void setEnvironment(String environment) {
		QiniuUtil.environment = environment;
	}
	
}
