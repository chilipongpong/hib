package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(PackageController)
@Mock(Package)
class PackageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/package/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.packageInstanceList.size() == 0
        assert model.packageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.packageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.packageInstance != null
        assert view == '/package/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/package/show/1'
        assert controller.flash.message != null
        assert Package.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/package/list'

        populateValidParams(params)
        def pckage = new Package(params)

        assert pckage.save() != null

        params.id = pckage.id

        def model = controller.show()

        assert model.packageInstance == pckage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/package/list'

        populateValidParams(params)
        def pckage = new Package(params)

        assert pckage.save() != null

        params.id = pckage.id

        def model = controller.edit()

        assert model.packageInstance == pckage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/package/list'

        response.reset()

        populateValidParams(params)
        def pckage = new Package(params)

        assert pckage.save() != null

        // test invalid parameters in update
        params.id = pckage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/package/edit"
        assert model.packageInstance != null

        pckage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/package/show/$pckage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pckage.clearErrors()

        populateValidParams(params)
        params.id = pckage.id
        params.version = -1
        controller.update()

        assert view == "/package/edit"
        assert model.packageInstance != null
        assert model.packageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/package/list'

        response.reset()

        populateValidParams(params)
        def pckage = new Package(params)

        assert pckage.save() != null
        assert Package.count() == 1

        params.id = pckage.id

        controller.delete()

        assert Package.count() == 0
        assert Package.get(pckage.id) == null
        assert response.redirectedUrl == '/package/list'
    }
}
