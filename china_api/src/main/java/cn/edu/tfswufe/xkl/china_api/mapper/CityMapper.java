package cn.edu.tfswufe.xkl.china_api.mapper;

import cn.edu.tfswufe.xkl.china_api.entity.City;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * city的mapper接口
 * @author 阿秋
 * @date 2020/12/11 14:46
 */
@Mapper
@Repository
public interface CityMapper {
    @Select("select * from city where provinceId = #{provinceId}")
    List<City> findAllCityByProvinceId(Long provinceId);

    @Select("select id from city where cityCode = #{cityCode}")
    Long findCityIdByCityCode(Long cityCode);
}
