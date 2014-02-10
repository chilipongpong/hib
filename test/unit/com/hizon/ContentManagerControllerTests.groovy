package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(ContentManagerController)
@Mock(ContentManager)
class ContentManagerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contentManager/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contentManagerInstanceList.size() == 0
        assert model.contentManagerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contentManagerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contentManagerInstance != null
        assert view == '/contentManager/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contentManager/show/1'
        assert controller.flash.message != null
        assert ContentManager.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contentManager/list'

        populateValidParams(params)
        def contentManager = new ContentManager(params)

        assert contentManager.save() != null

        params.id = contentManager.id

        def model = controller.show()

        assert model.contentManagerInstance == contentManager
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contentManager/list'

        populateValidParams(params)
        def contentManager = new ContentManager(params)

        assert contentManager.save() != null

        params.id = contentManager.id

        def model = controller.edit()

        assert model.contentManagerInstance == contentManager
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contentManager/list'

        response.reset()

        populateValidParams(params)
        def contentManager = new ContentManager(params)

        assert contentManager.save() != null

        // test invalid parameters in update
        params.id = contentManager.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contentManager/edit"
        assert model.contentManagerInstance != null

        contentManager.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contentManager/show/$contentManager.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contentManager.clearErrors()

        populateValidParams(params)
        params.id = contentManager.id
        params.version = -1
        controller.update()

        assert view == "/contentManager/edit"
        assert model.contentManagerInstance != null
        assert model.contentManagerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contentManager/list'

        response.reset()

        populateValidParams(params)
        def contentManager = new ContentManager(params)

        assert contentManager.save() != null
        assert ContentManager.count() == 1

        params.id = contentManager.id

        controller.delete()

        assert ContentManager.count() == 0
        assert ContentManager.get(contentManager.id) == null
        assert response.redirectedUrl == '/contentManager/list'
    }
}
