<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
    Route::get('/', 'sb_controller@main')->name('main');
    Route::get('/login', 'HomeController@index')->name('login');

    Route::middleware('auth')->group( function(){
        Route::group(['prefix' => 'sb'], function () { 
            //sushi bar pages
            Route::get('/', 'sb_controller@show')->name('sb');
            Route::post('/', 'sb_controller@add_new')->name('add_new');
            Route::get('/search', 'sb_controller@search')->name('search');
            Route::get('/update', 'sb_controller@update')->name('update');
            Route::get('/edit', 'sb_controller@show_edit_form')->name('edit');
            Route::post('/edit', 'sb_controller@edit_menu')->name('edit_submit');
        });

        Route::group(['prefix' => 'ippin'], function () { 
            //ippin
            Route::get('/', 'ippin_controller@show')->name('ippin');
            Route::post('/', 'ippin_controller@add_new')->name('ippin_add_new');
            Route::get('/search', 'ippin_controller@search')->name('ippin_search');
            Route::get('/update', 'ippin_controller@update')->name('ippin_update');
            Route::get('/edit', 'ippin_controller@show_edit_form')->name('ippin_edit');
            Route::post('/edit', 'ippin_controller@edit_menu')->name('ippin_edit_submit');
            Route::post('/delete', 'ippin_controller@delete')->name('delete_course_item');
        });
        Route::group(['prefix' => 'roll'], function () { 
            //roll
            Route::get('/', 'roll_controller@show')->name('roll');
            Route::post('/', 'roll_controller@add_new')->name('roll_add_new');
            Route::get('/search', 'roll_controller@search')->name('roll_search');
            Route::get('/update', 'roll_controller@update')->name('roll_update');
            Route::get('/edit', 'roll_controller@show_edit_form')->name('roll_edit');
            Route::post('/edit', 'roll_controller@edit_menu')->name('roll_edit_submit');
        });
        Route::group(['prefix' => 'course'], function () { 
            //course
            Route::get('/', 'course_controller@show')->name('course');
            //Route::post('/edit', 'course_controller@save_content')->name('save_content');
            Route::post('/', 'course_controller@add_new')->name('course_add_new');
            Route::get('/edit/{course_id}', 'course_controller@show_edit_form')->name('course_edit');
            Route::post('/edit/{course_id}', 'course_controller@edit_menu')->name('course_edit_submit');
            Route::get('/delete/{course_id}', 'course_controller@delete')->name('delete');
            Route::post('/save_order', 'course_controller@save_order')->name('save_order');
        });

        Route::group(['prefix' => 'lunch'], function () { 
            //lunch
            Route::get('/', 'lunch_controller@show')->name('lunch');
            Route::post('/', 'lunch_controller@add_new')->name('lunch_add_new');
            Route::get('/edit/{lunch_id}', 'lunch_controller@show_edit_form')->name('lunch_edit');
            Route::post('/edit/{lunch_id}', 'lunch_controller@edit_menu')->name('lunch_edit_submit');
            Route::get('/delete/{lunch_id}', 'lunch_controller@delete')->name('lunch_delete');
            Route::post('/save_order', 'lunch_controller@save_order')->name('lunch_save_order');

        });

        Route::group(['prefix' => 'drinks'], function () { 
            //print preview
            Route::get('/print', 'drink_controller@print')->name('print');
            //Drink views
            Route::get('/{page}', 'drink_controller@show')->name('drink_view');
            //Drink Get data for form
            Route::get('/{page}/edit', 'drink_controller@show_edit_form')->name('drink_edit');
            //Drink Create New Items
            Route::post('/{page}', 'drink_controller@add_new')->name('drink_add_new');
            //Drink Edit items
            Route::post('/{page}/edit', 'drink_controller@edit_menu')->name('drink_edit_submit');
            //Update category orders
            Route::post('/{page}/edit/order', 'drink_controller@edit_order')->name('order_edit');
            
        });

        

     });

  Route::middleware('auth')->group( function(){
    
 });

Auth::routes();

Route::get('/generate/password', function(){ return bcrypt('goriki'); });
 

Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');


//passing parameters to controller
// Route::get('/test/{squirrel}', ['uses' =>'SomeController@doSomething']);
// SomeController:

// public function doSomething($squirrel)
// {
//   $data['squirrel'] = $squirrel;
//   return View::make('simple', $data);
// }


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
