// myDropzone is the configuration for the element that has an id attribute
// drop is an id attribute
Dropzone.options.dropz = {
	init : function() {
		this.on("addedfile", function(file) {
			// Create the remove button
			var removeButton = Dropzone
			.createElement("<span class='remove-img' title='删除'></span>");
			// Capture the Dropzone instance as closure.
			var _this = this;

			// Listen to the click event
			removeButton.addEventListener("click", function(e) {
				// Make sure the button click doesn't submit the
				// form:
				e.preventDefault();
				e.stopPropagation();

				// Remove the file preview.
				_this.removeFile(file);
				// If you want to the delete the file on the
				// server as well,
				// you can do the AJAX request here.
				
			});
			// Add the button to the file preview element.
			file.previewElement.appendChild(removeButton);
		});
	}
};

$("#dropz").dropzone({
	url : "/uploadAction",
	thumbnailWidth: 105,
	thumbnailHeight: 105,
	maxFiles : 4,
	maxFilesize : 5,
	uploadMultiple : true,
	acceptedFiles : ".jpg,.jpeg,.png,.gif,.bmp",
	// dictDefaultMessage : "点击或拖动图片上传",
	dictInvalidFileType : "Support jpg, jpeg, png, gif, bmp",
	dictFileTooBig : "Max size {{maxFilesize}}M!",
	dictCancelUpload : "Cancel",
	dictCancelUploadConfirmation : "Upload canceled!",
	dictMaxFilesExceeded : "Oppos, too much photos!",
	dictFallbackMessage : "Your browser doesn't support drag & drop!",
	dictResponseError : "Server error! {{statusCode}} code.",
});


var third_row = $("#third-row");

$('#btn-credit').on('click', function(event) {
	third_row.html("<small>If you want to use <strong>Get It Now</strong>, just unlock the badge <a href='#'><strong>I'm a Seller</strong></a>.<br />And you can also use relist listing when it's down to deadline.</small>");
});
$('#btn-cash').on('click', function(event) {
	third_row.html("<small><span class='gs-color-red'><strong>It's for real money</strong></span><br />Be careful, are you sure to sell this thing? You can be helpful to others.<br />If you really want to, this means you can take a bargain if you choose the <strong>I can take that</strong> radio.</small>");
});


