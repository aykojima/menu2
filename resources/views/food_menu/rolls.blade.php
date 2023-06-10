@extends('layouts.header')

@section('title', 'Rolls')


@section('content')
<div class="commands">
    <span id="new_item">
        <img class="add_new_icons" src="images/add_icon_active.png">
    </span>
    <!-- <span class="change_order">Change Order</span>
    <div class="change_order_dropdown">
    <span class="save_order">Save</span>
    <span class="discard">Discard</span>
    </div> -->
    <span class="edit">
        <img class="edit_icons" src="images/edit_icon_active.png">
    </span>
    
    <div class="edit_list">
        @foreach($rolls as $roll)
        <span class="edit_item" data-id="{{ $roll->roll_id }}">
            {{ $roll->name }}
        </span>
        @endforeach
    </div>
</div>
<div id='add_new_modal' class='modal'>
    <div class='modal_content'>
        <!-- <button id='close_add_new_tab' onclick='hide_add_new_div()'>X</button> -->
        <span class="close">&times;</span>
        {!! Form::open(['route' => 'roll_add_new']) !!}
        @include('layouts.forms.form')
        {!! Form::close() !!}
    </div>
 </div>

 <div id='edit_modal' class='modal'>
    <div class='modal_content'>
        <!-- <button id='close_edit_tab' onclick='hide_edit_div()'>X</button> -->
        <span class="close">&times;</span>
        {!! Form::open(['route' => 'roll_edit_submit']) !!}
        {!! Form::hidden('roll_id') !!}
        @include('layouts.forms.form')
        {!! Form::close() !!}
    </div>    
 </div>
    
<div id="container">
    <p class="notes">
        <img id="fish-vertical" src='images/fish.png' alt='fish' style=width:15px;> 
        *raw or undercooked meats, poultry, seafodd, shellfish, oyster or eggs 
        may increase your risk of foodborne illness
    </p>
    <div id="menu">
        <div id='show_result_rolls'>
            <h1 class='rolls'>Special Rolls</h1>
            <div id="">
                <ul>
                <?php 
                    foreach ($SP_Rs as $SP_R)
                    {
                        echo $SP_R;
                    }
                ?>
                </ul>
            </div>
            <h1 class='rolls'>Rolls</h1>
            <div id="">
                <ul>
                <?php 
                    foreach ($Rs as $R)
                    {
                        echo $R;
                    }
                ?>
                </ul>
            </div>
            <h1 class='rolls'>Vegetable Rolls</h1>
            <div id="">
                <ul>
                <?php 
                    foreach ($VG_Rs as $VG_R)
                    {
                        echo $VG_R;
                    }
                ?>
                </ul>
            </div>
        </div>
    </div>
</div>  
<div class='right_div'>
    <div class='num_items'>
        Currently <b style='color: #000;'>{{ $num_items }} </b> items on the menu
    </div>
</div>

<div id="update" style="display: none;">
  <span class="dismiss"><a title="dismiss this notification">x</a></span>
</div>

@if(session('status'))
<div id="notification" style="display: none;">
  <span class="dismiss"><a title="dismiss this notification">x</a></span>
  <br>
  {{ session('status')}}
  <br>
  <br>
  <hr>
</div>
@endif


<script type="text/javascript">
// Notification box
$("#notification").fadeIn("slow");
$(".dismiss").click(function(){
       $("#notification").fadeOut("slow");
});

$(document).on("click", ".edit", function(){
    $(".edit_list").slideToggle();
})

$(document).on("click", ".change_order", function(){
    $(".change_order_dropdown").slideToggle();
})
// var search_box = $('.search-box input[type="text"]');

// $(document).ready(function(){
//     var categories = ['appetizer', 'tempura', 'fish_dish', 'meat_dish'];
//     categories.forEach(function(el){
//         if($("#" + el).val(''))
//         {
//             $("#" + el).html("<span style='font-style:italic; color:#cccccc;';>" + el + " section -Go to search and add items</span>")
//         }
//     });
// });

$(document).ready(add_fish());

// search_box.on('keyup',function(){
//     var value=$(this).val();
//         $.ajax({
//             type : 'get',
//             url : '{{URL::to('roll/search')}}',
//             data:{'search':value},
//             success:function(data){
//                 $('.result').html(data);
//             }
//         });
// })

// $(document).on("click", ".result p", function(event){
//     $.ajax({
//         type:'get',
//         url: '{{URL::to('roll/update')}}',
//         data: {'item_id': $(this).data('id')},
//         success:function(data){     
//             var string_sp = '', string_r = '', string_vg = '';
//             data.forEach(function(el, index){
//                 el.forEach(function(el2){
//                     if(index == 0)
//                     {
//                         string_sp += el2;
//                     }else if(index == 1)
//                     {
//                         string_r += el2;
//                     }else if(index == 2)
//                     {
//                         string_vg += el2;
//                     }
//                 });
//             });
//             $( "#special_rolls" ).html( "<ul id='sortable_sp' class='ui-sortable'>" + string_sp + "</ul>");
//             $( "#rolls" ).html( "<ul id='sortable_r' class='ui-sortable'>" + string_r + "</ul>" );
//             $( "#vegetable_rolls" ).html( "<ul id='sortable_vg' class='ui-sortable'>" + string_vg + "</ul>" );
            
//             add_fish();
//         }
//     });
//     if(event.target.className == 'is_on_menu')
//     {
//         $(this).css("color", "#ccc");
//         $(this).toggleClass('is_on_menu is_on_menu_not');
//     }else if(event.target.className == 'is_on_menu_not')
//     {
//         $(this).css("color", "#000");
//         $(this).toggleClass('is_on_menu_not is_on_menu');
//     }else
//     {
//         $(this).css("color", "#ccc");   
//     }  
// });

// $(document).on("click", "#clear_search", function(){
//     $('input[type="text"]').val('');
//     $('.result').html('');
// });

// $(document).on("click", "#container", function(event){
//     $('input[type="text"]').val('');
//     $('.result').html('');
// });



// Add New Modal

$(document).on("click", "#new_item", function(){   
    $('#add_new_modal').css('display', 'block');
    // var init_name = search_box.val();      
    // if(init_name !=null)
    // {
    //     $("#add_new_modal .modal_content form input[name='name']").val(init_name);
    // }
});

$(document).on("click", ".close", function(){
    $('#add_new_modal').css('display', 'none');
    $('#edit_modal').css('display', 'none');
});

$(window).click(function(event) {
    if (event.target == $('#add_new_modal')[0]) {
        $('#add_new_modal').css('display', 'none');
    }else if (event.target == $('#edit_modal')[0]) {
        $('#edit_modal').css('display', 'none');
    }
});

//Edit Modal
$(document).on("click", ".edit_item", function(event){   
    $('#edit_modal').css('display', 'block');
    console.log($(this).data('id'));
    $.ajax({
        type : 'get',
        url : '{{URL::to('roll/edit')}}',
        data:{'roll_id':$(this).data('id')},
        success:function(data){
            console.log(data);
                $("#edit_modal .modal_content input[name='roll_id']").val(data.roll_id),
                $("#edit_modal .modal_content input[name='name']").val(data.name),
                $("#edit_modal .modal_content input[name='price']").val(data.price),
                $("#edit_modal .modal_content input[name='description']").val(data.description),
                $("#edit_modal .modal_content input[name='category']").val(data.category),
                data.is_sustainable == 'Y' ? $("#edit_modal .modal_content input[name='is_sustainable']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_sustainable']").prop('checked', false),
                data.is_gf == 'Y' ? $("#edit_modal .modal_content input[name='is_gf']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_gf']").prop('checked', false),
                data.is_raw == 'Y' ? $("#edit_modal .modal_content input[name='is_raw']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_raw']").prop('checked', false),
                data.is_special == 'Y' ? $("#edit_modal .modal_content input[name='is_special']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_special']").prop('checked', false),
                data.is_on_menu == 'Y' ? $("#edit_modal .modal_content input[name='is_on_menu']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_on_menu']").prop('checked', false)
             }
         });
    });

$('#edit_modal .modal_content').on('click', 'input[type=submit]', function() {
    //var form_data = $('#edit_form').serialize();
        $.ajax({
        type: 'patch',
        url : '{{URL::to('edit_submit')}}',
        data: {'roll_id': $('#edit_form input[name=roll_id]').val(),
                'name': $('#edit_form input[name=name]').val(),
                'price': $('#edit_form input[name=price]').val(),
                'description': $('#edit_form input[name=description]').val(),
                'category': $('#edit_form input[name=category]').val(),
                'is_sustainable': $('#edit_form input[name=is_sustainable]').val(),
                'is_gf': $('#edit_form input[name=is_gf]').val(),
                'is_raw': $('#edit_form input[name=is_raw]').val(),
                'is_special': $('#edit_form input[name=is_special]').val(),
                'is_on_menu': $('#edit_form input[name=is_on_menu]').val()
        },
        success: function(data) {
            console.log(data);
            
        }
    });
});

function add_fish(){
        $("div[data-sust='sustainable']").append('<img class="fish" src="{{ asset('images/fish.png') }}" style="width:15px;"/>');
    }


</script>
<script type="text/javascript">
 
 $.ajaxSetup({ headers: { 'csrftoken' : '{{ csrf_token() }}' } });

</script>

@endsection
