package com.tjnwater.wechat.dao;

import com.tjnwater.wechat.model.User;

import java.util.List;
import java.util.Map;

/**
 * create by renrui on 2018-01-10-10:12
 */

public interface UserDao {
    public int insertUser(User user);

    public List<User> getUserList();

    public List<Map<String,Object>> getUserListMapResult();
}
