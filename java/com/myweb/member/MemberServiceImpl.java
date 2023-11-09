package com.myweb.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.board.BoardDTO;
import com.myweb.mybatis.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper dao;
	
	@Override
	public MemberDTO getMember(MemberDTO dto) {
		return dao.getMember(dto);
	}

	@Override
	public int insert(MemberDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(MemberDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int pwUpdate(MemberDTO dto) {
		return dao.pwUpdate(dto);
	}

	@Override
	public int delete(MemberDTO dto) {
		return dao.delete(dto);
	}

	@Override
	public List<BoardDTO> getBoard(Map<String, Object> map) {
		return dao.getBoard(map);
	}

	@Override
	public int getBoardCount(BoardDTO dto) {
		return dao.getBoardCount(dto);
	}

	@Override
	public int deleteBoard(int num) {
		return dao.deleteBoard(num);
	}

	@Override
	public BoardDTO getBoardNum(int num) {
		return dao.getBoardNum(num);
	}

}
