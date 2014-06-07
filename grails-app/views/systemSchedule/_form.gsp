<%@ page import="happybet.SystemSchedule" %>
<fieldset>
    <div class="form-group ${hasErrors(bean: systemScheduleInstance, field: 'name', 'error')} required">
        <label for="name">
            <g:message code="systemSchedule.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" required="" value="${systemScheduleInstance?.name}" class="form-control"/>
    </div>
    <div class="form-group ${hasErrors(bean: systemScheduleInstance, field: 'endDate', 'error')} required">
        <label for="endDate">
            <g:message code="systemSchedule.endDate.label" default="End Date" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="endDate" precision="day"  value="${systemScheduleInstance?.endDate}" class="form-control"/>
    </div>
    <div class="form-group ${hasErrors(bean: systemScheduleInstance, field: 'startDate', 'error')} required">
        <label for="startDate">
            <g:message code="systemSchedule.startDate.label" default="Start Date" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="startDate" precision="day"  value="${systemScheduleInstance?.startDate}" class="form-control" />
    </div>
    <div class="form-group ${hasErrors(bean: systemScheduleInstance, field: 'matches', 'error')} ">
        <label for="matches">
            <g:message code="systemSchedule.matches.label" default="Matches" />
        </label>
        <ul class="one-to-many">
            <g:each in="${systemScheduleInstance?.matches?}" var="m">
                <li><g:link controller="systemMatch" action="show" id="${m.id}">${m.home} vs ${m.guess}</g:link></li>
            </g:each>
            <li class="add">
                <g:link controller="systemMatch" action="create" params="['systemSchedule.id': systemScheduleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'systemMatch.label', default: 'SystemMatch')])}</g:link>
            </li>
        </ul>
    </div>
</fieldset>
