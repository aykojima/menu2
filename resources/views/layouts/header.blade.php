<!DOCTYPE html>
<html data-whatinput="keyboard" data-whatintent="keyboard" class=" whatinput-types-initial whatinput-types-keyboard">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_token" content="{{ csrf_token() }}">
    <title>SKT menu - @yield('title')</title>


    <link rel="stylesheet" href="{{ asset('css/app.css') }}" type="text/css" media="screen">
    @if(Request::is('drinks/cocktail') || Request::is('drinks/special'))
        <link rel="stylesheet" href="{{ asset('css/app_drink_print_4.25in.css') }}" type="text/css" media="print">
    @elseif(Request::is('drinks/sake') || Request::is('drinks/wine') || Request::is('drinks/shochu'))
        <link rel="stylesheet" href="{{ asset('css/app_drink_print.css') }}" type="text/css" media="print">
    @else
        <link rel="stylesheet" href="{{ asset('css/app_print.css') }}" type="text/css" media="print">
    @endif
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
    <!-- <link rel="icon" type="image/x-icon" href="favicon.ico" /> -->
    <link rel="icon" type="image/x-icon" href="{{ asset('images/favicon.ico') }}" />

</head>
<body>
    <header>
        <ul id="header">
            <li class="icon"><a href="javascript:void(0)">&#9776;</a></li>
            @if(Request::is('sb') || Request::is('ippin') || Request::is('course') || Request::is('roll') || Request::is('lunch'))
                <li><a href='{{URL::to('/drinks/print')}}'><img class="home_icons header_icons" src="images/arrow.png"></a><span>Go to Drink Menu</span></li>   
                <li id="print"><a href="javascript: window.print()"><img class="header_icons" src="images/printer.png"></a><span>Print</span></li>
                <!-- <li id="print"><a href="javascript: setTimeout(function(){window.print();},3000)"><img class="header_icons" src="images/printer.png"></a><span>Print</span></li> -->
            @else
                <li><a href='{{ URL::to('sb')}}'><img class="home_icons header_icons" src="../images/arrow.png"></a><span>Go to Sushi Bar</span></li>   
                @if(Request::is('drinks/cocktail') || Request::is('drinks/special'))
                    <li id="print"><a href="javascript: window.print()"><img class="header_icons" src="../images/printer.png"></a><span>Print</span></li>
                @else
                    <li id="print"><a href='{{ URL::to('/drinks/print')}}' target="_blank"><img class="header_icons" src="../images/printer.png"></a><span>Print Preview</span></li>
                @endif
            @endif
            <li class="nav-item dropdown">
                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#">
                    <!-- Auth::user()->name -->
                    <!-- <span class="caret"></span> -->
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                        Logout
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </div>
            </li>
            
        </ul>
    </header> 

    <div class="nav" id="nav">
        <ul>
        @if(Request::is('sb') || Request::is('ippin') || Request::is('course') || Request::is('roll') || Request::is('lunch'))    
            <li><a href='{{ URL::to('sb')}}' class='nav_links'>
                <img src='{{ Request::is('sb') ? 'images/sushi_icon_active.png' : 'images/sushi_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                <p class="{{ Request::is('sb') ? 'nav_active' : 'nav_name' }}">Sushi Bar</p>
                </a>
            </li>     
            <li><a href='{{ URL::to('ippin')}}' class='nav_links'>
            <img src='{{ Request::is('ippin') ? 'images/ippin_icon_active.png' : 'images/ippin_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                <p class="{{ Request::is('ippin') == 'ippin' ? 'nav_active' : 'nav_name' }}">Ippin</p>
                </a>
            </li>
            <li><a href='{{ URL::to('roll')}}' class='nav_links'>
            <img src='{{ Request::is('roll') ? 'images/rolls_icon_active.png' : 'images/rolls_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                <p class="{{ Request::is('roll') == 'roll' ? 'nav_active' : 'nav_name' }}">Roll</p>
                </a>
            </li>
            <li><a href='{{ URL::to('course')}}' class='nav_links'>
            <img src='{{ Request::is('course') ? 'images/course_icon_active.png' : 'images/course_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                <p class="{{ Request::is('course') == 'course' ? 'nav_active' : 'nav_name' }}">Course</p>
                </a>
            </li>
            <li><a href='{{ URL::to('lunch')}}' class='nav_links'>
            <img src='{{ Request::is('lunch') ? 'images/lunch_icon_active.png' : 'images/lunch_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                <p class="{{ Request::is('lunch') == 'lunch' ? 'nav_active' : 'nav_name' }}">Lunch</p>
                </a>
            </li>
        </ul>
    </div>
        @else
            <li>
                <a href='{{ URL::to('drinks/cocktail')}}' class='nav_links'>
                    <img src='{{ Request::is('drinks/cocktail') ? '../images/cocktail_icon_active.png' : '../images/cocktail_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                    <p class="{{ Request::is('drinks/cocktail') == 'cocktail' ? 'nav_active' : 'nav_name' }} line_height_08">Cocktail<br>Beer<br>Non-Alcoholic</p>
                </a>
            </li>
            <li>
                <a href='{{ URL::to('drinks/sake')}}' class='nav_links'>
                    <img src='{{ Request::is('drinks/sake') ? '../images/sake_icon.png' : '../images/sake_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                    <p class="{{ Request::is('drinks/sake') ? 'nav_active' : 'nav_name' }}">Sake</p>
                </a>
                @if(Request::is('drinks/sake'))
                <ul>
                     <li><a href='#sake_by_glass'>Sake by the Glass</a></li>
                     <li><a href='#sake_bottles'>Sake Bottles</a></li>
                </ul>
                @endif
            </li>     
            <li>
                <a href='{{ URL::to('drinks/wine')}}' class='nav_links'>
                    <img src='{{ Request::is('drinks/wine') ? '../images/wine_icon_active.png' : '../images/wine_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                    <p class="{{ Request::is('drinks/wine') == 'wine' ? 'nav_active' : 'nav_name' }}">Wine</p>
                </a>
                @if(Request::is('drinks/wine'))
                <ul>
                     <li><a href='#wine_by_glass'>Wine by the Glass</a></li>
                     <li><a href='#wine_bottles'>Wine Bottles</a></li>
                </ul>
                @endif
            </li>
            <li>
                <a href='{{ URL::to('drinks/shochu')}}' class='nav_links'>
                    <img src='{{ Request::is('drinks/shochu') ? '../images/shochu_icon_active.png' : '../images/shochu_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                    <p class="{{ Request::is('drinks/shochu') == 'shochu' ? 'nav_active' : 'nav_name' }} line_height_08">Shochu<br> Whiskey<br>Spirits</p>
                </a>
                @if(Request::is('drinks/shochu'))
                <ul>
                     <li><a href='#shochu'>Shochu</a></li>
                     <li><a href='#whisky'>Whisky</a></li>
                     <li><a href='#spirits'>Spirits</a></li>
                </ul>
                @endif
            </li>
            <li>
                <a href='{{ URL::to('drinks/special')}}' class='nav_links'>
                    <img src='{{ Request::is('drinks/special') ? '../images/special_icon_active.png' : '../images/special_icon_no_active.png' }} '.png'}}' class='nav_icons'>
                    <p class="{{ Request::is('drinks/special') == 'special' ? 'nav_active' : 'nav_name' }} line_height_08">Specials</p>
                </a>
            </li>
        </ul>
    </div>
    @endif
    
@yield('content')

</body>
<script>

    $( ".icon" ).click(function() {
        $( "#nav" ).toggleClass( "responsive" );
    });

    $(".header_icons").mouseover(function(e) {
        e.preventDefault();
        var target_span = $(this).parent().next();
        target_span.css("opacity", "100");
    });
    $(".header_icons").mouseout(function(e) {
        e.preventDefault();
        var target_span = $(this).parent().next();
        target_span.css("opacity", "0");
    });

    $("#navbarDropdown").click(function(){
        $(".dropdown-menu").toggle("slow");
    })


</script>
</html>