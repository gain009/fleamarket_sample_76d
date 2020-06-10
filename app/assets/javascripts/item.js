$(function () {

// 商品削除ポップアップ機能
  var deleteBtn = $(".delete-button");
  var deletePopUp = $("#delete-popup");
  // ポップアップを開く
  $("#open-popup").click(function(e) {
    deletePopUp.fadeIn(300);
  });

});