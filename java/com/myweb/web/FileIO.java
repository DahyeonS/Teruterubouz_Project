package com.myweb.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.board.BoardDTO;

import net.coobird.thumbnailator.Thumbnailator;

public class FileIO {
	static String uploadFolder = "D:/kdigital2307/spring/springws/midproject/src/main/webapp/resources/uploads";
//	static String uploadFolder = "D:/spring/springws/midproject/src/main/webapp/resources/uploads";
	
	public static void deleteFile(String fileId) {
		File file;
		
		try {
			if (fileId.split(", ").length != 1) {
				for (String id : fileId.split(", ")) {
					file = new File(uploadFolder + "/" + URLDecoder.decode(id, "UTF-8"));
					file.delete();
					
					file = new File(uploadFolder + "/s_" + URLDecoder.decode(id, "UTF-8"));
					file.delete();
				}
			} else {
				file = new File(uploadFolder + "/" + URLDecoder.decode(fileId, "UTF-8"));
				file.delete();
				
				file = new File(uploadFolder + "/s_" + URLDecoder.decode(fileId, "UTF-8"));
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public static List<String> uploadFile(MultipartFile[] uploadFile) {
		List<String> list = new ArrayList<String>();
		
		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			list.add(uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 200, 150);
				thumbnail.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public static ResponseEntity<Resource> download(BoardDTO dto, String userAgent) throws Exception {
		Resource resource = new FileSystemResource(uploadFolder + "/" + dto.getFileId());
		
		String downloadFile = "";
		if (userAgent.contains("Edge")) downloadFile = URLEncoder.encode(dto.getFileName(), "UTF-8");
		else downloadFile = new String(dto.getFileName().getBytes("UTF-8"), "ISO-8859-1");
		
		if (!(resource.exists())) return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=" + downloadFile);
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
