package com.tjnwater.wechat.base.utils;

import javax.net.ssl.X509TrustManager;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * Created by yuhaichao on 2016/11/15.
 */
public class MyX509TrustManager implements X509TrustManager {

	public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
	}

	public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
	}

	public X509Certificate[] getAcceptedIssuers() {
		return null;
	}
}