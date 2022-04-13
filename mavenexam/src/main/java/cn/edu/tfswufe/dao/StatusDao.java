package cn.edu.tfswufe.dao;

import cn.edu.tfswufe.model.Status;

import java.util.List;

/**
 * @author 阿秋
 * @date 2022/4/3 9:31
 */
public interface StatusDao {
    //查询登录的用户与密码
    public Status login(String uid);

    //根据权限查询用户
    public List<Status> findAllStatusByPower(Integer power);
    //新增用户
    public void addStatus(Status status);
}
