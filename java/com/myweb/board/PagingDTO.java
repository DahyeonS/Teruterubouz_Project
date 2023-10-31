package com.myweb.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PagingDTO {
	int totalCount, listNum, blockNum, pageNum;
	
	int totalPage, startPage, endPage;
	boolean isPrev, isNext, isBPrev, isBNext;
	
	public PagingDTO(int totalCount, int pageNum, int listNum, int blockNum) {
		this.totalCount = totalCount;
		this.pageNum = pageNum;
		this.listNum = listNum;
		this.blockNum = blockNum;
	}
	
	public void setPaging(){
		// 전체 페이지
		totalPage = (totalCount-1) / listNum + 1;
		//totalPage = (int)Math.ceil(((totalCount*0.1)/listNum)*10);

		// 시작, 끝 페이지 
		// 1 ~ 10 => 1, 11 ~ 20 => 11, 21 ~ 30 => 21
		startPage = ((pageNum-1) / blockNum) * blockNum + 1;
		endPage = startPage + blockNum -1;
		if(endPage > totalPage) endPage = totalPage;

		// isBPrev, isBNext
		isBPrev = startPage > 1;
		isBNext = totalPage > endPage; 

		//isPrev, isNext
		isPrev = pageNum > 1;
		isNext = pageNum < totalPage; 
	}
}
