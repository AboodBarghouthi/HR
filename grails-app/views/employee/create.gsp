<%@ page import="hr.Department" %>
%{--<%@ page import="hr.Salary; hr.EnumSalaryType" %>--}%
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    %{--    <script>$('#nOfCh').hide()</script>--}%
    <style>
    .myBtn:hover {background: #1e7e34}
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    </style>
    <script type="text/javascript">

        function numOfChild(this_) {
            $(this_).on('change', function () {

                if ($(this_).is(':checked')) {
                    $('#nOfCh').show();
                } else {
                    $('#nOfCh').hide()
                    document.getElementById("nOfCh").value = 0
                    calculatePrize()

                }
            });
        }

        //
        // function numOfHours(this_) {
        //     $(this_).on('change', function () {
        //
        //         if ($(this_).is(':checked')) {
        //             $('#nOfH').show();
        //         } else {
        //             $('#nOfH').hide()
        //             document.getElementById("nOfH").value = 0
        //             calculatePrize()
        //         }
        //     });
        // }


        function noOfHours() {
            var employeeHours = document.getElementById("nOfH1").value;
            if (employeeHours <= 40) {
                var basic = 10.00 * employeeHours;
                var overtime = 0.00;
                var salary = basic;

                console.log("40 " + salary)
            } else if (employeeHours > 40 && employeeHours <= 50) {
                var basic = (10.00 * 40);
                var overtime = ((10.00 * 1.5) * (employeeHours - 40));
                var salary = (basic + overtime);
                console.log("under 50 " + salary)
            } else if (employeeHours > 50) {
                var basic = (10.00 * 40);
                // var z = (employeeHours-40)
                var overtime1 = ((10.00 * 1.5) * 10);
                var overtime2 = ((10.00 * 2) * (employeeHours - 50));
                var salary = (basic + overtime1 + overtime2);
                console.log("over 50 " + salary)
            }
            // alert(salary)
            document.getElementById("netSalary").value = salary;
            return salary;

        }

        window.onload = () =>
            document.querySelectorAll(".input-x1").forEach(input => input.addEventListener("change", calculatePrize));
        document.querySelectorAll("#nOfCh").forEach(input => input.addEventListener("change", calculatePrize));

        // document.querySelectorAll("#nOfH").forEach(input => input.addEventListener("change", calculatePrize));
        function calculatePrize() {
            // var basic = document.querySelector('#basic').value
            var noOfCh = document.querySelector('#nOfCh').value
            // var noOfH = document.querySelector('#nOfH').value
            var sum = 0
            document.querySelectorAll(".input-x1").forEach(input => sum += (input.checked ? Number.parseFloat(input.getAttribute("data-price")) : 0));

            document.querySelectorAll(".input-x2").forEach(input => sum += (input.checked ? Number.parseFloat(input.getAttribute("data-price") * noOfCh) : 0));

            // document.querySelectorAll(".input-x3").forEach(input => sum += (input.checked ? Number.parseFloat(input.getAttribute("data-price") * noOfH) : 0));

            var value = parseFloat(noOfHours());
            document.getElementById("netSalary").value = value + sum;

            // console.log(parseFloat(basic) + sum)
        }

    </script>
</head>

<body>
<a href="#create-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-employee" class="content scaffold-create" role="main">
<h1><g:message code="default.create.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${this.employee}">
    <ul class="errors" role="alert">
        <g:eachError bean="${this.employee}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<g:form action="save" controller="employee" method="post">
    <fieldset class="form">
        <div class='fieldcontain required'>
            <label for='personSsn'>Person Ssn
                <span class='required-indicator'>*</span>
            </label><g:select from="${hr.Person?.list()}" optionValue="personSsn" optionKey="id" name="personSsn"
                              required="" id="personSsn">
        </g:select>
        </div>

        <div class='fieldcontain required'>
            <label for='phoneNumber'>Phone Number
                <span class='required-indicator'>*</span>
            </label><input type="text" name="phoneNumber" value="${employee?.phoneNumber}" required=""
                           id="phoneNumber"/>
        </div>

        <div class='fieldcontain required'>
            <label for='email'>Email
                <span class='required-indicator'>*</span>
            </label><input type="text" name="email" value="${employee?.phoneNumber}" required="" id="email"/>
        </div>

        <div class='fieldcontain required'>
            <label for='emplpyeeTitle'>Emplpyee Title
                <span class='required-indicator'>*</span>
            </label><input type="text" name="emplpyeeTitle" value="${employee?.emplpyeeTitle}" required=""
                           id="emplpyeeTitle"/>
        </div>

        <div class='fieldcontain required'>
            <label for='emplpoyeeDescription'>Emplpoyee Description
                <span class='required-indicator'>*</span>
            </label><input type="text" name="emplpoyeeDescription" value="${employee?.emplpoyeeDescription}"
                           required="" id="emplpoyeeDescription"/>
        </div>

        %{--        <div class='fieldcontain required'>--}%
        %{--            <label for='netSalary'>Net Salary--}%
        %{--                <span class='required-indicator'>*</span>--}%
        %{--            </label><input type="number decimal" name="netSalary" value="" required="" id="netSalary"/>--}%
        %{--        </div>--}%

        <div class='fieldcontain required'>
            <label for='department'>Department
                <span class='required-indicator'>*</span>
            </label><g:select name="department" optionValue="departmentName" optionKey="id" required=""
                              id="department" from="${hr.Department?.list()}">
        </g:select>
            <br>
        </div>
        <div class='fieldcontain required'>
        <button type="button" id="myBtn">Salary Modal</button>
        </div>

    </div>
    <!-- Trigger/Open The Modal -->

    <!-- The Modal -->
    <div id="salaryModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div>
                <label for="nOfH1">Number of Hours in week</label>
                <input type="number" placeholder="Number of Hours1 " id="nOfH1" required onchange="noOfHours()">
                %{--            <g:field id="basic" type="number" name="Basic" value="${hr.EnumSalaryType.basic}"/>--}%
                %{--            <g:checkBox for="basic" class="input-x" name="basic" from="basic" data-price='basic'/>--}%
                <g:checkBox class="input-x1" name="HaveWife" id="HaveWife" from="${hr.EnumSalaryType.wife_com}"
                            data-price='100'/>
                <label for="HaveWife">Wife</label>
                <g:checkBox class="input-x2" name="HaveChild" id="HaveChild" from="${hr.EnumSalaryType.child_com}"
                            data-price='50' onclick="numOfChild(this)"/>
                <label for="HaveChild">Child</label>
                <input type="number" placeholder="Number of child" id="nOfCh" style="display: none"
                       onchange="calculatePrize()">
                %{--            <g:checkBox class="input-x3" name="OverTime" id="OverTime" from="${hr.EnumSalaryType.over_Time}"--}%
                %{--                        data-price='25' onclick="numOfHours(this)"/>--}%
                %{--            <label for="OverTime">Over_Time</label>--}%
                %{--            <input type="number" placeholder="Number of Hours" id="nOfH" style="display: none">--}%
                <br>

                %{-- <button id="n" onclick="noOfHours()">calc</button>--}%
                <section id="checkCost">
                    Net Salary:
                    <input id="netSalary" type="text" name="netSalary" size="10" readonly value="${employee?.netSalary}">
                </section>
            </div>

        </div>
    </div>
    <g:javascript>
        //
        // Get the modal
        var modal = document.getElementById("salaryModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on the button, open the modal
        btn.onclick = function () {
            modal.style.display = "block";
        }

        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </g:javascript>

    </fieldset>
    <fieldset class="buttons">
        <g:submitButton id="btn" name="save"/>
    </fieldset>
</g:form>

</body>
</html>
<div id="">
    %{--                <div>--}%
    %{--                <label for="nOfH1">Number of Hours in week</label>--}%
    %{--                <input type="number" placeholder="Number of Hours1 " id="nOfH1" required onchange="noOfHours()">--}%
    %{--                --}%%{--            <g:field id="basic" type="number" name="Basic" value="${hr.EnumSalaryType.basic}"/>--}%
    %{--                --}%%{--            <g:checkBox for="basic" class="input-x" name="basic" from="basic" data-price='basic'/>--}%
    %{--                <g:checkBox class="input-x1" name="HaveWife" id="HaveWife" from="${hr.EnumSalaryType.wife_com}"--}%
    %{--                            data-price='100'/>--}%
    %{--                <label for="HaveWife">Wife</label>--}%
    %{--                <g:checkBox class="input-x2" name="HaveChild" id="HaveChild" from="${hr.EnumSalaryType.child_com}"--}%
    %{--                            data-price='50' onclick="numOfChild(this)"/>--}%
    %{--                <label for="HaveChild">Child</label>--}%
    %{--                <input type="number" placeholder="Number of child" id="nOfCh" style="display: none" onchange="calculatePrize()">--}%
    %{--                --}%%{--            <g:checkBox class="input-x3" name="OverTime" id="OverTime" from="${hr.EnumSalaryType.over_Time}"--}%
    %{--                --}%%{--                        data-price='25' onclick="numOfHours(this)"/>--}%
    %{--                --}%%{--            <label for="OverTime">Over_Time</label>--}%
    %{--                --}%%{--            <input type="number" placeholder="Number of Hours" id="nOfH" style="display: none">--}%
    %{--                <br>--}%

    %{--                --}%%{--            <button id="n" onclick="noOfHours()">calc</button>--}%
    %{--                <section id="checkCost">--}%
    %{--                    Net Salary:--}%
    %{--                    <input id="netSalary" type="text" name="netSalary" size="10" readonly value="${employee?.netSalary}">--}%
    %{--                </section>--}%

    %{--                </div>--}%
</div>