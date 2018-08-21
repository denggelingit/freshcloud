package cn.food.fresh.service.front.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.food.fresh.dao.IAddressDAO;
import cn.food.fresh.pojo.Address;
import cn.food.fresh.service.front.IAddressServiceFront;
import cn.food.fresh.service.front.abs.AbstractServiceFront;

@Service
public class AddressServiceFrontImpl extends AbstractServiceFront implements IAddressServiceFront {
	@Resource
	private IAddressDAO addressDAO;

	@Override
	public boolean add(String id,Address vo) throws Exception {
		vo.getMember().setMid(super.getMid(id));
		vo.setDeflag(0); 
		return this.addressDAO.doCreate(vo);
	}

	@Override
	public List<Address> listByMember(String id) throws Exception {
		return this.addressDAO.findAllByMember(super.getMid(id));
	}

	@Override
	public Address editPre(int adid, String id) throws Exception {
		return this.addressDAO.findByIdAndMember(adid, super.getMid(id));
	}

	@Override
	public boolean edit(String id,Address vo) throws Exception {
		vo.getMember().setMid(super.getMid(id));
		return this.addressDAO.doUpdateByMember(vo); 
	}

	@Override
	public boolean rm(String id, Set<Integer> adids) throws Exception {
		if (adids.size() == 0) {
			return false ;
		}
		return this.addressDAO.doRemoveByMember(adids, super.getMid(id)); 
	} 
}
