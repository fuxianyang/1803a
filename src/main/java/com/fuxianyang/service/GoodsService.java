package com.fuxianyang.service;

import java.util.List;

import com.fuxianyang.beans.Brand;
import com.fuxianyang.beans.Goods;

public interface GoodsService {

	List<Goods> getGoodsList(Goods goods);

	List<Brand> getBrandSelect();

	int addAll(Goods goods);

	Goods getGood(Integer gid);

	int updGood(Goods goods);

}
