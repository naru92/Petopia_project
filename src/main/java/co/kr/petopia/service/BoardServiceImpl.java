package co.kr.petopia.service;

import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService{
    
    private final BoardMapper boardMapper;
    
}
