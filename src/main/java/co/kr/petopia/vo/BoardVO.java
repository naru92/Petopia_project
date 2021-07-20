package co.kr.petopia.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
    private int board_id;
    private int content_idx;
    private String member_id;
    private Date content_date;
    private String content_title;
    private String content_text;
    private int content_hit;
    private Date content_update;
}
