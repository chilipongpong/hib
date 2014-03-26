package com.hizon



import org.junit.*
import grails.test.mixin.*

@TestFor(ValueRangeController)
@Mock(ValueRange)
class ValueRangeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/valueRange/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.valueRangeInstanceList.size() == 0
        assert model.valueRangeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.valueRangeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.valueRangeInstance != null
        assert view == '/valueRange/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/valueRange/show/1'
        assert controller.flash.message != null
        assert ValueRange.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/valueRange/list'

        populateValidParams(params)
        def valueRange = new ValueRange(params)

        assert valueRange.save() != null

        params.id = valueRange.id

        def model = controller.show()

        assert model.valueRangeInstance == valueRange
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/valueRange/list'

        populateValidParams(params)
        def valueRange = new ValueRange(params)

        assert valueRange.save() != null

        params.id = valueRange.id

        def model = controller.edit()

        assert model.valueRangeInstance == valueRange
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/valueRange/list'

        response.reset()

        populateValidParams(params)
        def valueRange = new ValueRange(params)

        assert valueRange.save() != null

        // test invalid parameters in update
        params.id = valueRange.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/valueRange/edit"
        assert model.valueRangeInstance != null

        valueRange.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/valueRange/show/$valueRange.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        valueRange.clearErrors()

        populateValidParams(params)
        params.id = valueRange.id
        params.version = -1
        controller.update()

        assert view == "/valueRange/edit"
        assert model.valueRangeInstance != null
        assert model.valueRangeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/valueRange/list'

        response.reset()

        populateValidParams(params)
        def valueRange = new ValueRange(params)

        assert valueRange.save() != null
        assert ValueRange.count() == 1

        params.id = valueRange.id

        controller.delete()

        assert ValueRange.count() == 0
        assert ValueRange.get(valueRange.id) == null
        assert response.redirectedUrl == '/valueRange/list'
    }
}
