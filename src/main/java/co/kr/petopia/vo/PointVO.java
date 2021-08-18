package co.kr.petopia.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PointVO {
	
    private String member_id;
    
    private int member_point_savepoint;
    private String member_point_savedetail;
    private String member_point_savedate;
    
    private int member_point_usepoint;
    private String member_point_usedetail;
    private String member_point_usedate;

}
