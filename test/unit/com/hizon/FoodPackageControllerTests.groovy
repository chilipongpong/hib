package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(FoodPackageController)
@Mock(FoodPackage)
class FoodPackageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/foodPackage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.foodPackageInstanceList.size() == 0
        assert model.foodPackageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.foodPackageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.foodPackageInstance != null
        assert view == '/foodPackage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/foodPackage/show/1'
        assert controller.flash.message != null
        assert FoodPackage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/foodPackage/list'

        populateValidParams(params)
        def foodPackage = new FoodPackage(params)

        assert foodPackage.save() != null

        params.id = foodPackage.id

        def model = controller.show()

        assert model.foodPackageInstance == foodPackage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/foodPackage/list'

        populateValidParams(params)
        def foodPackage = new FoodPackage(params)

        assert foodPackage.save() != null

        params.id = foodPackage.id

        def model = controller.edit()

        assert model.foodPackageInstance == foodPackage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/foodPackage/list'

        response.reset()

        populateValidParams(params)
        def foodPackage = new FoodPackage(params)

        assert foodPackage.save() != null

        // test invalid parameters in update
        params.id = foodPackage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/foodPackage/edit"
        assert model.foodPackageInstance != null

        foodPackage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/foodPackage/show/$foodPackage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        foodPackage.clearErrors()

        populateValidParams(params)
        params.id = foodPackage.id
        params.version = -1
        controller.update()

        assert view == "/foodPackage/edit"
        assert model.foodPackageInstance != null
        assert model.foodPackageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/foodPackage/list'

        response.reset()

        populateValidParams(params)
        def foodPackage = new FoodPackage(params)

        assert foodPackage.save() != null
        assert FoodPackage.count() == 1

        params.id = foodPackage.id

        controller.delete()

        assert FoodPackage.count() == 0
        assert FoodPackage.get(foodPackage.id) == null
        assert response.redirectedUrl == '/foodPackage/list'
    }
}
