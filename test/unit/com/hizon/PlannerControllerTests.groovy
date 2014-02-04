package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(PlannerController)
@Mock(Planner)
class PlannerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/planner/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.plannerInstanceList.size() == 0
        assert model.plannerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.plannerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.plannerInstance != null
        assert view == '/planner/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/planner/show/1'
        assert controller.flash.message != null
        assert Planner.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/planner/list'

        populateValidParams(params)
        def planner = new Planner(params)

        assert planner.save() != null

        params.id = planner.id

        def model = controller.show()

        assert model.plannerInstance == planner
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/planner/list'

        populateValidParams(params)
        def planner = new Planner(params)

        assert planner.save() != null

        params.id = planner.id

        def model = controller.edit()

        assert model.plannerInstance == planner
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/planner/list'

        response.reset()

        populateValidParams(params)
        def planner = new Planner(params)

        assert planner.save() != null

        // test invalid parameters in update
        params.id = planner.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/planner/edit"
        assert model.plannerInstance != null

        planner.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/planner/show/$planner.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        planner.clearErrors()

        populateValidParams(params)
        params.id = planner.id
        params.version = -1
        controller.update()

        assert view == "/planner/edit"
        assert model.plannerInstance != null
        assert model.plannerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/planner/list'

        response.reset()

        populateValidParams(params)
        def planner = new Planner(params)

        assert planner.save() != null
        assert Planner.count() == 1

        params.id = planner.id

        controller.delete()

        assert Planner.count() == 0
        assert Planner.get(planner.id) == null
        assert response.redirectedUrl == '/planner/list'
    }
}
