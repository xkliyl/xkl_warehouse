package cn.edu.tfswufe.xkl.china_api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 阿秋
 * @date 2020/12/4 17:32
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Province {
    private Long id;

    private Long provinceCode;

    private String provinceName;
}
