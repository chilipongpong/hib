package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(SuperAdminController)
@Mock(SuperAdmin)
class SuperAdminControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/superAdmin/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.superAdminInstanceList.size() == 0
        assert model.superAdminInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.superAdminInstance != null
    }

    void testSave() {
        controller.save()

        assert model.superAdminInstance != null
        assert view == '/superAdmin/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/superAdmin/show/1'
        assert controller.flash.message != null
        assert SuperAdmin.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/superAdmin/list'

        populateValidParams(params)
        def superAdmin = new SuperAdmin(params)

        assert superAdmin.save() != null

        params.id = superAdmin.id

        def model = controller.show()

        assert model.superAdminInstance == superAdmin
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/superAdmin/list'

        populateValidParams(params)
        def superAdmin = new SuperAdmin(params)

        assert superAdmin.save() != null

        params.id = superAdmin.id

        def model = controller.edit()

        assert model.superAdminInstance == superAdmin
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/superAdmin/list'

        response.reset()

        populateValidParams(params)
        def superAdmin = new SuperAdmin(params)

        assert superAdmin.save() != null

        // test invalid parameters in update
        params.id = superAdmin.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/superAdmin/edit"
        assert model.superAdminInstance != null

        superAdmin.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/superAdmin/show/$superAdmin.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        superAdmin.clearErrors()

        populateValidParams(params)
        params.id = superAdmin.id
        params.version = -1
        controller.update()

        assert view == "/superAdmin/edit"
        assert model.superAdminInstance != null
        assert model.superAdminInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/superAdmin/list'

        response.reset()

        populateValidParams(params)
        def superAdmin = new SuperAdmin(params)

        assert superAdmin.save() != null
        assert SuperAdmin.count() == 1

        params.id = superAdmin.id

        controller.delete()

        assert SuperAdmin.count() == 0
        assert SuperAdmin.get(superAdmin.id) == null
        assert response.redirectedUrl == '/superAdmin/list'
    }
}
