package co.kr.petopia.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
    
    private int reply_idx;
    private int content_idx;
    private String member_id;
    private String reply_text;
    private Date reply_date;

}
