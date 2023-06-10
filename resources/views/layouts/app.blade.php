<!DOCTYPE html>
<html data-whatinput="keyboard" data-whatintent="keyboard" class=" whatinput-types-initial whatinput-types-keyboard">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_token" content="{{ csrf_token() }}">
    <title>SKT menu - @yield('title')</title> 
    <link rel="stylesheet" href="{{ asset('css/main.css') }}" type="text/css" media="screen">
    <!--<link rel="stylesheet" href="../css/style-print.css" type="text/css" media="print"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> 
    <link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">

</head>
<body>
   <header>
        <ul class="top-nav">
        @guest
            @if(Request::is('login'))
                <li class="nav-item"><a href="{{ route('main') }}">Home</a></li> 
            @else       
                <li class="nav-item"><a href="{{ route('login') }}">Login</a></li>
                <!-- <li class="nav-item"><a href="{{ route('register') }}">Register</a></li> -->
            @endif
        @else
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
        @endguest
        </ul>
    </header>

            @yield('content')

    <!-- Scripts -->
    <script>
    $("#navbarDropdown").click(function(){
        $(".dropdown-menu").toggle("slow");
    })

    $("#food_icon").hover(function(){
        $("#food_menu").show("clip", 500);
        $("#drink_menu").hide("clip", 500);
    })
    $("#drink_icon").hover(function(){
        $("#drink_menu").show("clip", 500);
        $("#food_menu").hide("clip", 500);
    })


    </script>
    </body>
</html>

