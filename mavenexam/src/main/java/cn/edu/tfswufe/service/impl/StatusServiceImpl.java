package cn.edu.tfswufe.service.impl;

import cn.edu.tfswufe.dao.AdministratorsDao;
import cn.edu.tfswufe.dao.StatusDao;
import cn.edu.tfswufe.model.Status;
import cn.edu.tfswufe.service.StatusService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2021/11/29 13:00
 */
@Service
public class StatusServiceImpl implements StatusService {
    @Resource
    private StatusDao statusDao;
    @Resource
    private AdministratorsDao administratorsDao;
    @Override
    public Status loginChecking(String uid) {
        return statusDao.login(uid);
    }

    @Override
    public void insertUser(Status status) {
        statusDao.addStatus(status);
    }

    @Override
    public List<Status> findByPower(Integer power) {
        return statusDao.findAllStatusByPower(power);
    }


}
