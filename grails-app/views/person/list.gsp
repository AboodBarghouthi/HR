<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Person's List:</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#tblData tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</head>

<body>
%{--<f:table collection="personList"/>--}%
<h1>Person's List:</h1>
<input id="myInput" type="text" placeholder="Search..">
<br><br>
<table id="tblData" class="table">
    <thead>
    <tr>
        <th>first name</th>
        <th>middle name</th>
        <th>last name</th>
        <th>gender</th>
%{--        <th> <g:link controller="contactInfo" action="list">contactInfo</g:link></th>--}%
        <th><g:link controller="location" action="list">location</g:link></th>
%{--        <th><g:link controller="relate" action="list">Relate</g:link></th>--}%
        <th>options</th>

    </tr>
    </thead>

    <tbody>

    <g:each in="${hr.Person.list()}" var="person">

        <tr>
            <td>${person.firstName}</td>
            <td>${person.middleName}</td>
            <td>${person.lastName}</td>
            <td>${person.gender}</td>
            <td><g:link controller="location" action="show" params="${[id:person.location.id]}">${person.location}</g:link></td>--}%

        %{--            <g:if test="${person.contactsInfo}">--}%
%{--                <td><g:link controller="contactInfo" action="list" params="${[personId:person.id]}" >Contact Info</g:link></td>--}%
%{--            </g:if>--}%
%{--            <g:else>--}%
%{--                <td><g:link controller="contactInfo" action="create" params="${[personId:person.id]}">add contact</g:link></td>--}%
%{--            </g:else>--}%
%{--            <td><g:link controller="location" action="show" params="${[id:person.location.id]}">${person.location}</g:link></td>--}%

%{--            <g:if test="${person.relates}" >--}%
%{--                <td><g:link controller="relate" action="list" params="${[personId:person.id]}" >Relates </g:link></td>--}%
%{--            </g:if>--}%
%{--            <g:else>--}%
%{--                <td><g:link controller="relate" action="create" params="${[id:person.id]}">add relate</g:link></td>--}%
%{--            </g:else>--}%
            <td>
                <g:form resource="${this.person}" controller="person" >
                    <g:link  action="create" resource="${this.person}" params="${[id:person.id]}" >Edit |</g:link>

                    <g:link  action="mydelete" params="${[id:person.id]}"  onclick="return confirm('sure?');">delete |</g:link>
                    <g:link  action="show" params="${[id:person.id]}" >view</g:link>
                </g:form>
            </td>
        </tr>
    </g:each>

    </tbody>
</table>
<fieldset class="buttons">
    <g:link controller="person" action="create">create</g:link>
</fieldset>
%{--<g:link action="create">Create new person</g:link>--}%

</body>
</html>