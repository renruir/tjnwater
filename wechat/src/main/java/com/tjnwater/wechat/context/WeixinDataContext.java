package com.tjnwater.wechat.context;

import com.tjnwater.wechat.handler.BaseDataProcess;

/**
 * Created by yuhaichao on 2016/11/15.
 */
public class WeixinDataContext {

	private BaseDataProcess baseDataProcess;

	public WeixinDataContext(BaseDataProcess baseDataProcess){
		this.baseDataProcess=baseDataProcess;
	}
}
