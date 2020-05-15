package kr.co.honorsville.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class FileUtils {
	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
	private static final String SAVE_PATH = "/upload/temp/";
	private static final String PREFIX_URL = "/upload/temp/";
	
	public Map<String, String> upload(MultipartFile multipartFile, HttpServletRequest request) {
		String url = null;
		String baseUrl = request.getSession().getServletContext().getRealPath("");
		Map<String, String> data = new HashMap<String, String>();
		
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);
 
			writeFile(baseUrl, multipartFile, saveFileName);
			url = PREFIX_URL + saveFileName;
			data.put("result", "0");
			data.put("url", url);
			data.put("originFilename", originFilename);
			data.put("extensionName", extName);
			
			data.put("size", size+"");
			
			data.put("saveFileName", saveFileName);
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		return (HashMap<String, String>) data;
	}
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(String basePath, MultipartFile multipartFile, String saveFileName)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(basePath + SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
	
    public static void copy(File sourceF, File targetF){
	File[] target_file = sourceF.listFiles();
	for (File file : target_file) {
		File temp = new File(targetF.getAbsolutePath() + File.separator + file.getName());
		if(file.isDirectory()){
			temp.mkdir();
			copy(file, temp);
		} else {
		        FileInputStream fis = null;
			FileOutputStream fos = null;
			try {
				fis = new FileInputStream(file);
				fos = new FileOutputStream(temp) ;
				byte[] b = new byte[4096];
				int cnt = 0;
				while((cnt=fis.read(b)) != -1){
					fos.write(b, 0, cnt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				try {
					fis.close();
					fos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					
			}
		}
	   }
    }
	
    public static void delete(String path, HttpServletRequest request) {
    
    String baseUrl = request.getSession().getServletContext().getRealPath("");
    File folder = new File(baseUrl+path);
	
	try {
		if(folder.exists()){
		    File[] folder_list = folder.listFiles();
				
		    for (int i = 0; i < folder_list.length; i++) {
			if(folder_list[i].isFile()) {
				folder_list[i].delete();
			}else {
				delete(folder_list[i].getPath(), request);
			}
			folder_list[i].delete();
		    }
		}
	} catch (Exception e) {
		e.getStackTrace();
	}
    }	
}