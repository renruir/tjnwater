package com.tjnwater.wechat.user;

import com.tjnwater.wechat.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface UserService {

	int insertUser(User user) throws Exception;

	List<User> getUserList() throws Exception;

	List<Map<String,Object>> getUserListMapResult() throws Exception;

}
