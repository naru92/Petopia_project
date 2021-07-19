package co.kr.petopia.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.mapper.AdminMapper;
import co.kr.petopia.mapper.OrderMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.ContentVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<CartVO> getCartList() {
		
		return orderMapper.getCartList();
	}
	
	
	
	
	
	
}
