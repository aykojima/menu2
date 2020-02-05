<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\category as category;
use App\Models\product as product;
use App\Models\sake as sake;
use App\Models\wine as wine;
use App\Models\bottle as bottle;
use App\Models\page_title as page_title;
use Illuminate\Support\Facades\DB;

class drink_controller extends Controller
{
    public function show($page) 
    { 
        if($page != 'sake' && $page != 'wine' && $page != 'cocktail' && $page != 'shochu' && $page != 'special'){ return redirect('/');}
        $titles = [];

        if($page == 'sake'){
            $titles = [1, 2]; //titles for sake
        }else if($page == 'wine'){
            $titles = [3, 4]; //titles for wine
        }else if($page == 'cocktail'){
            $titles = [8, 9, 10]; //titles for cocktails
        }else if($page == 'shochu'){
            $titles = [5, 6, 7]; //titles for shochu, Japanese Whisky and Spirits
        }else if($page == 'special'){
            $titles = [11, 12]; //titles for special
        }
        
        $first_el = array_values($titles)[0];
        $last_el = array_values($titles)[count($titles) - 1];

        $categories = category::whereBetween('title_id', [$first_el, $last_el])
            ->select('category_id')
            ->orderBy('title_id')
            ->orderBy('order')
            ->get();


        $category_array = [];
        
        foreach($categories as $category){
            
            $query = product::leftJoin('categories', 'categories.category_id', '=', 'products.category_id')
                ->where('products.category_id', $category->category_id)
                ->leftJoin('page_titles', 'page_titles.title_id', '=', 'categories.title_id');
            
            if($page == 'sake'){
                $query->when('sakes.product_id' != null, function($q){
                    return $q->leftJoin('sakes', 'products.product_id', '=', 'sakes.product_id')
                    ->leftJoin('bottles', 'sakes.sake_id', '=', 'bottles.sake_id');
                });
            }
            
            else if($page == 'wine'){
                $query->when('wines.product_id' != null, function($q){
                    return $q->leftJoin('wines', 'products.product_id', '=', 'wines.product_id')
                    ->leftJoin('bottles', 'wines.wine_id', '=', 'bottles.wine_id');   
                });
            }else if($page == 'shochu'){
                $query->when('name' != null, function($q){
                    return $q->orderBy('name');
                });
            }

            $products = $query->orderByRaw('CHAR_LENGTH(price)')
                    ->orderBy('price')
                    ->get();
                    // ->toSql();
            // dd($products);
            array_push($category_array, $products);
        }//end of foreach
            return view('drink_menu/view', compact('page', 'category_array', 'titles'));
            
    }


    public function add_new(Request $request, $page) 
    { 
        $input = $request->all();

        switch($request->submit) {
            case 'Create': 
                $new_category['category'] = strtoupper($input['category_name']);
                $new_category['category_description'] = $input['category_desc']; 
                $new_category['title_id'] = ($input['title_id']);
                $new_category['page_number'] = ($input['page_id']);
                $new_category['order'] = 0;

                // dd($new_category);
                $category = category::create($new_category);

                $new_product['name'] = 'Edit to add a name';
                $new_product['price'] = 'Edit to add a price'; 
                $new_product['category_id'] = $category->category_id; 

                $product = product::create($new_product);

                if($page == 'sake'){
                        $new_sake['rice'] = "rice";
                        $new_sake['grade'] = "grade";
                        $new_sake['product_id'] = $product->product_id;
                        $sake = sake::create($new_sake);
                }elseif($page == 'wine'){
                    $new_wine['type'] = "type";
                    $new_wine['year'] = "year";
                    $new_wine['product_id'] = $product->product_id;
                    $wine = wine::create($new_wine);
                }

                $new_item = $input['category_name'] . " was successfully created!"; 
                return redirect('drinks/' . $page)->with('status', $new_item );
            break;
            case 'Update': 
                $category = category::findOrFail ( $request->category_id );
                $category->category = strtoupper($input['category_name']);
                $category->category_description = $input['category_desc'];
                $category->page_number = $input['page_id'];
                $category->title_id = $input['title_id'];
                $category->save();
                $new_item = $input['category_name'] . " was successfully edited!"; 
                return redirect('drinks/' . $page)->with('status', $new_item );
            break;
            case 'Save':
                // if(!empty($input['name'])){
                    $new_product['name'] = ucfirst($input['name']);
                    $new_product['price'] = $input['price']; 
                    if($page != 'cocktail'){
                        $new_product['production_area'] = ucfirst($input['production_area']);
                        $new_product['description2'] = lcfirst($input['description2']);
                    }
                    $new_product['description'] = lcfirst($input['description']);
                    $new_product['category_id'] = $input['category_id'];
                    //$data = $this->validate_form($input);
                    
                    
                    $product = product::create($new_product);
                    

                    if($page == 'sake'){
                        // if($new_product['category_id'] != 38)
                        // {
                            $new_sake['rice'] = ucfirst($input['rice']);
                            $new_sake['grade'] = ucfirst($input['grade']);

                            if($input['sweetness'] == 'other')
                            { $new_sake['sweetness'] = $input['sweetness_other']; }
                            else { $new_sake['sweetness'] = $input['sweetness']; }

                            $new_sake['product_id'] = $product->product_id;
                            
                            $sake = sake::create($new_sake);

                            if($input['size_checkbox'] == "Size is not 720ml"
                                && $input['size'] != null)
                            {
                                $new_bottle['size'] = $input['size'];
                                $new_bottle['second_price'] = $input['second_price'];
                                $new_bottle['sake_id'] = $sake->sake_id;

                                $bottle = bottle::create($new_bottle);
                            }
                        // }
                    }elseif($page == 'wine'){
                        $new_wine['type'] = ucfirst($input['type']);
                        $new_wine['year'] = $input['year'];

                        $new_wine['product_id'] = $product->product_id;
                        
                        $wine = wine::create($new_wine);

                        if($input['size_checkbox'] == "Size is not 750ml"
                            && $input['size'] != null)
                        {
                            $new_bottle['size'] = $input['size'];
                            $new_bottle['second_price'] = $input['second_price'];
                            $new_bottle['wine_id'] = $wine->wine_id;

                            $bottle = bottle::create($new_bottle);
                        }
                    }
                    $new_item = $new_product['name'] . " was successfully created!";
                    return redirect('drinks/' . $page)->with('status', $new_item );
                // }//end of if !empty($input['name'])
            break;
            case 'Delete':
                $category = category::findOrFail ( $request->category_id );
                $category->delete();
                $edited_item = $input['category_name'] . " was deleted!";
                return redirect('drinks/' . $page)->with('status', $edited_item );
            break;
        }
    }
    public function show_edit_form(Request $request, $page)
    {
        if($request->ajax()){
            $product = product::findOrFail($request->product_id);
            if($product->sake)
            {
                $sake = $product->sake;      
                if($product->sake->bottle)
                {
                    $bottle = $product->sake->bottle;
                    return Response(compact('product', 'sake', 'bottle'));
                }          
                
                return Response(compact('product', 'sake'));
            }elseif($product->wine)
            {
                $wine = $product->wine;
                
                if($product->wine->bottle)
                {
                    $bottle = $product->wine->bottle;
                    return Response(compact('product', 'wine', 'bottle'));
                }

                return Response(compact('product', 'wine'));
            
            }

            else{
                return Response(compact('product'));
            }
        }
        
    }

    public function edit_menu(Request $request, $page)
    {        
        $input = $request->all();
            $product = product::findOrFail ( $request->product_id );
            
            switch($request->submit) {
                case 'Update': 
                    $input = $request->all();
                    $edit_product['name'] = $input['name'];
                    $edit_product['price'] = $input['price']; 
                    if($page != 'cocktail'){
                        $edit_product['production_area'] = $input['production_area'];
                        $edit_product['description2'] = $input['description2'];
                    }    
                    $edit_product['description'] = $input['description'];

                    $product->update($edit_product);

                    if($page == 'sake'){
                        // if($request->product_id != 38)
                        // {
                            $edit_sake['rice'] = $input['rice'];
                            $edit_sake['grade'] = $input['grade'];

                            if($input['sweetness'] == 'other')
                            { $edit_sake['sweetness'] = $input['sweetness_other']; }
                            else { $edit_sake['sweetness'] = $input['sweetness']; }

                            if($product->sake){
                                $sake = sake::findOrFail ( $product->sake->sake_id );
                                $sake->update($edit_sake);

                            }else
                            {
                                $edit_sake['product_id'] = $product->product_id;
                                $sake = sake::create($edit_sake);
                            }

                            if($input['size_checkbox'] == "Size is not 720ml"
                                && $input['size'] != null){
                                $edit_bottle['size'] = $input['size'];
                                $edit_bottle['second_price'] = $input['second_price'];
                                if($sake->bottle){
                                    $bottle = bottle::findOrFail ( $sake->bottle->bottle_id );
                                    $bottle->update($edit_bottle);
                                }else
                                {
                                    $edit_bottle['sake_id'] = $sake->sake_id;
                                    bottle::create($edit_bottle);
                                }
                            }else if(
                                ($sake->bottle && $input['size_checkbox'] == "720ml" && $sake->bottle)
                                    || ($sake->bottle && $input['size_checkbox'] == "Size is not 720ml"
                                    && $input['size'] == null)){
                                $bottle = bottle::findOrFail ( $sake->bottle->bottle_id );
                                $bottle->delete();
                            // }
                        }//end of if(category_id !=38)
                    }else if($page == 'wine'){
                        $edit_wine['type'] = $input['type'];
                        $edit_wine['year'] = $input['year'];

                        if($product->wine){
                            $wine = wine::findOrFail ( $product->wine->wine_id );
                            $wine->update($edit_wine);

                        }else
                        {
                            $edit_wine['product_id'] = $product->product_id;
                            $wine = wine::create($edit_wine);
                        }

                        if($input['size_checkbox'] == "Size is not 750ml"
                            && $input['size'] != null){
                            $edit_bottle['size'] = $input['size'];
                            $edit_bottle['second_price'] = $input['second_price'];
                            
                            if($wine->bottle){
                                $bottle = bottle::findOrFail ( $wine->bottle->bottle_id );
                                $bottle->update($edit_bottle);
                            }else
                            {
                                $edit_bottle['wine_id'] = $wine->wine_id;
                                bottle::create($edit_bottle);
                            }    
                        }else if(
                            ($wine->bottle && $input['size_checkbox'] == "750ml" && $wine->bottle)
                            || ($wine->bottle && $input['size_checkbox'] == "Size is not 750ml"
                            && $input['size'] == null)){
                                $bottle = bottle::findOrFail ( $wine->bottle->bottle_id );
                                $bottle->delete();
                        }
                    }
                    $edited_item = $input['name'] . " was successfully edited!";
                    return redirect('drinks/' . $page)->with('status', $edited_item );
                break;
                case 'Delete':
                //dd($product);
                    $product->delete();
                    $edited_item = $input['name'] . " was deleted!";
                    return redirect('drinks/' . $page)->with('status', $edited_item );
                break;
            }//end of swtch
    }

    public function edit_order(Request $request)
    {
        if($request->ajax()){
            
            $orders = ($request->order);
            foreach($orders as $key => $order){
                $catid = str_replace('catid_', '', $order);
                DB::table('categories')->where('category_id', $catid)->update(['order' => $key]);
            }
            //Here need to send back session status for confirmation message
            // return Response()->with('status', 'Order Updated!');
        }
    }
    public function print()
    {
        $categories = category::all();
        $page_length = category::max('page_number');
        $titles_array = [];
        
        function get_products($page_length){
            $page_array = [];
            //Get page length
                            
            for($i = 0; $i<$page_length; $i++){
                $page_array[$i] = [];
            }

            //get row count of category
            $category_length = category::all()->count();
 
            for($page_number = 1; $page_number <= $page_length; $page_number++){
                $category_array = [];
                $categories = category::where('page_number', $page_number)
                                ->orderBy('title_id')
                                ->orderBy('order')
                                ->get();

                foreach( $categories as $category ){
                    $product_array = [];
                    for($title_id = 1; $title_id <= 7; $title_id++){
                        if($category->title_id == $title_id){
                            $query = product::leftJoin('categories', 'products.category_id', '=', 'categories.category_id')
                                ->where('products.category_id', $category->category_id)
                                ->leftJoin('page_titles', 'page_titles.title_id', '=', 'categories.title_id')
                                ->leftJoin('sakes', 'products.product_id', '=', 'sakes.product_id')
                                ->leftJoin('wines', 'products.product_id', '=', 'wines.product_id')
                                ->leftJoin('bottles', function ($join) {
                                    $join->on('wines.wine_id', '=', 'bottles.wine_id')
                                            ->orOn('sakes.sake_id', '=', 'bottles.sake_id');
                                });
                                if(strpos($category->category, 'WHISKEY')){
                                    $query->when('name' != null, function($q){
                                        return $q->orderBy('name');
                                    });
                                }else if(strpos($category->category, 'SHOCHU')){
                                    $query->when('description2' != null, function($q){
                                        return $q->orderBy('description2');
                                    });
                                }
                                $products = $query->orderByRaw('CHAR_LENGTH(price)')
                                ->orderBy('price')
                                ->get();

                                array_push($product_array, $products);
                            
                            }//end of if    
                         }//end of third for loop
                    array_push($category_array, $product_array);
                    
                }//end of foreach

                //re-order the pages for printing
                if($page_length == 7){
                    switch($page_number){
                        case 1:
                            $page_array[$page_number] = $category_array;
                        case 2:
                            $page_array[$page_number] = $category_array;
                        case 3:
                            $page_array[7] = $category_array;
                        case 4:
                            $page_array[$page_number] = $category_array;
                        case 5:
                            $page_array[$page_number] = $category_array;
                        case 6:
                            $page_array[$page_number] = $category_array;
                        case 7:
                            $page_array[3] = $category_array;
                        // case 8:
                        //     array_push($page_array[0], $category_array);
                        //     $page_array[0] = $category_array; 
                    }
                    
                }
                    
                if($page_length == 8){
                    switch($page_number){
                        case 1:
                            $page_array[1] = $category_array;                            
                        case 2:
                            $page_array[2] = $category_array;
                        case 3:
                            $page_array[7] = $category_array;
                        case 4:
                            $page_array[4] = $category_array;
                        case 5:
                            $page_array[5] = $category_array;
                        case 6:
                            $page_array[6] = $category_array;
                        case 7:
                            $page_array[3] = $category_array;
                        case 8:
                            $page_array[0] = $category_array;
                    }
                    
                }

            }//end of first for loop
            return $page_array;
        }
        
        if($page_length == 7){
            $titles_array = [1, 2, 6, 7, 3, 4, 5];
        }else if($page_length == 8){
            $titles_array = [7, 1, 2, 6, 5, 3, 4];
        }
        //$titles_array = [1, 2, 3, 4, 5, 6, 7];
        
        $page_array = get_products($page_length);
        if(count($page_array) % 2 == 1){
            array_unshift($page_array, [[[]]]);
        }

        
        // dd($page_array);
        return view('drink_menu/print_preview', compact('page_array', 'titles_array'));
    }



}


