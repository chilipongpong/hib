package com.hizon

import org.codehaus.groovy.grails.web.context.ServletContextHolder;
import org.springframework.web.multipart.MultipartFile;

class FileUploadService {

    def String uploadFile(MultipartFile file, String name) {
		
		def servletContext = ServletContextHolder.servletContext
		def storagePath = servletContext.getRealPath("/WEB-INF")  + "/uploaded-files"
		
		
		// create storage path if directory does not exist
		def storagePathDirectory = new File(storagePath)
		if(!storagePathDirectory.exists()) {
			println "creating directory: ${storagePath}"
			
			if(storagePathDirectory.mkdirs()){
				println "SUCCESS!"
			} else {
				println "FAILED!"
			}
		}
		
		//storing the file
		if(!file.isEmpty()){
			file.transferTo(new File("${storagePath}/${name}"))
			println "Saved File: ${storagePath}/${name}"
			return "${storagePath}/${name}"
		} else {
			println "File ${storagePath}/${name} was empty!"
			return null
		}
    }
}
