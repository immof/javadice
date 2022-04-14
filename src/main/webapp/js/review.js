$(function() {
    var count = 0;
    $('.upload-img').on('change', function(evt) {
      var file = evt.target.files[0];
      var _this = evt.target;
      $(this).parent('.upload-section').hide();
      var reader = new FileReader();
      reader.onload = function(e) {
        var span = '<img class="thumb mrm mts" src="' + e.target.result + '" title="' + escape(file.name) + '"/><span class="remove_img_preview"></span>';
        $(_this).parent('.upload-section').next().append($(span));
      };
      reader.readAsDataURL(file);
      evt.target.value = "";
    });
  
    $('.preview-section').on('click', '.remove_img_preview', function() {
      $(this).parent('.preview-section').prev().show();
      $(this).parent('.preview-section').remove();
    });
  });