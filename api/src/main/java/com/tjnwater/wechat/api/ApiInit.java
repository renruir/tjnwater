package com.tjnwater.wechat.api;

import com.tjnwater.wechat.service.WeixinService;
import com.tjnwater.wechat.service.mqtt.MqttService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Created by renrui on 2018/1/10.
 */
@Component
public class ApiInit {

    private static final Logger logger = LoggerFactory.getLogger(ApiInit.class);

    @Autowired
    private WeixinService weixinService;

    @Autowired
    private MqttService mqttService;

    @PostConstruct
    public void init() {
        logger.info("init api ..");
        try {
            mqttService.start();
        } catch (Exception e) {
            logger.info(e.getMessage());
        }
    }

    @Scheduled(fixedRate = 1000 * 60 * 110)
    public void myFixedrate() {
//        String localStr = "";
//        try {
//            InetAddress localAddr = InetAddress.getLocalHost();
//            localStr = localAddr.getHostAddress();
//            logger.info("localAddr: " + localAddr);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        if (WeixinConstant.ACCESS_TOKEN_IP.equals(localStr)) {
        try {
            weixinService.initWxAccessToken();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
//        }
    }

    @Scheduled(fixedRate = 1000 * 60 * 112)
    public void updateTicket() {
        String localStr = "";
//        try {
//            InetAddress localAddr = InetAddress.getLocalHost();
//            localStr = localAddr.getHostAddress();
//            logger.info("localAddr: " + localAddr);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        if (WeixinConstant.ACCESS_TOKEN_IP.equals(localStr)) {
        try {
            weixinService.initWxJsApiTicket();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
//        }
    }


}
