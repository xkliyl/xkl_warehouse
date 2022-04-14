package cn.edu.tfswufe.xkl.china_api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 阿秋
 * @date 2020/12/11 14:46
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class City {
    private Long id;

    private Long cityCode;

    private String cityName;

    private Long provinceId;
}
