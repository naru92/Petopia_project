package co.kr.petopia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.kr.petopia.vo.CartVO;


public interface OrderService {
	List<CartVO> getCartList();

}
