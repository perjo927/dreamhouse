// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= #require turbolinks
//= require_tree .


$(document).ready(function(){
    $('#login-trigger').click(function(){
        $("#signup-trigger").next("#signup-content").slideUp("fast");
        $(this).next('#login-content').slideToggle();
        $(this).toggleClass('active');


    })
    $('#signup-trigger').click(function(){
        $("#login-trigger").next("#login-content").slideUp("fast");
        $(this).next('#signup-content').slideToggle();
        $(this).toggleClass('active');

    })
    $("#submit").click(function(e){
        e.preventDefault();
        $.ajax({
            datatype:'json' ,
            data: $("#signup-form").serialize(),
            type:'POST',
            url:'/user/new',

            success: function(){
                $("#success").show();
                $("#error").hide();
                location.reload();
            },
            error: function(){
                $("#error").show();
                $("#success").hide();
            }
        });
    });
    $("#login").click(function(e){
        e.preventDefault();
        $.ajax({
            datatype:'json' ,
            data: $("#login-form").serialize(),
            type:'POST',
            url:'/user/login',

            success: function(){
                $("#success").show();
                $("#error").hide();
                location.href = "/";
            },
            error: function(){
                $("#error").show();
                $("#success").hide();
            }
        });
    });
    $("#send").click(function(e){
        e.preventDefault();
        $.ajax({
            datatype:'json' ,
            data: $("#message-form").serialize(),
            type:'POST',
            url:'/hantverkare/sendmessage',

            success: function(){
                $("#success").show();
                $("#error").hide();
                location.reload();
            },
            error: function(){
                $("#error").show();
                $("#success").hide();
            }
        });
    });

});