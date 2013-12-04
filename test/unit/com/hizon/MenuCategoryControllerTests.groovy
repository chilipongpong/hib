package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(MenuCategoryController)
@Mock(MenuCategory)
class MenuCategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/menuCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.menuCategoryInstanceList.size() == 0
        assert model.menuCategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.menuCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.menuCategoryInstance != null
        assert view == '/menuCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/menuCategory/show/1'
        assert controller.flash.message != null
        assert MenuCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/menuCategory/list'

        populateValidParams(params)
        def menuCategory = new MenuCategory(params)

        assert menuCategory.save() != null

        params.id = menuCategory.id

        def model = controller.show()

        assert model.menuCategoryInstance == menuCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/menuCategory/list'

        populateValidParams(params)
        def menuCategory = new MenuCategory(params)

        assert menuCategory.save() != null

        params.id = menuCategory.id

        def model = controller.edit()

        assert model.menuCategoryInstance == menuCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/menuCategory/list'

        response.reset()

        populateValidParams(params)
        def menuCategory = new MenuCategory(params)

        assert menuCategory.save() != null

        // test invalid parameters in update
        params.id = menuCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/menuCategory/edit"
        assert model.menuCategoryInstance != null

        menuCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/menuCategory/show/$menuCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        menuCategory.clearErrors()

        populateValidParams(params)
        params.id = menuCategory.id
        params.version = -1
        controller.update()

        assert view == "/menuCategory/edit"
        assert model.menuCategoryInstance != null
        assert model.menuCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/menuCategory/list'

        response.reset()

        populateValidParams(params)
        def menuCategory = new MenuCategory(params)

        assert menuCategory.save() != null
        assert MenuCategory.count() == 1

        params.id = menuCategory.id

        controller.delete()

        assert MenuCategory.count() == 0
        assert MenuCategory.get(menuCategory.id) == null
        assert response.redirectedUrl == '/menuCategory/list'
    }
}
