package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(BundledItemController)
@Mock(BundledItem)
class BundledItemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bundledItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bundledItemInstanceList.size() == 0
        assert model.bundledItemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.bundledItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bundledItemInstance != null
        assert view == '/bundledItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bundledItem/show/1'
        assert controller.flash.message != null
        assert BundledItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bundledItem/list'

        populateValidParams(params)
        def bundledItem = new BundledItem(params)

        assert bundledItem.save() != null

        params.id = bundledItem.id

        def model = controller.show()

        assert model.bundledItemInstance == bundledItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bundledItem/list'

        populateValidParams(params)
        def bundledItem = new BundledItem(params)

        assert bundledItem.save() != null

        params.id = bundledItem.id

        def model = controller.edit()

        assert model.bundledItemInstance == bundledItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bundledItem/list'

        response.reset()

        populateValidParams(params)
        def bundledItem = new BundledItem(params)

        assert bundledItem.save() != null

        // test invalid parameters in update
        params.id = bundledItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bundledItem/edit"
        assert model.bundledItemInstance != null

        bundledItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bundledItem/show/$bundledItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bundledItem.clearErrors()

        populateValidParams(params)
        params.id = bundledItem.id
        params.version = -1
        controller.update()

        assert view == "/bundledItem/edit"
        assert model.bundledItemInstance != null
        assert model.bundledItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bundledItem/list'

        response.reset()

        populateValidParams(params)
        def bundledItem = new BundledItem(params)

        assert bundledItem.save() != null
        assert BundledItem.count() == 1

        params.id = bundledItem.id

        controller.delete()

        assert BundledItem.count() == 0
        assert BundledItem.get(bundledItem.id) == null
        assert response.redirectedUrl == '/bundledItem/list'
    }
}
