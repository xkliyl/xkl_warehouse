package cn.edu.tfswufe.xkl.china_api.mapper;

import cn.edu.tfswufe.xkl.china_api.entity.County;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * county的mapper接口
 * @author 阿秋
 * @date 2020/12/11 14:47
 */
@Mapper
@Repository
public interface CountyMapper {
    @Select("select * from county where cityId = #{cityId}")
    List<County> findAllCountyByCityId(Long cityId);
}
