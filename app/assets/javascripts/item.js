$(function () {

// 商品削除ポップアップ機能
  var deleteBtn = $(".delete-button");
  var deletePopUp = $("#delete-popup");
  // ポップアップを開く
  $("#open-popup").click(function(e) {
    deletePopUp.fadeIn(300);
  });
  // ポップアップを閉じる
  $(".cancel-button").click(function(e) {
    deletePopUp.fadeOut(300);
  });
  // 削除確定
  deleteBtn.on("click", function(e) {
    var url = $("#delete-link").attr("href");
    $.ajax({
      url: url,
      type: "DELETE"
    })
    .done(function() {
      deletePopUp.fadeOut(300);
    })
    .fail(function() {
      alert("通信に失敗しました");
    });
  });

});