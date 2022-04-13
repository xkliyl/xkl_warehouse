package cn.edu.tfswufe.service;

import cn.edu.tfswufe.model.Status;

import java.util.List;

/**
 * @author 阿秋
 * @date 2021/11/29 12:58
 */
public interface StatusService {
    //验证账号、密码与权限
    public Status loginChecking(String uid);

    //新增用户
    public void insertUser(Status status);

    public List<Status> findByPower(Integer power);

}
