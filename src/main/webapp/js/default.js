$(function () {
  $(document).on("click", ".modal-open-btn", function () {
    $($(this).attr("target")).css("display", "flex");
  });
  $(document).on("click", ".modal-close", function () {
    $(this).parents(".modal-wrap").parent().css("display", "none");
  });  
  $(".sub-navi").prev().parent().hover(function(){
    $(".sub-navi").toggle();
  });
  // $(".login-sub-navi").prev().parent().hover(function(){
  //   $(".login-sub-navi").slideToggle(400);
  // });
});
function alertFunc(icon){
  const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 2500,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })

  Toast.fire({
    icon: icon,
    title: '정상적으로 실행되었습니다.'
    
  })
      //이후 페이지 이동 시 추가
      /*
      .then(function(){
    	 window.location = "${loc}"; 
      });
      */
    };