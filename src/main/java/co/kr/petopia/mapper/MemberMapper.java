package co.kr.petopia.mapper;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 멤버 정보 가지고오기
	MemberVO getSelectMemberInfo(String member_id);
}


