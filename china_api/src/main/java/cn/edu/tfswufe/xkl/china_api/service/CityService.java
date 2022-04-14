package cn.edu.tfswufe.xkl.china_api.service;

import cn.edu.tfswufe.xkl.china_api.entity.City;
import cn.edu.tfswufe.xkl.china_api.entity.vo.Response;
import cn.edu.tfswufe.xkl.china_api.mapper.CityMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2020/12/11 14:47
 */
@Service
public class CityService {
    @Resource
    private CityMapper cityMapper;

    /**
     * 用于处理获取特定省的所有市的json数组
     *
     * @param provinceId 特定省的ID
     * @return 特定省的所有市的json的数组
     */
    public Response[] getCityResponses(Long provinceId) {
        List<City> cityList = cityMapper.findAllCityByProvinceId(provinceId);
        Response[] cityResponse = new Response[cityList.size()];
        for (int i = 0; i < cityList.size(); i++) {
            cityResponse[i] = Response.builder().id(cityList.get(i).getCityCode())
                    .name(cityList.get(i).getCityName()).build();
        }
        return cityResponse;
    }

    /**
     * 用于处理获取特定市的id的逻辑
     * @param cityCode 特定市的编号
     * @return 特定市的ID
     */
    public Long getCityByCityCode(Long cityCode) {
        Long cityId = cityMapper.findCityIdByCityCode(cityCode);
        return cityId;
    }

}
