/* 관심상품 */
function like_func(){
  var frm_read = $('#frm_read');
  var p_no = $('#p_no', frm_read).val();
  //var m_id = $('# m_id', frm_read).val();
  //console.log("p_no, m_id : " + p_no +","+ m_id);
  
  $.ajax({
    url: "/js/product_heart",
    type: "GET",
    cache: false,
    dataType: "json",
    data: 'boardno=' +boardno,
    success: function(data) {
      var msg = '';
      var like_img = '';
      msg += data.msg;
      alert(msg);
      
      if(data.like_check == 0){
        like_img = "./images/wish.png";
      } else {
        like_img = "./images/wish_on.png";
      }      
      $('#like_img', frm_read).attr('src', like_img);
      $('#like_cnt').html(data.like_cnt);
      $('#like_check').html(data.like_check);
    },
    error: function(request, status, error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}

 