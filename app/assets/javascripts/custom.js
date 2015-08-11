/**
 * Created by thienphong on 19/05/2014.
 */
/*
 * Add bearers or ticket
 */
$(document).ready(function () {

    var maxInput = 8; //maximum input boxes allowed
    var inputWrapper = $("#inputWrapper"); //Input boxes wrapper ID
    var addButton = $("#addMoreInput"); //Add button ID
    var addTicket = $("#addMoreTicket"); //Add ticket button ID

    var x = inputWrapper.length; //initlal text box count
    var fieldCount = 2; //to keep track of text box added
    var ticketCount = 1; //to keep track of ticket

    $(addButton).click(function (e)  //on add input button click
    {
        if (x <= maxInput) //max input box allowed
        {
            fieldCount++; //text box added increment
            //add input box
            $(inputWrapper).append(
                    '<div class="newfont">' +
                    '<h4><strong>Bearer ' + x + '</strong></h4>' +
                    '<a href="#" class="btn btn-danger remove_class" style="float: right; margin-right: -15px; margin-top: -15px"><i class="fa fa-times"></i></a>' +
                    '<div class="rounded-box newfont">' +

                    '<span><i class="fa fa-user"></i></span><label for="bearer_' + fieldCount + '_name">Name</label>' +
                    '<input class="form-control" id="bearer_' + fieldCount + '_name" name="bearer_' + fieldCount + '_name" type="text" required/>' +
                    '<span><i class="fa fa-phone"></i></span><label for="bearer_' + fieldCount + '_phone">Phone</label>' +
                    '<input class="form-control" id="bearer_' + fieldCount + '_phone" name="bearer_' + fieldCount + '_phone" type="tel" required/>' +
                    '<span><i class="fa fa-envelope"></i></span><label for="bearer_' + fieldCount + '_email">University Email</label>' +
                    '<input class="form-control" id="bearer_' + fieldCount + '_email" name="bearer_' + fieldCount + '_email" type="email" required />' +
                    ' <span><i class="fa fa-share-alt"></i></span><label for="bearer_' + fieldCount + '_position">Position</label>' +
                    '<select class="form-control" id="bearer_' + fieldCount + '_position" name="bearer_' + fieldCount + '_position">' +
                    '<option>Bearer</option><option>President</option><option>Treasurer</option></select>' +
                    '<span><i class="fa fa-university"></i></span><label for="bearer_' + fieldCount + '_admin">Is Administrator?</label>' +
                    '<input id="bearer_' + fieldCount + '_admin" name="bearer_' + fieldCount + '_admin" type="checkbox"/>' +
                    '</div>' +
                    '</div>'
            );
            x++; //text box increment
        }
        var bodyHeight = $(window).outerHeight(),
            containerHeight = $('.inner-content').outerHeight(),
            headerHeight = $('header');

        if (bodyHeight > containerHeight) {
            headerHeight.css('height', bodyHeight);
        } else {
            headerHeight.css('height', containerHeight);
        }

        return false;
    });

    $(addTicket).click(function (e)  //on add input button click
    {
        if (x <= maxInput) //max input box allowed
        {
            ticketCount++; //text box added increment
            //add input box
            $(inputWrapper).append(
                    '<div class="newfont">' +
                    '<h4><strong>Ticket ' + (x + 1) + '</strong></h4>' +
                    '<a href="#" class="btn btn-danger remove_class" style="float: right; margin-right: -15px; margin-top: -15px"><i class="fa fa-times"></i></a>' +
                    '<div class="rounded-box newfont">' +

                    ' <span><i class="fa fa-ticket"></i></span><label for="ticket_' + ticketCount + '_type">Type</label>' +
                    ' <input class="form-control" id="ticket_' + ticketCount + '_type" name="ticket_' + ticketCount + '_type" required="required" type="text" />' +

                    ' <span><i class="fa fa-sort-numeric-asc"></i></span><label for="ticket_' + ticketCount + '_price">Price</label>' +
                    '<input class="form-control" id="ticket_' + ticketCount + '_price" name="ticket_' + ticketCount + '_price" required="required" type="number" />' +

                    ' <span><i class="fa fa-sort-numeric-asc"></i></span><label for="ticket_' + ticketCount + '_amount">Amount</label>' +
                    '<input class="form-control" id="ticket_' + ticketCount + '_amount" name="ticket_' + ticketCount + '_amount" required="required" type="number" />' +

                    '<span><i class="fa fa-calendar"></i></span><label for="ticket_' + ticketCount + '_start_date">Start Date</label>' +
                    '<input class="form-control" id="ticket_' + ticketCount + '_start_date" name="ticket_' + ticketCount + '_start_date" data-field="datetime" required="required"/>' +
                    '<div class="dtBox"></div>' +

                    '<span><i class="fa fa-calendar"></i></span><label for="ticket_' + ticketCount + '_end_date">End Date</label>' +
                    '<input class="form-control" id="ticket_' + ticketCount + '_end_date" name="ticket_' + ticketCount + '_end_date" data-field="datetime" required="required"/>' +
                    '<div class="dtBox"></div>' +
                    '</div>' +
                    '</div>' +
                    '<script>function displayPopup(){if($(document).width()>=768)return false;else return true}$(document).ready(function(){var e=displayPopup();$(".dtBox").DateTimePicker({isPopup:e,addEventHandlers:function(){var t=this;$(window).resize(function(){e=displayPopup();t.setIsPopup(e)})}})})</script>'
            );
            x++; //text box increment
        }
        var bodyHeight = $(window).outerHeight(),
            containerHeight = $('.inner-content').outerHeight(),
            headerHeight = $('header');

        if (bodyHeight > containerHeight) {
            headerHeight.css('height', bodyHeight);
        } else {
            headerHeight.css('height', containerHeight);
        }
        return false;
    });

    $("body").on("click", ".remove_class", function (e) { //user click on remove text
        if (x > 1) {
            $(this).parent('div').remove(); //remove text box
            x--; //decrement textbox
        }

        var bodyHeight = $(window).outerHeight(),
            containerHeight = $('.inner-content').outerHeight(),
            headerHeight = $('header');

        if (bodyHeight > containerHeight) {
            headerHeight.css('height', bodyHeight);
        } else {
            headerHeight.css('height', containerHeight);
        }

        return false;
    })

});

// Validation
$(function () {
    $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
});

function displayPopup() {
    if ($(document).width() >= 768)return false; else return true
}
$(document).ready(function () {
    var e = displayPopup();
    $(".dtBox").DateTimePicker({isPopup: e, addEventHandlers: function () {
        var t = this;
        $(window).resize(function () {
            e = displayPopup();
            t.setIsPopup(e)
        })
    }})
})
