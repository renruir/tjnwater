package com.tjnwater.wechat.service;

import com.alibaba.fastjson.JSON;
import com.tjnwater.wechat.api.model.BaseTemplateStruct;
import com.tjnwater.wechat.api.model.GeneralDeviceInfo;
import com.tjnwater.wechat.api.model.ModelMsg;
import com.tjnwater.wechat.dao.WeixinDao;
import com.tjnwater.wechat.service.constant.ServiceConstant;
import com.tjnwater.wechat.service.impl.WeixinServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class GeneralScanService {

    private static final Logger logger = LoggerFactory.getLogger(GeneralScanService.class);

    @Autowired
    private WeixinService weixinService;

    public List<GeneralDeviceInfo> scanGeneralDeviceInfo() {
        List<GeneralDeviceInfo> generalDeviceInfos = new ArrayList<GeneralDeviceInfo>();
        try {
            generalDeviceInfos = weixinService.scanGeneralDeviceInfo();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        for (GeneralDeviceInfo info : generalDeviceInfos) {
            logger.info("resetDate: " + info.getReset_date() + ",name:" + info.getNick_name());
            if (info.getOpen_id().isEmpty()) {
                return null;
            }

            String keyword1 = new StringBuilder("您设定的冲洗周期是：" + info.getReminder_circle() + "天"
                    + ", 距离上次冲洗已经有" + calcNow2Last(info.getReset_date()) + "天").toString();
            String keyword2 = new StringBuilder("请及时冲洗，以免影响您的健康！").toString();

            Map<String, BaseTemplateStruct> map = new HashMap<String, BaseTemplateStruct>();
            map.put("first", new BaseTemplateStruct("您绑定的前置过滤器该冲洗了！", "#0d0c0c"));
            map.put("keyword1", new BaseTemplateStruct(keyword1, "#f40505"));
            map.put("keyword2", new BaseTemplateStruct(keyword2, "#0d0c0c"));
            map.put("remark", new BaseTemplateStruct("请及时处理或者拨打客户电话保修", "#0d0c0c"));
            packageModelMsg(info.getOpen_id(), map);
        }
        return generalDeviceInfos;
    }

    public void packageModelMsg(String openID, Map<String, BaseTemplateStruct> data) {
        logger.info("openId: " + openID);
        ModelMsg modelMsg = new ModelMsg();
        modelMsg.setTemplate_id(ServiceConstant.FAULT_NOTICE_MODEL_ID);
        modelMsg.setTouser(openID);
        modelMsg.setUrl("http://weixin.tejien.com/web/wechat/index.html");
        modelMsg.setTopcolor("#FF0000");
        modelMsg.setData(data);
        weixinService.sendTemplateMsg(JSON.toJSONString(modelMsg));
    }

    private static int calcNow2Last(String last) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            ParsePosition pos = new ParsePosition(0);
            Date lastDate = formatter.parse(last, pos);
            long now = new Date().getTime();
            int days = (int) ((now - lastDate.getTime()) / (1000 * 60 * 60 * 24));
            return days;
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        System.out.println(calcNow2Last("2018-09-02") + "");
    }
}
