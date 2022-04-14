package cn.edu.tfswufe.xkl.china_api.service;

import cn.edu.tfswufe.xkl.china_api.entity.County;
import cn.edu.tfswufe.xkl.china_api.entity.vo.WeatherResponse;
import cn.edu.tfswufe.xkl.china_api.mapper.CountyMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2020/12/11 14:47
 */
@Service
public class CountyService {

    @Resource
    private CountyMapper countyMapper;
    /**
     * 用于处理获取特定市的所有县的json数组的逻辑
     * @param cityId 特定市的ID
     * @return 特定市的所有县的json数组
     */
    public WeatherResponse[] getCountyResponses(Long cityId){
        List<County> countyList = countyMapper.findAllCountyByCityId(cityId);
        WeatherResponse[] weatherResponses = new WeatherResponse[countyList.size()];
        for (int i = 0;i < countyList.size();i++){
            weatherResponses[i] = WeatherResponse.builder().id(countyList.get(i).getId())
                    .name(countyList.get(i).getCountyName()).weather_id(countyList.get(i).getWeatherId()).build();
        }
        return weatherResponses;
    }
}
