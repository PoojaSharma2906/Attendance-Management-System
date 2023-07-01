let current_Day;
jQuery(document).ready(function () {
	jQuery('.datetimepicker').datepicker({
		timepicker: true,
		language: 'en',
		range: true,
		multipleDates: true,
		multipleDatesSeparator: " - ",
		beforeShowDay: function (date) {
			current_Day = date.getDay();
			var day = date.getDay();
			// Disable Saturdays (day 6) and Sundays (day 0)
			return [(day !== 6 && day !== 0)];
		}
	});
	if (current_Day!=0 || current_Day!=6) {

	jQuery("#add-event").submit(function () {
		var selected_date = jQuery("#current_date").val();
		var sel = new Date(selected_date);
		var day = sel.getDay();

		// Check if selected day is Saturday (day 6) or Sunday (day 0)
		if (day === 6 || day === 0) {
			//application.setAttribute("errMsg", "Please login first as User !!!");
			alert("Leave cannot be applied on Saturdays or Sundays.");
			localStorage.setItem("errMsg", "Leave cannot be applied on Saturdays or Sundays.");
			return false; // Prevent form submission
		}

		var values = {};
		$.each($('#add-event').serializeArray(), function (i, field) {
			values[field.name] = field.value;
			field.setAttribute("class", "marked");
		});
		console.log(values);
	});
}
});

(function () {
	'use strict';
	// ------------------------------------------------------- //
	// Calendar
	// ------------------------------------------------------ //
	jQuery(function () {
		// page is ready
		jQuery('#calendar').fullCalendar({
			themeSystem: 'bootstrap4',
			// emphasizes business hours
			businessHours: false,
			defaultView: 'month',
			// event dragging & resizing
			editable: true,
			// header
			header: {
				left: 'title',
				center: 'month,agendaWeek,agendaDay',
				right: 'today prev,next'
			},
			events: [],
			eventRender: function (event, element) {
				if (event.icon) {
					element.find(".fc-title").prepend("<i class='fa fa-" + event.icon + "'></i>");
				}
			},
			dayClick: function () {
				let selected_date = this[0].getAttribute("data-date");
				document.querySelector("#current_date").value = selected_date;
				//console.log(this[0].getAttribute("data-date"));
				let today = new Date(new Date().getFullYear() + "/" + (new Date().getMonth() + 1) + "/" + new Date().getDate());
				let sel = new Date(selected_date);
				console.log(!(sel < today));
				if (!(sel <= today) || current_Day == 0 || current_Day == 6) {
					jQuery('#modal-view-event-add').modal();
				}
			},
			eventClick: function (event, jsEvent, view) {
				jQuery('.event-icon').html("<i class='fa fa-" + event.icon + "'></i>");
				jQuery('.event-title').html(event.title);
				jQuery('.event-body').html(event.description);
				jQuery('.eventUrl').attr('href', event.url);
				jQuery('#modal-view-event').modal();
			},
		})
	});
})(jQuery);