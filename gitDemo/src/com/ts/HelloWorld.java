package com.ts;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class HelloWorld {

	public static void main(String[] args) throws IOException {
		 File file = new File("c:/test");
		 if(file.isDirectory()){
			File[] files =  file.listFiles();
			if(files.length <= 0){
				OutputStream outputStream = new FileOutputStream("c:/test/test.txt");
				outputStream.close();
			}else{
				InputStream inputStream = new FileInputStream("c:/test/test.txt");
				OutputStream outputStream = new FileOutputStream("c:/test/test1.txt");
				byte[] b = new byte[32];
				int len = 0;
				//inputStream.read(b, 1, len);
				
			}
		 }
	}
}
