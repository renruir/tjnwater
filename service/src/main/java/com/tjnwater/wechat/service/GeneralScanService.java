package com.tjnwater.wechat.service;

import com.tjnwater.wechat.api.model.GeneralDeviceInfo;
import com.tjnwater.wechat.dao.WeixinDao;
import com.tjnwater.wechat.service.impl.WeixinServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GeneralScanService {

    private static final Logger logger = LoggerFactory.getLogger(GeneralScanService.class);

    @Autowired
    private WeixinDao weixinDao;

    public List<GeneralDeviceInfo> scanGeneralDeviceInfo(){
        return null;
    }

}
