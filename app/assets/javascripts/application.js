// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


    var app = angular.module('myApp', []);
    app.controller('myController', function($scope) {
        $scope.num_person_mix = 0;
        $scope.num_glass_mix = 0;
        $scope.num_person = 0;
        $scope.num_glass = 0;
        $scope.total = 0;
    });


function indexModal(){
    $("#modal2").hide();
    // if ($.cookie('#modal2') == null) {
    //     $.cookie('#modal2', 'yes', { expires: 2, path: '/' });
    //     $('#modal2').reveal();
    // }
}


function imgclick(){
    $('li img').on('click',function(){
        var src = $(this).attr('src');
        var img = '<img src="' + src + '" class="img-responsive"/>';
        $('#myModal').modal();
        $('#myModal').on('shown.bs.modal', function(){
            $('#myModal .modal-body').html(img);
        });
        $('#myModal').on('hidden.bs.modal', function(){
            $('#myModal .modal-body').html('');
        });
   });
}

