  var data = JSON.parse('<%= raw(sub_categories.to_json) %>');
  $('#bx_block_upload_art_upload_art1_category_id').on('change', function setValue() {
    cat_id = $('#bx_block_upload_art_upload_art1_category_id').val();
    let options = []
    data.map(function (val) {
      if (val.category_id == cat_id) {
        options.push({ text: val.name, value: val.id });
      }
    })
    $('#bx_block_upload_art_upload_art1_sub_category_id').replaceOptions(options);
  });
  $.fn.replaceOptions = function(options) {
    var self, $option;
    this.empty();
    self = this;
    $.each(options, function(index, option) {
      $option = $("<option></option>")
        .attr("value", option.value)
        .text(option.text);
      self.append($option);
    });
  };
