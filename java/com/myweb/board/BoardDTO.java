package com.myweb.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	private int num, visitCount;
	private String id, nickname, title, content, province, city, district, fileId, fileName, postdate, updateDate;
}
