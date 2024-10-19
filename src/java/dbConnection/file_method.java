/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.io.File;

/**
 *
 * @author Acer
 */
public class file_method {
    public static long getFolderSize(File folder) {
		long size=0;
		for(File file:folder.listFiles()){
			if(file.isFile()){
				size+=file.length();
			}else{
				size+=getFolderSize(file);
			}
		}
		return size;
	}
}
