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
public class County {
    private Long id;

    private Long cityId;

    private String countyName;

    private String weatherId;
}
