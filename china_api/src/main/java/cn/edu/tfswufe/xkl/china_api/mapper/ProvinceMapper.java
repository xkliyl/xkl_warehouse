package cn.edu.tfswufe.xkl.china_api.mapper;

import cn.edu.tfswufe.xkl.china_api.entity.Province;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * province的mapper接口
 * @author 阿秋
 * @date 2020/12/4 17:32
 */
@Mapper
@Repository
public interface ProvinceMapper {
    @Select("select * from province")
    List<Province> findAllProvince();
}
