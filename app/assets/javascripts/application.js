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
        $(this).next('#login-content').slideToggle();
        $(this).toggleClass('active');

        if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
        else $(this).find('span').html('&#x25BC;')
    })
    $('#signup-trigger').click(function(){
        $(this).next('#signup-content').slideToggle();
        $(this).toggleClass('active');

        if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
        else $(this).find('span').html('&#x25BC;')
    })
    $("#submit").click(function(e){
        e.preventDefault();
        $.ajax({
            datatype:'json' ,
            data: $("#signup-form").serialize(),
            type:'POST',
            url:'user/new',

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
            url:'user/login',

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
})