$(document).ready(function() {
	$(".colorSelect").change(function(){
		changeBackgroundColor($(this));
	});
	$(".ed-button").click(function() {
		$("#errorRandom").html("");

		var id = $(this).attr('id');
		var num = id.substring(id.length - 1, id.length);
		var data = {
			color1 : $("#color1").val(),
			color2 : $("#color2").val(),
			color3 : $("#color3").val()
		};

		$.ajax({
			url : 'getRandomColor',
			data : data,
			success : function(data) {
				if (data.color == null) {
					$("#errorRandom").html("No available theme for selected colors.");
				}
				$("#color" + num).val(data.color);
				changeBackgroundColor($("#color" + num));
			},
			error : function(request, status, error) {
				$("#errorRandom").html("Getting random color encountered a problem. Pleast try again later.")
			}
		});
	});
});

var changeBackgroundColor = function(select) {
	select.css("background-color", select.children(":selected").css("background-color"));
};