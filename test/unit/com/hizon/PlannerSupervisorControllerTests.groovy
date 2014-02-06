package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(PlannerSupervisorController)
@Mock(PlannerSupervisor)
class PlannerSupervisorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/plannerSupervisor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.plannerSupervisorInstanceList.size() == 0
        assert model.plannerSupervisorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.plannerSupervisorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.plannerSupervisorInstance != null
        assert view == '/plannerSupervisor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/plannerSupervisor/show/1'
        assert controller.flash.message != null
        assert PlannerSupervisor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/plannerSupervisor/list'

        populateValidParams(params)
        def plannerSupervisor = new PlannerSupervisor(params)

        assert plannerSupervisor.save() != null

        params.id = plannerSupervisor.id

        def model = controller.show()

        assert model.plannerSupervisorInstance == plannerSupervisor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/plannerSupervisor/list'

        populateValidParams(params)
        def plannerSupervisor = new PlannerSupervisor(params)

        assert plannerSupervisor.save() != null

        params.id = plannerSupervisor.id

        def model = controller.edit()

        assert model.plannerSupervisorInstance == plannerSupervisor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/plannerSupervisor/list'

        response.reset()

        populateValidParams(params)
        def plannerSupervisor = new PlannerSupervisor(params)

        assert plannerSupervisor.save() != null

        // test invalid parameters in update
        params.id = plannerSupervisor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/plannerSupervisor/edit"
        assert model.plannerSupervisorInstance != null

        plannerSupervisor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/plannerSupervisor/show/$plannerSupervisor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        plannerSupervisor.clearErrors()

        populateValidParams(params)
        params.id = plannerSupervisor.id
        params.version = -1
        controller.update()

        assert view == "/plannerSupervisor/edit"
        assert model.plannerSupervisorInstance != null
        assert model.plannerSupervisorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/plannerSupervisor/list'

        response.reset()

        populateValidParams(params)
        def plannerSupervisor = new PlannerSupervisor(params)

        assert plannerSupervisor.save() != null
        assert PlannerSupervisor.count() == 1

        params.id = plannerSupervisor.id

        controller.delete()

        assert PlannerSupervisor.count() == 0
        assert PlannerSupervisor.get(plannerSupervisor.id) == null
        assert response.redirectedUrl == '/plannerSupervisor/list'
    }
}
