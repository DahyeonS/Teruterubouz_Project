package com.myweb.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myweb.status.StatusDTO;

@Mapper
public interface StatusMapper {
	List<StatusDTO> getTemp();
	List<StatusDTO> getRain();
}
