package cn.edu.tfswufe.service.impl;

import cn.edu.tfswufe.dao.ClassDao;
import cn.edu.tfswufe.model.Classes;
import cn.edu.tfswufe.service.ClassService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2021/11/28 17:35
 */
@Service
public class ClassServiceImpl implements ClassService {
    @Resource
    private ClassDao classDao;

    @Override
    public List<Classes> findClassByTeacherId(String tid) {
        List<Classes> list = classDao.queryClassByTeacherId(tid);
        return list;
    }
}
