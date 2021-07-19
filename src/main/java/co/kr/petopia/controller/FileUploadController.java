package co.kr.petopia.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.kr.petopia.vo.FileUploadVO;
import co.kr.petopia.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
@Slf4j
@Controller
public class FileUploadController {
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		log.info("이미지 타입인지 확인");
		
		try {
			
			log.info("check Image Type Function " + file);
			
			String contentType = Files.probeContentType(file.toPath());
			
			log.info(contentType);
			
			return contentType.startsWith("image");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FileUploadVO>> uploadAjaxPost(MultipartFile[] uploadFile){
		log.info("update ajax post");
		
		List<FileUploadVO> productVOList = new ArrayList<>();
		
		
		String uploadFolder = "D://petopia_bit//workspace-spring-tool-suite-4-4.11.0.RELEASE//petopia//src//main//webapp//upload";
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("업로드 경로 : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("-------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			FileUploadVO productVO = new FileUploadVO();
			ProductVO getProductImage = new ProductVO(); 
			getProductImage.setProduct_image(multipartFile.getOriginalFilename());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName
											.substring(uploadFileName.lastIndexOf("\\")+1);
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				productVO.setFileName(uploadFileName);
			getProductImage.setProduct_image(productVO.getFileName());
			try {
				File saveFile = new File(uploadPath , uploadFileName);
				System.out.println(saveFile);
				
				multipartFile.transferTo(saveFile);
				
				productVO.setUuid(uuid.toString());
				productVO.setProduct_image(uploadFileName);
				
				productVO.setUploadPath(uploadFolderPath);
			
				// 파일 타입 체크
				if(checkImageType(saveFile)) {
					
					log.info("check Image Type " + saveFile);
					
					productVO.setImageType(true);
					getProductImage.setProduct_image(saveFile.getName());
					File thumbnail = new File(uploadPath, "s_" + uploadFileName);
					Thumbnails.of(saveFile).size(160, 160)
					.toFile(thumbnail);

					
				}
					productVOList.add(productVO);
					log.info("상품첨부파일찍기 :  " +productVOList.toString());
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(productVOList, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) throws IOException{
		log.info("fileName : " +  fileName);
		
		File file = new File("D://petopia_bit//workspace-spring-tool-suite-4-4.11.0.RELEASE//petopia//src//main//webapp//upload//" + fileName);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		System.out.println(file.toPath());
		try {
			log.info("copy: " + FileCopyUtils.copyToByteArray(file));
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header,HttpStatus.OK);
		} catch (NoSuchFileException e) {
			log.info(e.getMessage());
		}
		return result;
			
	}
	
	@PostMapping("/delteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("deleteFile : " + fileName);
		
		File file;
		
		try {
			file = new File("D:/petopia_bit/workspace-spring-tool-suite-4-4.11.0.RELEASE/petopia/src/main/webapp/upload/" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if(type.equals("image")) {
				// 썸네일
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				// 뷰에서 받아온 파일 이름을 사용
				log.info("largeFileName : " + largeFileName);

				file = new File(largeFileName);
				
				file.delete();
				
				// 빅썸네일 삭제가 안됨
				String bigFileName = file.getAbsolutePath().replace("bs_", "");
				// 뷰에서 받아온 파일 이름을 이용해서 bs가 붙은 파일 이름을 만들어야 함
				log.info("bigFileName : " + bigFileName);
				
				file = new File(bigFileName);
				
				file.delete();

			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
							
}
