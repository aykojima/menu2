@extends('layouts.header')


@section('title', 'Ippins')

@section('content')
<div class="search-box">
    <input type="text" autocomplete="off" placeholder="Search..." />
    <button id="clear_search">&times;</button> 
    <div class="result">    
        <!-- this is where results show up -->
    </div>       
</div>

<div id='add_new_modal' class='modal'>
    <div class='modal_content'>
        <!-- <button id='close_add_new_tab' onclick='hide_add_new_div()'>X</button> -->
        <span class="close">&times;</span>
        {!! Form::open(['route' => 'ippin_add_new']) !!}
        @include('layouts.forms.form')
        {!! Form::close() !!}
    </div>
 </div>

 <div id='edit_modal' class='modal'>
    <div class='modal_content'>
        <!-- <button id='close_edit_tab' onclick='hide_edit_div()'>X</button> -->
        <span class="close">&times;</span>
        {!! Form::open(['route' => 'ippin_edit_submit']) !!}
        {!! Form::hidden('ippin_id') !!}
        @include('layouts.forms.form')
        {!! Form::button('Delete', array('id' => 'delete')) !!}
            <!-- <a href="{{action('ippin_controller@delete', 'ippin_id')}}">Delete</a> -->
        {!! Form::close() !!}
    </div>    
 </div>

<div id="container">
<p class="notes"><img id="fish-vertical" src="{{ asset('images/fish.png') }}" alt='fish' style=width:15px;>
    sustainable "best" or "good alternative" seafood</p>
    <div id="menu">
        <h2 id="dates"></h2>
        <div class="date">
            <input type="button" id="left" value=" < " onclick="changeDate('left')"/>
        </div>
        <div class="date">
            <input type="button" id="right" value=" > " onclick="changeDate('right')"/> 
        </div>
    
        <h1 class="page_title">Ippins</h1>
        <div id='show_result_ippin'>
            <div id="appetizer">
            <ul>
                <?php 
                    foreach ($APs as $AP)
                    {
                        echo $AP;
                    }
                ?>
            </ul>
            </div>
            <div id="tempura">
                <ul>
                    <?php 
                        foreach ($TMs as $TM)
                        {
                            echo $TM;
                        }
                    ?>
                </ul>    
            </div>
            <div id="fish_dish">
                <ul>
                    <?php 
                        foreach ($FSs as $FS)
                        {
                            echo $FS;
                        }
                    ?>
                </ul>
            </div>
            <div id="meat_dish">
                <ul>
                    <?php 
                        foreach ($MTs as $MT)
                        {
                            echo $MT;
                        }
                    ?>
                </ul>
            </div>
        </div>
        <div class="gratuity">
            <p id='raw'>*raw or undercooked meats, poultry, seafood, shellfish, oyster or eggs 
                may increase your risk of foodborne illness
            </p>
            <p>Thank you for dining with us! A 20% living wage charge is included (dine in only). 
            The house retains 100% of these charges to help fund higher wages and benefits to all staff. 
            Additional gratuity is not expected.
            </p>
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



function styleMenu(new_class, index){
    var height = $("#menu").outerHeight();
    if(height >= 1100){
        if(new_class == "margin_7px"){
            $("#show_result_ippin").find(".items").removeClass("margin_9px");
            $("#show_result_ippin").find(".gf").removeClass("margin_9px");
        }else if(new_class == "line_height_08em"){
            $("#show_result_ippin").find(".items").removeClass("line_height_1em"); 
            $("#show_result_ippin").find(".gf").removeClass("line_height_1em");  
        }else if(new_class == "line_height_06em"){
            $("#show_result_ippin").find(".items").removeClass("line_height_08em");   
            $("#show_result_ippin").find(".gf").removeClass("line_height_08em");
        }
        $("#show_result_ippin").find(".items").addClass(new_class);
        $("#show_result_ippin").find(".items").addClass(new_class);
        $("#show_result_ippin").find(".gf").addClass(new_class);
        height = $("#show_result_ippin").outerHeight();
        console.log(index + ": " + height);
        //styleMenu();
    }
}

var new_class = [ "margin_9px", "margin_7px", "line_height_1em", "line_height_08em", "line_height_06em", "font_size09em" ];

$(document).ready(function(){
    console.log($("#menu").outerHeight());
    $.each(new_class, function( index, value ) {
        styleMenu(value, index);
    }); 
});



var search_box = $('.search-box input[type="text"]');

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

search_box.on('keyup',function(){
    var value=$(this).val();
        $.ajax({
            type : 'get',
            url : '{{URL::to('ippin/search')}}',
            data:{'search':value},
            success:function(data){
                $('.result').html(data);
            }
        });
})

$(document).on("click", ".result p", function(event){
    $.ajax({
        type:'get',
        url: '{{URL::to('ippin/update')}}',
        data: {'item_id': $(this).data('id')},
        success:function(data){     
            console.log(data);
            var string_ap = '', string_tm = '', string_fs = '', string_mt = '';
            data.forEach(function(el, index){
                el.forEach(function(el2){
                    if(index == 0)
                    {
                        string_ap += el2;
                    }else if(index == 1)
                    {
                        string_tm += el2;
                    }else if(index == 2)
                    {
                        string_fs += el2;
                    }else if(index == 3)
                    {
                        string_mt += el2;
                    }
                });
            });
            $( "#appetizer" ).html( "<ul>" + string_ap + "</ul>");
            $( "#tempura" ).html( "<ul>" + string_tm + "</ul>" );
            $( "#fish_dish" ).html( "<ul>" + string_fs + "</ul>" );
            $( "#meat_dish" ).html( "<ul>" + string_mt + "</ul>" );
            add_fish();
            console.log($("#show_result_ippin").outerHeight());
            $.each(new_class, function( index, value ) {
                styleMenu(value, index);
            });
        }
    });
    if(event.target.className == 'is_on_menu')
    {
        $(this).css("color", "#ccc");
        $(this).toggleClass('is_on_menu is_on_menu_not');
        $("#update").fadeIn("slow").append('<br><strong style="color:#CCCCCC;">Removed: </strong> ' + $(this).text() + '<br><br><hr>');
        $(".dismiss").click(function(){
            $("#update").fadeOut("slow").html('<span class="dismiss"><a title="dismiss this notification">x</a></span>');
        });
    }else if(event.target.className == 'is_on_menu_not')
    {
        $(this).css("color", "#000");
        $(this).toggleClass('is_on_menu_not is_on_menu');
        $("#update").fadeIn("slow").append('<br><strong style="color:#FFE4B5;">Added: </strong>' + $(this).text() + '<br><br><hr>');
        $(".dismiss").click(function(){
            $("#update").fadeOut("slow").html('<span class="dismiss"><a title="dismiss this notification">x</a></span>');
        });
    }else
    {
        $(this).css("color", "#ccc");   
    }  
});

$(document).on("click", "#clear_search", function(){
    $('input[type="text"]').val('');
    $('.result').html('');
});

$(document).on("click", "#container", function(event){
    $('input[type="text"]').val('');
    $('.result').html('');
});



// Add New Modal

$(document).on("click", "#new_item", function(){   
    $('#add_new_modal').css('display', 'block');
    var init_name = search_box.val();      
    if(init_name !=null)
    {
        $("#add_new_modal .modal_content form input[name='name']").val(init_name);
    }
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
$(document).on("click", ".edit", function(event){   
    $('#edit_modal').css('display', 'block');
    
    $.ajax({
        type : 'get',
        url : '{{URL::to('ippin/edit')}}',
        data:{'ippin_id':$(this).data('id')},
        success:function(data){
            console.log(data);
                $("#edit_modal .modal_content input[name='ippin_id']").val(data.ippin_id),
                $("#edit_modal .modal_content input[name='name']").val(data.name),
                $("#edit_modal .modal_content input[name='price']").val(data.price),
                $("#edit_modal .modal_content select[name='category']").val(data.category),
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
        url : '{{URL::to('ippin/edit')}}',
        data: {'ippin_id': $('#edit_form input[name=ippin_id]').val(),
                'name': $('#edit_form input[name=name]').val(),
                'price': $('#edit_form input[name=price]').val(),
                'category': $('#edit_form input[name=category]').val(),
                'is_sustainable': $('#edit_form input[name=is_sustainable]').val(),
                'is_gf': $('#edit_form input[name=is_gf]').val(),
                'is_raw': $('#edit_form input[name=is_raw]').val(),
                'is_special': $('#edit_form input[name=is_special]').val(),
                'is_on_menu': $('#edit_form input[name=is_on_menu]').val()
        }
    });
});

// $('#edit_modal .modal_content').on('click', '#delete', function() {
//         $.ajax({
//         headers: {
//             'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
//         },
//         type: 'post',
//         url : '{{URL::to('ippin/delete')}}',
//         data: {'ippin_id': $('#edit_form input[name=ippin_id]').val()}
//     });
// });


function add_fish(){
        $("div[data-sust='sustainable']").append('<img class="fish" src="{{ asset('images/fish.png') }}" style="width:15px;"/>');
    }


</script>
<script type="text/javascript">
 
 $.ajaxSetup({ headers: { 'csrftoken' : '{{ csrf_token() }}' } });

</script>

<script src='{{ asset('js/dates.js') }}'type="text/javascript"></script>
@endsection


