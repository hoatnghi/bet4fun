<%@ page import="happybet.SystemMatch" %>
<fieldset>
    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'date', 'error')} required">
        <label for="date">
            <g:message code="systemMatch.date.label" default="Date" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="date" precision="hour"  value="${systemMatchInstance?.date}" class="form-control" />
    </div>

    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'home', 'error')} required">
        <label for="home">
            <g:message code="systemMatch.home.label" default="Home" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="home" required="" value="${systemMatchInstance?.home}" class="form-control"/>
    </div>

    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'guess', 'error')} required">
        <label for="guess">
            <g:message code="systemMatch.guess.label" default="Guess" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="guess" required="" value="${systemMatchInstance?.guess}" class="form-control"/>
    </div>

    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'hRate', 'error')} required">
        <label for="hRate">
            <g:message code="systemMatch.hRate.label" default="H Rate" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="hRate" value="${fieldValue(bean: systemMatchInstance, field: 'hRate')}" required="" class="form-control"/>
    </div>

    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'gRate', 'error')} required">
        <label for="gRate">
            <g:message code="systemMatch.gRate.label" default="G Rate" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="gRate" value="${fieldValue(bean: systemMatchInstance, field: 'gRate')}" required="" class="form-control"/>
    </div>

    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'hScore', 'error')} required">
        <label for="hScore">
            <g:message code="systemMatch.hScore.label" default="H Score" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="hScore" type="number" value="${systemMatchInstance.hScore}" required="" class="form-control"/>
    </div>

    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'gScore', 'error')} required">
        <label for="gScore">
            <g:message code="systemMatch.gScore.label" default="G Score" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="gScore" type="number" value="${systemMatchInstance.gScore}" required="" class="form-control"/>
    </div>


    <div class="form-group ${hasErrors(bean: systemMatchInstance, field: 'schedule', 'error')} required">
        <label for="schedule">
            <g:message code="systemMatch.schedule.label" default="Schedule" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="schedule" name="schedule.id" from="${happybet.SystemSchedule.list()}" optionKey="id" optionValue="name" required="" value="${systemMatchInstance?.schedule?.id}" class="many-to-one"/>
    </div>
</fieldset>
