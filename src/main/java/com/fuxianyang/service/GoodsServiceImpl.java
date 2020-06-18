package com.fuxianyang.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fuxianyang.beans.Brand;
import com.fuxianyang.beans.Goods;
import com.fuxianyang.mapper.GoodsMapper;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Resource
	private GoodsMapper goodsMapper;

	@Override
	public List<Goods> getGoodsList(Goods goods) {
		return goodsMapper.getGoodsList(goods);
	}

	@Override
	public List<Brand> getBrandSelect() {
		return goodsMapper.getBrandSelect();
	}

	@Override
	public int addAll(Goods goods) {
		return goodsMapper.addAll(goods);
	}

	@Override
	public Goods getGood(Integer gid) {
		return goodsMapper.getGood(gid);
	}

	@Override
	public int updGood(Goods goods) {
		return goodsMapper.updGood(goods);
	}
}
