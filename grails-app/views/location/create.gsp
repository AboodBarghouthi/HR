<%@ page import="hr.City; hr.Country" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript>
    function co(this_) {
        $(document).ready(function () {
            $(this_).change(function () {
                $('#citySelect').show();

                alert("this_");
                var countryName = $(this_).val();
                $.get("${createLink(controller:'country',action:'c')}",
                    {countryName:countryName, ajax: 'true'},
                    function (cityList) {
                        var options = ' ';
                        for (var i = 0; i < cityList.type.length; i++) {
                            options += '<option value="' + cityList.type[i].id + '">' + cityList.type[i].cityName + '</option>';
                        }
                        $('#citySelect').html(options);
                    })
            });

        });
    }
    </g:javascript>
    </head>
    <body>
        <a href="#create-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-location" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.location}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.location}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

<g:form action="save" controller="location" method="post">
    <g:hiddenField   id="id" value="${location?.id}" name="id"/>

    <fieldset class="form" id="locationData">
        <g:select id="countrySelect" from="${hr.Country.list()}" optionKey="id" optionValue="countryName" noSelection="['':'-Choose a country-']" name="country" onclick="co(this)" required="required" /><span style="color: #9a1616">*</span>


        <g:select id="citySelect" optionKey="id" optionValue="cityName" noSelection="['':'-Choose a city-']" name="city" from="${hr.City.list()}" />
        <li><label for="street">Street Name</label></li> <li>
        <input type="text" name="street" id="street" value="${location?.street}" size="50">
    </li><br>
    <li>
        <label for="locationName">Name Of Location</label></li> <li>
    <input type="text" name="locationName" id="locationName" value="${location?.locationName}" size="50" placeholder="locationName"  text-transform="capitalize">
</li>
    <br>
    <li>
        <label for="Description">Description</label></li> <li>
    <input type="text" name="description" id="description" value="${location?.description}" size="50" placeholder="Description" val></li><br>
    <li>
        <label for="BuildingNumber">BuildingNumber</label></li> <li>
    <input type="text" name="buildingNumber" id="buildingNumber" value="${location?.buildingNumber}" size="50"  placeholder="Building Number">
</li>
<g:javascript>

// function f() {
//
//
//                         $(document).ready(function() {
//
//     populateLists("countrySelect");
//
//     $("#countrySelect, #citySelect ").change(function() {
//         populateLists($(this).attr("id"));
//     });
//     alert("++++++++++++++++++++")
//     function populateLists(listType) {
//
//         // do your ajax here (should return an array or string with all corresponding values)
//
//         // on success do this:
//
//         var list;
//
//         if(listType == "countrySelect") {
//
//             // populate cities
//             list = $("#citySelect");
//         }
//     alert("++++++++++++++++++++")
//
//         for(var i = 0; i < returnedArray.length; ++i) {
//          list.append("<option value='" + returnedArray[i] + "'>" + returnedArray[i] + "</option>");
//         }
//     }
// });
//                         // }
%{--function makeSubmenu(value) {--}%
%{--   var citiesByCountry = '${hr.City.listOrderByCountry()}'--}%
%{--if(value.length==0) document.getElementById("citySelect").innerHTML = "<option></option>";--}%
%{--else {--}%
%{--var citiesOptions = "";--}%
%{--for(cityId in citiesByCountry[value]) {--}%
%{--citiesOptions+="<option>"+citiesByCountry[value][cityId]+"</option>";--}%
%{--}--}%
%{--document.getElementById("citySelect").innerHTML = citiesOptions;--}%
%{--}--}%
%{--}--}%
%{--function displaySelected() { var country = document.getElementById("countrySelect").value;--}%
%{--var city = document.getElementById("citySelect").value;--}%
%{--alert(country+"\n"+city);--}%
%{--}--}%
%{--function resetSelection() {--}%
%{--document.getElementById("countrySelect").selectedIndex = 0;--}%
%{--document.getElementById("citySelect").selectedIndex = 0;--}%
%{--}--}%
                        // var inputVal = document.getElementById('countryS').value;
                        // alert(document.getElementById('countryS').value)
%{--                        function x(this_ ) {--}%
%{--                            alert(this_.value)--}%
%{--                            $(document).ready(function() {--}%
%{--                                $(this_).change(function() {--}%
%{--                                    // alert(inputVal)--}%
%{--                                    $.ajax({--}%
%{--                                        url: "${createLink(controller:'country',action:'countrySelected')}",--}%
%{--                                        data: {id :this_.value},--}%
%{--                                        dataType:"json",--}%
%{--                                        cache: false,--}%
%{--                                        success: function (data) {--}%

%{--                                    // $('#citySelection').find('option[value="'+data.id+'"]').prop('selected', true);--}%
%{--                                    // alert("Success")--}%
%{--                                var $subSelect = $("#citySelect");--}%
%{--                                // $('#citySelect option:gt(0)').remove();--}%
%{--                                $.each(data, function (index, element) {--}%
%{--                                alert("Success")--}%

%{--                                if(this_.value != "" ){--}%
%{--                                    var selected = $("<option></option>");--}%
%{--                                    selected.attr("selected", "selected");--}%
%{--                                    selected.attr("value",element.name);--}%
%{--                                    selected.text(element);--}%
%{--                                    const v=JSON.parse(element);--}%
%{--                                    const a = document.getElementById("citySelect").innerHTML=v.id;--}%

%{--                                    alert("+++++++"+a);--}%
%{--                                    $subSelect.append(selected)--}%

%{--                                }else{--}%
%{--                                    $subSelect.append($("<option></option>").attr("value", element.id).text(element));--}%
%{--                                }--}%

%{--                             });--}%
%{--                             $('#citySelect').select2({--}%
%{--                               placeholder: "${message(code: 'default.select.label')}",--}%
%{--                               allowClear: true--}%
%{--                             });--}%
%{--                             alert("success")--}%
%{--                         }--}%
                                        // alert($('#citySelection').find('option[value="'+data.id+'"]').prop('selected', true).value)
                                        //  var $option = $('<option></option>').html(data.type).attr('value', data.id).prop('selected', true);



                            //         })
                            //     })
                            // })}
                    </g:javascript>


                    %{--function remoteFunction(){--}%
                   %{--    var inputVal = document.getElementById("country").value;--}%
                   %{--    $(document).ready(function(){--}%
                   %{--        // alert("ok");--}%
                   %{--        $("citySelection").on('change',function (e){--}%
                   %{--            // alert("inside click");--}%
                   %{--            var URL="${createLink(controller:'country')}"--}%
                   %{--            // alert(URL)--}%
                   %{--            $.ajax({--}%
                   %{--                url:URL,--}%
                   %{--                type: "post",--}%
                   %{--                update: 'citySelection',--}%
                   %{--                data:inputVal--}%
                   %{--            })--}%
                   %{--        })--}%
                   %{--        e.preventDefault();--}%
                   %{--    })--}%
                   %{--}--}%
%{--                  </script>--}%


                </fieldset>

                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>

        </div>
    </body>
</html>
