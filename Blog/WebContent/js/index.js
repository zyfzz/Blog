$(document).ready(function() {

    //退出
    $("#loginOut").click(function(){
        $.get("http://localhost:8080/BLOG/loginOut.action",{},function(response){
            if(response.result == "true"){
                window.location.href = "http://localhost:8080/BLOG/index.jsp";
            }
        })
    })
    
    //导航栏
    $("#rank-content").hide();
    $("#rank").click(function(){
      $("#scrollBar").hide();
      $("#page-content").hide();
      $("#rank-content").show();
    })
    
    //分类
//  $(".category").click(function(){
//     $("#box-content").empty(); 
//  })
//     
    //日历
    $('.form_datetime').datetimepicker({
        //language: 'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        language: 'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language: 'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });

})