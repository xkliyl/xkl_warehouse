package cn.edu.tfswufe.xkl.china_api.service;



import cn.edu.tfswufe.xkl.china_api.entity.Province;
import cn.edu.tfswufe.xkl.china_api.entity.vo.Response;
import cn.edu.tfswufe.xkl.china_api.mapper.ProvinceMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2020/12/4 17:32
 */
@Service
public class ProvinceService {

    @Resource
    private ProvinceMapper provinceMapper;

    /**
     * 用于处理获取所有省的json数组的逻辑
     */
    public Response[] getProvinceResponses(){
        List<Province> provinceList = provinceMapper.findAllProvince();
        Response[] provinceResponse = new Response[provinceList.size()];
        for (int i = 0;i < provinceList.size();i++){
            provinceResponse[i] = Response.builder().id(provinceList.get(i).getId())
                    .name(provinceList.get(i).getProvinceName()).build();
        }
        return  provinceResponse;
        }
}

