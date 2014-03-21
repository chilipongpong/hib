<%@ page import="com.hizon.ValueRange" %>



<div class="fieldcontain ${hasErrors(bean: valueRangeInstance, field: 'lowerLimit', 'error')} required">
	<label for="lowerLimit">
		<g:message code="valueRange.lowerLimit.label" default="Lower Limit" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lowerLimit" type="number" value="${valueRangeInstance.lowerLimit}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: valueRangeInstance, field: 'upperLimit', 'error')} required">
	<label for="upperLimit">
		<g:message code="valueRange.upperLimit.label" default="Upper Limit" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="upperLimit" type="number" value="${valueRangeInstance.upperLimit}" required=""/>
</div>

