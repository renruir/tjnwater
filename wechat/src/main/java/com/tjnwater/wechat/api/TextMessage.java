package com.tjnwater.wechat.api;

/**
 * Created by yuhaichao on 2016/11/15.
 */
public class TextMessage extends BaseMessage{

	// 回复的消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

}
