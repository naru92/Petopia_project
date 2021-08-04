package co.kr.petopia.vo;

import lombok.Data;

@Data
public class NaverProfile {

    public String resultcode;
    public String message;
    public Response response;

    @Data
    public class Response {

        public String id;
        public String email;
        public String mobile;
        public String mobile_e164;
        public String name;

    }
}
