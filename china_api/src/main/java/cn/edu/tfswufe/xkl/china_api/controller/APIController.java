package cn.edu.tfswufe.xkl.china_api.controller;

import cn.edu.tfswufe.xkl.china_api.entity.vo.Response;
import cn.edu.tfswufe.xkl.china_api.entity.vo.WeatherResponse;
import cn.edu.tfswufe.xkl.china_api.service.CityService;
import cn.edu.tfswufe.xkl.china_api.service.CountyService;
import cn.edu.tfswufe.xkl.china_api.service.ProvinceService;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author 阿秋
 * @date 2020/12/4 17:33
 */
@RestController
@RequestMapping("/api")
public class APIController {

    @Resource
    private ProvinceService provinceService;

    @Resource
    private CityService cityService;

    @Resource
    private CountyService countyService;

    /**
     * 用于获取中国所有省的json数据
     * @return  所有省的json数据
     */
    @RequestMapping("/china")
    public Response[] getProvince(){
        Response[] provinceResponses = provinceService.getProvinceResponses();
        return provinceResponses;
    }

    /**
     * 用于获取特定省的所有市的json数据
     * @param cityId city的id
     * @return 特定省的所有市的json数组
     */
    @RequestMapping("/china/{cityId}")
    public Response[] getCities(@PathVariable("cityId") Long cityId){
        Response[] cityResponse = cityService.getCityResponses(cityId);
        return cityResponse;
    }

    /**
     * 用于获取特定市的所有县的json数据
     * @param city city的id
     * @param cityCode city的编号
     * @return 特定市的所有县的json数组
     */
    @RequestMapping("/china/{cityId}/{cityCode}")
    public WeatherResponse[] getCounties(@PathVariable("cityId") Long city,@PathVariable("cityCode")Long cityCode){

        return countyService.getCountyResponses(cityCode);
    }

}
