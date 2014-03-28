package com.hizon

import org.springframework.dao.DataIntegrityViolationException
import org.compass.core.engine.SearchEngineQueryParseException
import org.springframework.web.multipart.commons.CommonsMultipartFile

class ThemeController {
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def fileService 
	def fileUploadService
	def searchableService
	
	static String WILDCARD = "*"
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [themeInstanceList: Theme.list(params), themeInstanceTotal: Theme.count()]
    }

    def create() {
		fileService.deleteFolder(fileService.imagesTempPath)
        [themeInstance: new Theme(params), imagesPath: fileService.imagesTempPath, imageMaxSize: fileService.imagesMaxSize]
    }

    def save() {
        def themeInstance = new Theme(params)
		if (params.colorsId) {
			def colors = [] as Set
			def colorsId = params.colorsId.split(",")
			for(colorId in colorsId) {
				colors.add(Color.get(colorId))
			}
			themeInstance.colors = colors;
		}
		
		themeInstance.id = params.id
		// primary image saving
		def CommonsMultipartFile primaryImage = request.getFile('primaryImage')
		if(!primaryImage.isEmpty()){
			def webRootDir = servletContext.getRealPath("/")
			def directory = new File(webRootDir, "/uploaded-files")
			directory.mkdirs()
			primaryImage.transferTo(new File(directory, themeInstance.name + "-" + primaryImage.originalFilename))
			themeInstance.primaryImage = themeInstance.name + "-" + primaryImage.originalFilename
		}
		
        if (!themeInstance.save(flush: true)) {
			def imagesDirectory = new File(fileService.imagesTempPath)
            render(view: "create", model: [themeInstance: themeInstance, imagesPath: fileService.imagesTempPath, images: imagesDirectory.listFiles(), imageMaxSize: fileService.imagesMaxSize])
            return
        }
		fileService.deleteFolder(fileService.imagesRootPath + File.separator + themeInstance.id)
		//move images to its folder
		fileService.copyFolder(fileService.imagesTempPath, fileService.imagesRootPath + File.separator + 'theme' + File.separator + themeInstance.id)
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'theme.label', default: 'Theme'), themeInstance.id])
        redirect(action: "show", id: themeInstance.id)
    }

    def show(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }
		def imagesDirectory = new File(fileService.imagesRootPath + File.separator + 'theme' + File.separator + themeInstance.id)
		[themeInstance: themeInstance, images: imagesDirectory.listFiles()]
    }
	
	def displayImage() {
		File image = new File(fileService.imagesRootPath + File.separator + 'theme' + File.separator + params.themeId + File.separator + params.img)
		if(!image.exists()) {
			response.status = 404
		} else {
			response.setContentType("image/jpeg")
			OutputStream out = response.getOutputStream();
			out.write(image.bytes);
			out.close();
		}
	}

    def edit(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }

        def imagesPath = fileService.imagesRootPath + File.separator + 'theme' + File.separator + themeInstance.id
		def imagesDirectory = new File(imagesPath)
        [themeInstance: themeInstance, imagesPath: imagesPath, images: imagesDirectory.listFiles(), imageMaxSize: fileService.imagesMaxSize]
    }

    def update(Long id, Long version) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }

		def imagesPath = fileService.imagesRootPath + File.separator + 'theme' + File.separator + themeInstance.id
		def imagesDirectory = new File(imagesPath)
        if (version != null) {
            if (themeInstance.version > version) {
                themeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'theme.label', default: 'Theme')] as Object[],
                          "Another user has updated this Theme while you were editing")
                render(view: "edit", model: [themeInstance: themeInstance, imagesPath: imagesPath, images: imagesDirectory.listFiles(), imageMaxSize: fileService.imagesMaxSize])
                return
            }
        }

        themeInstance.properties = params
		def colors = [] as Set
		if (params.colorsId) {
			def colorsId = params.colorsId.split(",")
					for(colorId in colorsId) {
						colors.add(Color.get(colorId))
					}
			themeInstance.colors = colors;		
		} else {
			themeInstance.colors = null;
		}
		
		// primary image saving
		def CommonsMultipartFile primaryImage = request.getFile('primaryImage')
		if(!primaryImage.isEmpty()){
			def webRootDir = servletContext.getRealPath("/")
			def directory = new File(webRootDir, "/uploaded-files")
			directory.mkdirs()
			primaryImage.transferTo(new File(directory, themeInstance.name + "-" + primaryImage.originalFilename))
			themeInstance.primaryImage = themeInstance.name + "-" + primaryImage.originalFilename
		}
		
        if (!themeInstance.save(flush: true)) {
            render(view: "edit", model: [themeInstance: themeInstance, imagesPath: imagesPath, images: imagesDirectory.listFiles(), imageMaxSize: fileService.imagesMaxSize])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'theme.label', default: 'Theme'), themeInstance.id])
        redirect(action: "show", id: themeInstance.id)
    }

    def delete(Long id) {
        def themeInstance = Theme.get(id)
        if (!themeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
            return
        }

        try {
            themeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'theme.label', default: 'Theme'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def search(){
		if (!params.q?.trim()) {
			return [:]
		}
		try {
			String searchTerm = WILDCARD+params.q+WILDCARD
			return [themeInstanceList: Theme.search(searchTerm, params)]
		} catch (SearchEngineQueryParseException ex) {
			return [parseException: true]
		}
	}
	
	def indexAll = {
		Thread.start {
			searchableService.index()
		}
		render("bulk index started in a background thread")
	}

	/**
	 * Perform a bulk index of every searchable object in the database
	 */
	def unindexAll = {
		searchableService.unindex()
		render("unindexAll done")
	}
	

}
