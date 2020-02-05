<!DOCTYPE html>
<html data-whatinput="keyboard" data-whatintent="keyboard" class=" whatinput-types-initial whatinput-types-keyboard">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_token" content="{{ csrf_token() }}">
    <title>SKT menu - Drink Preview @yield('title')</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}" type="text/css" media="screen">
    
    @if(Request::is('cocktail'))
    <link rel="stylesheet" href="{{ asset('css/app_drink_print_4.25in.css') }}" type="text/css" media="print">
    @else
    <link rel="stylesheet" href="{{ asset('css/app_drink_print.css') }}" type="text/css" media="print">
    @endif
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="{{ asset('images/favicon.ico') }}" />

</head>
<body>
    <header>
        <ul id="header">
            <li id="logout"><a href ="logout.php">Logout</a></li>
            <li class="icon"><a href="javascript:void(0)">&#9776;</a></li>
            <li><a href='{{ URL::to('drinks/sake')}}'><img class="home_icon header_icons" src="../images/arrow.png"></a><span>Go back to edit page</span></li>   
            <li id="print"><a href="javascript: window.print()"><img class="header_icons" src="../images/printer.png"></a><span>Print</span></li>
            <!-- <li id="print"><a href="javascript: window.print()"><img id="header_icons" src="../images/printer.png"></a><span>print</span></li> -->
            <!-- <li id="new_item"><a onclick="show_add_new_div()"><img id="header_icons" src="../images/add.png"></a><span>add new item</span></li>     -->
        </ul>
    </header> 
    <div class="drink_container">
        @foreach($page_array as $key => $category_array) 
            @if( $key == 0 || $key % 2 == 0 )
                <div class="pages">
                <div class="page_left key_{{$key}}">        
            @else
                <div class="page_right key_{{$key}}">
            @endif
            <div class="menu">
            @foreach($category_array as $product_array)
                @foreach($product_array as $products)
                    @foreach($products as $product)
                    <!-- if the title_id equals to the first element of the array, print out the title -->
                        @if ($loop->first)
                            @php
                            {{    
                                if(count($titles_array) != 0 &&
                                    $product->title_id == array_values($titles_array)[0]){
                                        echo "<div class='title_div'>";
                                        echo "<h1 class='title'>$product->title_name</h1>";
                                        echo "<p>$product->title_description</p>";
                                        echo "<p>$product->title_size</p>";
                                        echo "</div>";
                                        array_shift($titles_array);
                                    }
                            }}
                            @endphp

                            <div class="category {{$product->styling}}">
                                <div  class="drink_title">
                                    @if($product->title_name != $product->category && $product->styling == 'border')
                                        <h1 class="title">{{ $product->category }}</h1>
                                    @elseif($product->title_name != $product->category && $product->styling != 'border')      
                                        <h3>{{ $product->category }}</h3>
                                    @endif
                                    <p style="color: #CCCCCC; font-size: 0.8em; line-height: 1em;">{{ $product->category_description }}</p>
                                </div>
                                <div class="drink_categories">
                        @endif <!-- end of ($loop->first) -->
                                    <div class="products">
                                        <div>
                                            <p class="drink_name">
                                                {{ $product->name }} 
                                                <small  style="font-style: italic;">{{ $product->grade }}</small>    
                                                <small style="font-style: italic;">{{ $product->type }}</small>
                                                @if($product->title_id == 5 || $product->title_id == 6 || $product->title_id == 7)
                                                    <!-- Japanese Whiskey, Shochu, and Spirits page -->
                                                    <small   style="font-style: italic;">{{ $product->description2 }}
                                                        <span class="float_span" style="color: #CF671F; font-style: normal;">{{ $product->production_area }}</span>    
                                                    </small> 
                                                @endif
                                            </p>
                                            <p class="drink_price">{{ $product->price }}</p>
                                            <p class="bottle_size">
                                                @if(!empty ($product->size))    
                                                    <small>{{ $product->size }}ml</small>
                                                @endif
                                                @if(!empty ($product->second_price)  )  
                                                    {{ $product->second_price }} / 
                                                @endif
                                            </p>
                                            <div class="drink_details">
                                                <p>
                                                    @if($product->title_id != 5 && $product->title_id != 6 && $product->title_id != 7)
                                                        <!-- Japanese Whiskey, Shochu, and Spirits page -->   
                                                        {{ $product->production_area }}  
                                                    @endif
                                                    @if(!empty ($product->rice))            
                                                        / {{ $product->rice }} / {{ $product->sweetness }}
                                                    @endif
                                                    @if(!empty ($product->year))    
                                                        @if($product->year) 
                                                            <span>{{ $product->year }}</span>
                                                        @endif
                                                    @endif
                                                </p>
                                                <p>{{ $product->description }}</p>
                                                @if($product->title_id != 5 && $product->title_id != 6 && $product->title_id != 7)   
                                                    <!-- Japanese Whiskey, Shochu, and Spirits page -->
                                                    <span>{{ $product->description2 }}</span>
                                                @endif  
                                            </div><!--end of drink_details-->
                                        </div>
                                    </div><!--end of products-->
                        @if ($loop->last)
                                </div>
                            </div>
                        @endif
                    @endforeach
                @endforeach
            @endforeach<!--($category_array as $product_array)-->
            </div><!--end of menu-->
            @if( $key % 2 == 0 )
            </div><!--end of page_left-->
            @else
            </div><!--end of page_right-->
            </div><!--end of pages-->
            @endif
        @endforeach<!-- ($page_array as $key => $category_array)  -->
    </div><!-- end of drink_container div -->    
    
<script>

$(document).ready(function(){
    $(".title").each(function(){
        if($(this).outerHeight() >= 50){
            $(this).addClass("small_title_font");
        }
    })

    // $("h3").each(function(){
    //     if($(this).outerHeight() >= 50){
    //         $(this).addClass("small_font");
    //     }
    // })

    $(".drink_name").each(function(){
        // console.log($(this).text() + $(this).outerWidth());
        if($(this).outerWidth() >= 330)
        {
            $(this).addClass("small_font");
        }
    })
    //Need to fix here
    //Make each if statement callback function so that it checks the height each time the function is called.
        
const first_page = document.querySelector(".key_1");
const fourth_page = document.querySelector(".key_4");
const sixth_page = document.querySelector(".key_6");
const second_page = document.querySelector(".key_2");
const third_page = document.querySelector(".key_3");
const fifth_page = document.querySelector(".key_5");

first_page.classList.add("font_size_0_9em");
fourth_page.classList.add("font_size_0_9em");
sixth_page.classList.add("font_size_0_9em");
second_page.classList.add("font_size_1_03em");
third_page.classList.add("font_size_1_07em");
fifth_page.classList.add("font_size_0_9em");

    //const menus = document.querySelectorAll(".menu");
// menus.forEach(menu => {
//     let num_products = menu.querySelectorAll('.products').length;
//     let num_titles = menu.querySelectorAll('.drink_title').length;
//     console.log(num_products);
//     console.warn(num_titles);
//     const title_divs = menu.querySelectorAll(".title_div");
//     const drink_titles = menu.querySelectorAll(".drink_title");
//     const products = menu.querySelectorAll(".products");
//     const drink_categories = menu.querySelectorAll(".drink_categories");
//     const drink_names = menu.querySelectorAll(".drink_name");
//     const smalls = menu.querySelectorAll("small");
//     const drink_details = menu.querySelectorAll(".drink_details");
        

    // if(num_titles >= 5){
    //     title_divs.forEach(function(div, key){
    //             key == 0 && div.classList.add("no_padding");
    //             key >= 1 && div.classList.add("margin_top");
    //             drink_categories.forEach(categories => categories.classList.add("font_0_8em"));
    //         });
    //     if(num_products >= 12){
    //         drink_categories.forEach(categories => categories.classList.add("no_margin_bottom"));
    //         drink_titles.forEach(title => title.classList.add("no_padding"));
    //     }else if(num_products >= 12){
    //         drink_categories.forEach(categories => categories.classList.add("no_margin_bottom"));
    //         drink_titles.forEach(title => title.classList.add("no_padding"));
    //         // products.forEach(product => product.classList.add("no_margin_bottom"));
    //     }
    // }else if(num_titles >= 3){
    //     // console.warn(num_titles);
    //     drink_categories.forEach(categories => categories.classList.add("font_0_8em"));
    //     if(num_products >=18){
    //         drink_categories.forEach(categories => categories.classList.add("no_margin_bottom"));
    //         // drink_titles.forEach(title => title.classList.add("no_margin_bottom"));
    //         // products.forEach(product => product.classList.add("no_margin_bottom"));
    //         drink_details.forEach(drink_detail => drink_detail.classList.add("small_font"));
    //         //menu.classList.add("no_margin_top");
    //     }else if(num_products >=16){
    //         drink_categories.forEach(categories => categories.classList.add("no_margin_bottom"));
    //         drink_titles.forEach(title => title.classList.add("no_margin_bottom"));
    //         // menu.classList.add("no_margin_top");
    //     }else if(num_products <= 12){
    //         // console.log(num_products);
    //         // console.warn(num_titles);
    //         drink_categories.forEach(categories => categories.classList.add("margin_bottom12"));
    //         drink_titles.forEach(drink_title => drink_title.classList.add("font1_1em"));
    //     }
    // }else if(num_titles >= 1){
    //         // console.log(num_products);
    //         // console.warn(num_titles);
    //         drink_categories.forEach(categories => categories.classList.add("margin_bottom12"));
    //         drink_titles.forEach(drink_title => drink_title.classList.add("font1_1em"));
    //         products.forEach(product => product.classList.add("margin_bottom3"));
    //         drink_names.forEach(drink_name => drink_name.classList.remove("small_font"));
    //         smalls.forEach(small => small.classList.add("breaks"));
    //         // drink_names.forEach(drink_name => drink_name.classList.add("font1_3em"));
    //         if(num_products >= 17){
    //             drink_categories.forEach(categories => categories.classList.remove("margin_bottom12"));
    //             drink_titles.forEach(drink_title => drink_title.classList.remove("font1_1em"));
    //             products.forEach(product => product.classList.remove("margin_bottom3"));
    //             // drink_names.forEach(drink_name => drink_name.classList.remove("font1_3em"));
    //             smalls.forEach(small => small.classList.remove("breaks"));
                
    //         }
    // }
    // console.log(menu.offsetHeight);
    




    // if(menu.offsetHeight >= 1120){
    //     title_divs.forEach(div => div.classList.add("no_padding"));
    //     drink_categories.forEach(categories => categories.classList.add("no_margin_bottom"));
    //     drink_titles.forEach(title => title.classList.add("no_padding"));
    // // }else if(menu.offsetHeight >= 1300){
    // //     drink_titles.forEach(title => title.classList.add("no_padding"));
    // }else if(menu.offsetHeight <= 800){
        
    //     products.forEach(product => product.classList.add("large_margin"))
    // }
// })



//     function smallMargin(current_page){
//         var height = current_page.outerHeight();
//         if(height >= 1250){
//             current_page.find(".products").addClass("small_margin");
//             height = current_page.outerHeight();
//             console.log('first ' + height);
//             smallMarginTop(height, current_page);
//         }
//     }
//     function smallMarginTop(height, current_page){
//         if(height >= 1250){
//             current_page.addClass("small_margin_top");
//             height = $(this).outerHeight();
//             console.log('second ' + height);
//             noMargin(height, current_page)
//         }
//     }

//     function noMargin(height, current_page){
//         if(height >= 1250){
//             console.log('third ' + height);
//             current_page.find(".products").addClass("no_margin");
//         }
//     }
//     $(".menu").each(function(){
//         var height = $(this).outerHeight();
//         var current_page = $(this);
//         console.log('original ' + height);
//         smallMargin(current_page);
//     });
    
    
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

</script>

</body>
</html>


