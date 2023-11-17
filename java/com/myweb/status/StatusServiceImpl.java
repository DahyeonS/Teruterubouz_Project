package com.myweb.status;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mybatis.mapper.StatusMapper;

@Service
public class StatusServiceImpl implements StatusService {
	@Autowired
	StatusMapper dao;
	
	@Override
	public List<StatusDTO> getTemp() {
		return dao.getTemp();
	}

	@Override
	public List<StatusDTO> getRain() {
		return dao.getRain();
	}
}
