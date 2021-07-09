package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.MemberVO;

@Mapper
public interface AdminMapper{
	public List<MemberVO> getMemberList();
}
