<html>
<head>
    <meta name="layout" content="main"/>

    <title>Create Person</title>
</head>

<body>

<h1>create new person</h1>
<g:hasErrors bean="${this.person}">
    <ul class="errors" role="alert">
        <g:eachError bean="${this.person}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<g:form action="save" controller="person" method="post">
    <g:hiddenField   id="id" value="${person?.id}" name="id"/>
    <fieldset class="form" id="personData">
        <li><label for="personSsn">Ssn</label></li> <li>
        <input type="text" name="personSsn" id="personSsn" value="${person?.personSsn}" size="50">
    </li><br>
        <li>
            <label for="firstName">FirstName</label></li> <li>
        <input type="text" name="firstName" id="firstName" value="${person?.firstName}" size="50" placeholder="FirstName"  text-transform="capitalize">
    </li>
        <br>
        <li>
            <label for="middleName">MiddleName</label></li> <li>
        <input type="text" name="middleName" id="middleName" value="${person?.middleName}" size="50" placeholder="MiddleName"></li><br>
        <li>
            <label for="lastName">LastName</label></li> <li>
        <input type="text" name="lastName" id="lastName" value="${person?.lastName}" size="50"  placeholder="LastName">
    </li><br>

        <li>
            <label for="birthdate">Date Of Birth</label></li> <li>
    <g:datePicker precision="day" type="date" name="birthdate" id="birthdate" value="${person?.birthdate}"/></li><br>

%{--    <input type="date" name="birthdate" id="birthdate" value="${person?.birthdate}"></li><br>--}%
%{--        <input type="text" name="birthdate" id="birthdate">--}%
        <li>
            <label for="description">Description</label></li> <li>
        <input type="text" name="description" id="description" value="${person?.description}" size="50">
    </li><br>
        <li>
            <label for="gender">gender</label></li> <li>
        <g:select name="gender" from="${hr.GenderEnum.values()}" value="${person?.gender}"/>
    </li>
        <br>
        <li>
            <label for="location">Location:</label></li>
        <li>
        <g:select name="location" id="l" multiple="true" optionValue="locationName" optionKey="id" from="${hr.Location?.list()}" value="${person?.location?.id}" size="1"/>
%{--        <g:link url="[action: 'create', controller: 'location']" params="${params}">add location</g:link>--}%
        %{--            //not the whole page ,, loading ajax--}%
        </li>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton id="btn" name="save"/>
    </fieldset>
</g:form>
</body>
</html>