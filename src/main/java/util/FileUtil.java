package util;
import java.io.*;

public class FileUtil {
	// static 함수이므로 객체 생성없이 바로 호출 가능함
	public static void saveImage(String root, String fname, byte[] data) throws IOException {
		root += "/Images";
		File f = new File(root);		// 루트 디렉토리 파일 객체 생성
		if (!f.exists()) f.mkdir();		// 디렉토리가 존재하지 않으면 새로 생성
		
		f = new File(root + "/" + fname);	// 파일 경로 완성 후 파일 객체 생성
		
		// 파일 저장
		if (!fname.equals("")) {
			FileOutputStream out = new FileOutputStream(f);
			out.write(data);
			out.close();			
		}
	}
}
