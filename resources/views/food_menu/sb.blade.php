@extends('layouts.header')

@section('title', 'Sushi Bar')

@section('content')
<div class="search-box">
    <input type="text" autocomplete="off" placeholder="Search..." />
    <button id="clear_search">&times;</button> 
    <!-- @if(Request::ajax())
        <p>Ajax request</p>
    @endif -->
    <div class="result">    
        <!-- this is where results show up -->
    </div>       
</div>

<div id='add_new_modal' class='modal'>
    <div class='modal_content'>
        <!-- <button id='close_add_new_tab' onclick='hide_add_new_div()'>X</button> -->
        <span class="close">&times;</span>
        {!! Form::open(['route' => 'add_new']) !!}
        @include('layouts.forms.form')
        {!! Form::close() !!}
    </div>
 </div>

 <div id='edit_modal' class='modal'>
    <div class='modal_content'>
        <!-- <button id='close_edit_tab' onclick='hide_edit_div()'>X</button> -->
        <span class="close">&times;</span>
        {!! Form::open(['route' => 'edit_submit']) !!}
        {!! Form::hidden('sb_id') !!}
        @include('layouts.forms.form')
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

        <h1 id="sushiBar">Sushi Bar</h1>
        <p class="verticalSashimi">Sashimi</p>
        <p class="verticalSushi">Nigiri<br>Sushi</p>
        <table id="showResult" class="style">
            <?php 
                foreach ($outputs as $output)
                {
                    echo $output;
                }

            ?>
        </table>

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


    $(document).ready(style_prices());
    $(document).ready(style_line_height());
    $(document).ready(add_fish());
    $(document).ready(style_length());
    
    var search_box = $('.search-box input[type="text"]');

    // function show_edit_div(sb_id){
    //     $("#edit_div").show('slow');
    //     console.log(sb_id);
    //     $('#sb_id').val(sb_id);
    // }

    search_box.on('keyup',function(){
        var value=$(this).val();
            $.ajax({
                type : 'get',
                url : '{{URL::to('sb/search')}}',
                data:{'search':value},
                success:function(data){
                    $('.result').html(data);
                }
            });
    })

    $(document).on("click", ".result p", function(event){
        if($(this).data('id') != null){    
            $.ajax({
                type:'get',
                url: '{{URL::to('sb/update')}}',
                data: {'item_id': $(this).data('id')},
                success:function(data){     
                    var string_data = JSON.stringify(data);
                    $( "#showResult" ).html( string_data );
                    style_line_height();
                    style_prices();
                    add_fish();
                    style_length();
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
                $("#update").fadeIn("slow").append('<br><strong style="color:#FFE4B5;">Added: </strong> ' + $(this).text() + '<br><br><hr>');
                $(".dismiss").click(function(){
                    $("#update").fadeOut("slow").html('<span class="dismiss"><a title="dismiss this notification">x</a></span>');
                });
            }else
            {
                $(this).css("color", "#ccc");   
            }  
        }//end of the first if
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
            $("#add_new_modal .modal_content form input[name='eng_name']").val(init_name);
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
            url : '{{URL::to('sb/edit')}}',
            data:{'sb_id':$(this).data('id')},
            success:function(data){
                console.log(data);
                    $("#edit_modal .modal_content input[name='sb_id']").val(data.sb_id),
                    $("#edit_modal .modal_content input[name='eng_name']").val(data.eng_name),
                    $("#edit_modal .modal_content input[name='jpn_name']").val(data.jpn_name),
                    $("#edit_modal .modal_content input[name='origin']").val(data.origin),
                    $("#edit_modal .modal_content input[name='nigiri_price']").val(data.nigiri_price),
                    $("#edit_modal .modal_content input[name='sashimi_price']").val(data.sashimi_price),
                    data.is_sustainable == 'Y' ? $("#edit_modal .modal_content input[name='is_sustainable']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_sustainable']").prop('checked', false),
                    data.is_raw == 'Y' ? $("#edit_modal .modal_content input[name='is_raw']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_raw']").prop('checked', false),
                    data.is_special == 'Y' ? $("#edit_modal .modal_content input[name='is_special']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_special']").prop('checked', false),
                    data.is_on_menu == 'Y' ? $("#edit_modal .modal_content input[name='is_on_menu']").prop('checked', true) : $("#edit_modal .modal_content input[name='is_on_menu']").prop('checked', false)
                 }
             });
        });

    $('#edit_modal .modal_content').on('click', 'input[type=submit]', function() {
        //var form_data = $('#edit_form').serialize();
            $.ajax({
            type: 'post',
            url : '{{URL::to('sb/edit')}}',
            data: {'sb_id': $('#edit_form input[name=sb_id]').val(),
                    'eng_name': $('#edit_form input[name=eng_name]').val(),
                    'jpn_name': $('#edit_form input[name=jpn_name]').val(),
                    'origin': $('#edit_form input[name=origin]').val(),
                    'nigiri_price': $('#edit_form input[name=nigiri_price]').val(),
                    'sashimi_price': $('#edit_form input[name=sashimi_price]').val(),
                    'is_sustainable': $('#edit_form input[name=is_sustainable]').val(),
                    'is_raw': $('#edit_form input[name=is_raw]').val(),
                    'is_special': $('#edit_form input[name=is_special]').val(),
                    'is_on_menu': $('#edit_form input[name=is_on_menu]').val()
            }
        });
});

    function add_fish(){
        $('.sustainable_y').append('<img class="fish" src="{{ asset('images/fish.png') }}" style="width:15px;"/>');
    }


    function style_prices(){
        var arr =[];
        i =0;
        $('.price').each(function(){
            var price = $(this).text();
            Math.round(price) == price ? $(this).text(parseInt(price)) : price;
            i++;
        });
    }

    function calc_sashimi_price(){
        var n_price = $('#n_price').val();
        var s_price = 0;
        if(n_price == ""){
            $('#s_price').val('');
        }else if(isNaN(s_price) === false){           
            s_price = n_price * 2;  
            $('#s_price').val(s_price);
        }
    }

    //Change the font size of origin, so that the item fit in a single row
    // $(document).ready(function(){
    //     $("tr").map(function(){
    //         var name_length = $(this).children(".name").text().length;
    //         var origin_length = $(this).children(".origin").text().length;
    //         if(name_length + origin_length > 40)
    //         // {console.log($(this).children(".name").text() + $(this).children(".origin").text())}
    //         { $(this).children(".origin").addClass("origin_small"); }
    //     });
    // })

    function style_length(){
        $("tr").map(function(){
            var name_length = $(this).children(".name").text().length;
            var origin_length = $(this).children(".origin").text().length;
            if(name_length + origin_length > 40)
            // {console.log($(this).children(".name").text() + $(this).children(".origin").text())}
            { $(this).children(".origin").addClass("origin_small"); }
        });
    }
    function style_line_height(){
    var length = $('#showResult tr').length;
    var current_class = $('#showResult').attr('class');
        
    if(length >= 32 && length<=34)
    {//this can hold up to 36 items
        $("#showResult").removeClass(current_class).addClass("lineHeight34");
    }else if(length >= 35 && length<=36)
    {//this can hold up to 38 items    
        $("#showResult").removeClass(current_class).addClass("lineHeight37");
    }else if(length >= 37 && length<=39)
    {//this can hold up to 41 items       
        $("#showResult").removeClass(current_class).addClass("lineHeight39");
    }else if(length >= 40 && length<=42)
    {//this can hold up to 44 items    
        $("#showResult").removeClass(current_class).addClass("lineHeight42");
    }else if(length >= 43)
    {//more than 45 items    
        $("#showResult").removeClass(current_class).addClass("lineHeight45");
    }
}
</script>
 
<script type="text/javascript">
 
    $.ajaxSetup({ headers: { 'csrftoken' : '{{ csrf_token() }}' } });
 
</script>

<script src='{{ asset('js/dates.js') }}'type="text/javascript"></script>
<!-- </div> -->
 <?php 
    // if(THIS_PAGE == "sushi.php" || THIS_PAGE == "ippin.php"){
    //     echo"<script src='../js/dates.js'></script>";
    //     echo"<script src='../js/edit_" . $file . ".js'></script>";
        // echo"<script src='../js/add_" . $file . ".js'></script>";}?> 


@endsection

