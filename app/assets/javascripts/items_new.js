$(document).on('turbolinks:load', function(){
  //共通の定数を定義==================================================================
  // imagePrevに.prev-contentを代入
  const imagePrev = $('.label-content').prev();

  //プレビューのhtmlを定義============================================================
  function buildHTML(id,image) {
    let html = `<div class="preview-box">
                  <div class="upper-box">
                    <img src=${image} alt="preview" width="100" height="100">
                  </div>
                  <div class="lower-box">
                    <div class="delete-box">
                      <div class="delete-btn" data-delete-id= ${id}>削除</div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  // 投稿編集時
  //items/:i/editページへリンクした際のアクション=======================================
  if (window.location.href.match(/\/items\/\d+\/edit/)){
    //登録済み画像のプレビュー表示欄の要素を取得する
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
    //プレビューにidを追加
    $('.preview-box').each(function(index, box){
      $(box).attr('id', `preview-box__${index}`);
    })
    //削除ボタンにidを追加
    $('.delete-box').each(function(index, box){
      $(box).attr('id', `delete_btn_${index}`);
    })
    var count = $('.preview-box').length;
    //プレビューが5あるときは、投稿ボックスを消しておく
    if (count == 5) {
      $('.label-content').hide();
    }
  }

  //ラベルのwidth・id・forの値を変更==================================================
  function setLabel(count) {
    //プレビューが5個あったらラベルを隠す
    if (count == 5) { 
      $('.label-content').hide();
    } else {
      //プレビューが4個以下の場合はラベルを表示
      $('.label-content').show();
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      labelWidth = (620 - parseInt($(imagePrev).css('width')));
      $('.label-content').css('width', labelWidth);
      //id・forの値を変更
      a = $('.label-box').attr({for: `item_images_attributes_${count}_image`});
    }
    
  }



  //プレビューの追加=================================================================
  $(document).on('change', '.hidden-field', function() {
    //hidden-fieldのidの数値のみ取得
    let id = $(this).attr('id').replace(/[^0-9]/g, '');
    //選択したfileのオブジェクトを取得
    let file = this.files[0];
    let reader = new FileReader();
    console.log(reader);
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      let image = this.result;
      //htmlを作成
      let html = buildHTML(id,image);
      //ラベルの直前のプレビュー群にプレビューを追加
      $(imagePrev).append(html);
      //プレビュー削除したフィールドにチェックボックスがあった場合、チェックを外す
      if ($(`#item_images_attributes_${id}__destroy`)){
        $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
      } 
      //プレビューの数を取得
      let count = $('.preview-box').length;
      //countに応じてラベルのwidth・id・forの値を変更
      setLabel(count);
    }
  });

  // 画像の削除=====================================================================
  $(document).on('click', '.delete-btn', function() {
    let id = $(this).attr('data-delete-id')
    //新規投稿時
    //削除用チェックボックスの有無で判定
    if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
      //フォームの中身を削除 
      $(`#item_images_attributes_${id}_image`).val("");
      var count = $('.preview-box').length;
      //5個めが消されたらラベルを表示
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});

      }
    } else {

      //投稿編集時
      $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
      //5個めが消されたらラベルを表示
      if (count == 4) {
        $('.label-content').show();
      }

      //ラベルのwidth操作
      setLabel();
      //ラベルのidとforの値を変更
      //削除したプレビューのidによって、ラベルのidを変更する
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      }
    }
  });
});