var initialize_calendar
initialize_calendar = function () {
    $('#timetable-units-calendar').each( function () {
        var calendar = $(this);
        calendar.fullCalendar({
            weekends: false,
            defaultView: 'agendaWeek',
            header: {
                left: '',
                center :'title',
                right :'listWeek,agendaWeek'
            },
            selectable: true,
            editable: true
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);