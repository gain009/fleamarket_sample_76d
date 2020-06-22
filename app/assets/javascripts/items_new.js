$(document).on('turbolinks:load', function(){
  $(function(){

    function buildHTML(index) {
      var html = `<div class="preview-box" id="preview-box__${index}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="edit-box" id="edit-btn-${index}">
                        <div class="edit-btn">
                          <span>編集</span>
                        </div>
                      </div>
                      <div class="delete-box" id="delete_btn_${index}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    if (window.location.href.match(/\/items\/\d+\/edit/)){
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 5) {
        $('.label-content').hide();
      }
    }

    function setLabel() {
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    function deleteImage(index) {
      $(`#preview-box__${index}`).remove();
      if ($(`#item_images_attributes_${index}__destroy`).length == 0) {
        $(`#item_images_attributes_${index}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel();
        if(index < 5){
          $('.label-box').attr({index: `label-box--${index}`,for: `item_images_attributes_${index}_image`});
        }
      } else {
        $(`#item_images_attributes_${index}__destroy`).prop('checked',true);
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel();
        if(index < 5){
          $('.label-box').attr({id: `label-box--${index}`,for: `item_images_attributes_${index}_image`});
        }
      }
    }

    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var index = $(this).attr('id').replace(/[^0-9]/g, '');
      var file = this.files[0];
      if (file != undefined) {
        $('.label-box').attr({id: `label-box--${index}`,for: `item_images_attributes_${index}_image`});
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function() {
          var image = this.result;
          if ($(`#preview-box__${index}`).length == 0) {
            var count = $('.preview-box').length;
            var html = buildHTML(index);
            var prevContent = $('.label-content').prev();
            $(prevContent).append(html);
          }
          $(`#preview-box__${index} img`).attr('src', `${image}`);
          var count = $('.preview-box').length;
          if (count == 5) {
            $('.label-content').hide();
          }
          if ($(`#item_images_attributes_${index}__destroy`)){
            $(`#item_images_attributes_${index}__destroy`).prop('checked',false);
          } 
          setLabel();
          if(count < 5){
            $('.label-box').attr({index: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
          }
        }
      }
      else {
        deleteImage(index);
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      setLabel();
      var index = $(this).attr('id').replace(/[^0-9]/g, '');
      deleteImage(index);
    });

    });
  });
});