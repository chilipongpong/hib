package com.hizon

class FileService {
	def grailsApplication
	transient def imagesRootPath 
	transient def imagesTempPath
	transient def imagesMaxSize

	def deleteFolder(directory) {
		def file = new File(directory)
		if (file.exists()) {
			file.eachFile() { f ->
				f.delete()
			}
		}
	 }
	 
	def copyFolder(sourceDir, destinationDir) {
		new AntBuilder().copy(todir: destinationDir) {
			fileset(dir: sourceDir)
		}
	}
	
	def getImagesRootPath() {
		return grailsApplication.config.hib.images.upload.directory
	}
	
	def getImagesTempPath() {
		return grailsApplication.config.hib.images.upload.directory + File.separator + "temp"
	}
	
	def getImagesMaxSize() {
		return grailsApplication.config.hib.images.max.size
	}
}
