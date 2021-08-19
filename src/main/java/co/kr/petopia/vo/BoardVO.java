package co.kr.petopia.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardVO {
    private int board_id;
    private int content_idx;
    private String member_id;
    private String content_date;
    private String content_title;
    private String content_text;
    private int content_hit;
    private Date content_update;
    
    private String board_name;
    
    private String authority;
    private List<FileUploadVO> attachList;
    private List<MemberVO> memberList;
    
}
