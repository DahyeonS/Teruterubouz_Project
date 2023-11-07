package com.myweb.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mybatis.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper dao;
}
