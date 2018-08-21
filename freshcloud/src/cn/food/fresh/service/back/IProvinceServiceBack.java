package cn.food.fresh.service.back;

import java.util.List;

import cn.food.fresh.pojo.Province;

public interface IProvinceServiceBack {
	/**
	 * 列出所有的省份以及每个省份对应的城市信息 
	 * @return
	 * @throws Exception
	 */
	public List<Province> list() throws Exception ;
}
