package com.tjnwater.wechat.api.model;

/**
 * create by renrui at 2018/1/10/0010 10:00
 */
public class AirQualityData {
    private String aqi;
    private String co;
    private String no2;
    private String o3;
    private String so2;
    private String pm10;
    private String pm25;
    private String qlty;

    public String getAqi() {
        return aqi;
    }

    public void setAqi(String aqi) {
        this.aqi = aqi;
    }

    public String getCo() {
        return co;
    }

    public void setCo(String co) {
        this.co = co;
    }

    public String getNo2() {
        return no2;
    }

    public void setNo2(String no2) {
        this.no2 = no2;
    }

    public String getO3() {
        return o3;
    }

    public void setO3(String o3) {
        this.o3 = o3;
    }

    public String getSo2() {
        return so2;
    }

    public void setSo2(String so2) {
        this.so2 = so2;
    }

    public String getPm10() {
        return pm10;
    }

    public void setPm10(String pm10) {
        this.pm10 = pm10;
    }

    public String getPm25() {
        return pm25;
    }

    public void setPm25(String pm25) {
        this.pm25 = pm25;
    }

    public String getQlty() {
        return qlty;
    }

    public void setQlty(String qlty) {
        this.qlty = qlty;
    }

    @Override
    public String toString() {
        return "aqi: " + getAqi() +
                ", so2: " + getSo2() +
                ", o3: " + getO3() +
                ", no2 : " + getNo2() +
                ", co: " + getCo() +
                ", pm2.5: " + getPm25() +
                ", pm10: " + getPm10() +
                ", quality: " + getQlty();
    }
}
