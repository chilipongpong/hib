package com.hizon

import org.springframework.dao.DataIntegrityViolationException

class PackageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [packageInstanceList: Package.list(params), packageInstanceTotal: Package.count()]
    }

    def create() {
        [packageInstance: new Package(params)]
    }

    def save() {
		params."appetizer.number" = params."appetizer.number" ? params."appetizer.number" : 0
		params."soup.number" = params."soup.number" ? params."soup.number" : 0
		params."salad.number" = params."salad.number" ? params."salad.number" : 0
		params."pasta.number" = params."pasta.number" ? params."pasta.number" : 0
		params."beef.number" = params."beef.number" ? params."beef.number" : 0
		params."pork.number" = params."pork.number" ? params."pork.number" : 0
		params."chicken.number" = params."chicken.number" ? params."chicken.number" : 0
		params."seafood.number" = params."seafood.number" ? params."seafood.number" : 0
		params."vegetable.number" = params."vegetable.number" ? params."vegetable.number" : 0
		params."dessert.number" = params."dessert.number" ? params."dessert.number" : 0
		
        def packageInstance = new Package(params)
		
		def foodPackages = [packageInstance.appetizer,
			packageInstance.soup,
			packageInstance.salad,
			packageInstance.pasta,
			packageInstance.beef,
			packageInstance.pork,
			packageInstance.chicken,
			packageInstance.seafood,
			packageInstance.vegetable,
			packageInstance.dessert]
		
		for (FoodPackage foodPackage: foodPackages) {
			foodPackage.save()
		}
		
        if (!packageInstance.save(flush: true)) {
            render(view: "create", model: [packageInstance: packageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'package.label', default: 'Package'), packageInstance.id])
        redirect(action: "show", id: packageInstance.id)
    }

    def show(Long id) {
        def packageInstance = Package.get(id)
        if (!packageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'package.label', default: 'Package'), id])
            redirect(action: "list")
            return
        }

        [packageInstance: packageInstance]
    }

    def edit(Long id) {
        def packageInstance = Package.get(id)
        if (!packageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'package.label', default: 'Package'), id])
            redirect(action: "list")
            return
        }

        [packageInstance: packageInstance]
    }

    def update(Long id, Long version) {
        def packageInstance = Package.get(id)
        if (!packageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'package.label', default: 'Package'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (packageInstance.version > version) {
                packageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'package.label', default: 'Package')] as Object[],
                          "Another user has updated this Package while you were editing")
                render(view: "edit", model: [packageInstance: packageInstance])
                return
            }
        }

        packageInstance.properties = params

        if (!packageInstance.save(flush: true)) {
            render(view: "edit", model: [packageInstance: packageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'package.label', default: 'Package'), packageInstance.id])
        redirect(action: "show", id: packageInstance.id)
    }

    def delete(Long id) {
        def packageInstance = Package.get(id)
        if (!packageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'package.label', default: 'Package'), id])
            redirect(action: "list")
            return
        }

        try {
			packageInstance.appetizer.delete()
			packageInstance.soup.delete()
			packageInstance.salad.delete()
			packageInstance.pasta.delete()
			packageInstance.beef.delete()
			packageInstance.pork.delete()
			packageInstance.chicken.delete()
			packageInstance.seafood.delete()
			packageInstance.vegetable.delete()
			packageInstance.dessert.delete()
            packageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'package.label', default: 'Package'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'package.label', default: 'Package'), id])
            redirect(action: "show", id: id)
        }
    }
}
