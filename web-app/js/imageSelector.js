	$(document).ready(function() {
		/* auto select images */
		var selectedItemsId = $("#selectedItems").val().replace("[","").replace("]","").replace(" ","").split(",");
		selectedItemsId.forEach(function(id) {
			$(".image").each(function() {
				if($(this).find("#image-id").val() == id) {
					selectImage($(this));
				}
			});
		});
		toggleSaveButton();

		/* click handlers */
		$(".image").click(function() {
			if ($(this).hasClass("selected")) {
				deselectImage($(this));
			} else {
				selectImage($(this));
			}
			toggleSaveButton();
		});
		$("#save").click(function() {
			var ids = "";
			$(".selected").each(function() {
				var id = $(this).find("#image-id").val(); 
				ids += ids == "" ? id : "," + id;
			});
			$("#selectedItems").val(ids);
		});
	});

	/* functions */
	var selectImage = function(element) {
		element.css("background-color", "red");
		element.addClass("selected");
	};
	var deselectImage = function(element) {
		element.css("background-color", "white");
		element.removeClass("selected");
	};
	var toggleSaveButton = function() {
		var hasSelected = false;
		$(".image").each(function() {
			if ($(this).hasClass("selected")){
				hasSelected = true;
			}
		});
		$("#save").prop("disabled", !hasSelected);	
	};