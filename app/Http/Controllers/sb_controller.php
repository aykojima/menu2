<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\sb as sb;
// use App\Http\Controllers\Session;

class sb_controller extends Controller
{
    // public function __construct( sb $sb )
    // {
    //     $this->sb = $sb;
    // }

    public function main(){
        return view('main');
    }

    public function show()
    { 
        $outputs = $this->generate_menu();
        $num_items = sb::where('is_on_menu','=','Y')->count();
        
        return view('food_menu/sb', ['outputs' => $outputs], ['num_items' => $num_items]);
    }

    public function search(Request $request)
    {  
        if($request->ajax())
        { 
            $output="";    
            $sb_items=DB::table('sbs')->where('eng_name','LIKE','%'.$request->search."%")
            ->orWhere('jpn_name','LIKE','%'.$request->search."%")->get();
         
            if($sb_items)
            {   
                $output.=
                    "<p id='new_item'>&#43; add</p>";
                foreach ($sb_items as $key => $sb_item) {    
                    $output.=
                    "<p class='is_on_menu";
                    if($sb_item->is_on_menu == 'N')
                    {
                        $output .= "_not";
                    }
                    
                    $output .= "' id='$sb_item->sb_id-searchkey' data-id='$sb_item->sb_id'>$sb_item->eng_name";

                    if($sb_item->eng_name && $sb_item->jpn_name){
                        $output .= " / "; 
                    }

                    $output .= "$sb_item->jpn_name";

                    if($sb_item->origin){
                        $output .= " ( $sb_item->origin ) "; 
                    }

                    $output .= "</p><button id='$sb_item->sb_id-editkey' class='edit' data-id='$sb_item->sb_id'> edit</button>";
                }
            }
            
            return Response($output);
        }
    }

    public function update(Request $request)
    { 
        $sb_id = $request->item_id;
        $is_on_menu = DB::table('sbs')->where('sb_id', $sb_id)->value('is_on_menu');

        if($is_on_menu == 'Y')
        {

            DB::table('sbs')->where('sb_id', $sb_id)->update(['is_on_menu' => 'N']);

        }else
        {

            DB::table('sbs')->where('sb_id', $sb_id)->update(['is_on_menu' => 'Y']);

        }

        return Response($this->generate_menu());
        
    }

    public function generate_menu()
    { 
        $sbs = DB::table('sbs')->where('is_on_menu', 'Y')->orderBy('eng_name', 'asc')->get();
        
        $output = [];
        foreach ($sbs as $sb) {
            $item = '';
            $item = "<tr class='draggable'>
            <td class='sustainable";
            if($sb->is_sustainable == 'Y')
            {
                $item .= "_y";
            }

            $item .= "'></td><td class='name'>$sb->eng_name";

            if($sb->is_raw == 'Y' && $sb->eng_name != null)
            {
                $item .= "*";
            }

            if($sb->jpn_name != null && $sb->eng_name)
            {
                $item .= " / ";
            } 

            $item .= "$sb->jpn_name";

            if($sb->is_raw == 'Y' && $sb->eng_name == null)
            {
                $item .= "*";
            }
            
            $item .="</td><td class='origin'>";

            if($sb->origin != null)
            {
                $item .=" ( $sb->origin ) ";
            }     

            $item .= "</td>
                    <td class='price'>";
            if($sb->nigiri_price == null)
            {
                $item .= '-';
            }else
            {
                $item .="$sb->nigiri_price";
            }     
                $item .="</td><td class='space'></td><td class'space'
                    ></td><td class='price'>";
            if($sb->sashimi_price == null)
            {
                $item .= '-';
            }        
                $item .="$sb->sashimi_price</td></tr>";

            array_push($output, $item);
        }
        
        return $output;
    }

    // public function show_test(){
    //     return view('main');
    // }

    public function add_new(Request $request)
    { 
        $data = [];
        //if(Request::ajax())
        if( $request->isMethod('post'))
        {
            $input = $request->all();
            $data = $this->validate_form($input);
               
        }
        sb::create($data);
        $new_item = $data['eng_name'] . " / " . $data['jpn_name'] . " was successfully created!";
        return redirect('sb')->with('status', $new_item );
        
    }

    
    // public function edit($sb_id = 9)
    // {
    //     $sb_item = sb::findOrFail($sb_id);
    //     return view('main', compact('sb_item'));
    // }


    // public function edit_submit(Request $request, $sb_id)
    // {
    //     $sb_item = sb::findOrFail($sb_id);
    //     $input = Request::all();
    //     $data = [$this->validate_form($input)];
    //     $sb_item->update($data);
    //     return redirect('sb');
    // }

    public function show_edit_form(Request $request)
    {
        if($request->ajax()){
            $sb_id = $request->sb_id;
            $sb = sb::findOrFail($sb_id);
            return Response($sb);
        }
        
    }

    public function edit_menu(Request $request)
    {        
        $sb_item = sb::findOrFail ( $request->sb_id );
        $input = $request->all();
        $data = $this->validate_form($input);
        $sb_item->update($data);
        $edited_item = $data['eng_name'] . " / " . $data['jpn_name'] . " was successfully edited!";
        return redirect('sb')->with('status', $edited_item );
    }

    public function style_name($input)
    {
        $output = ucwords($input);
        $characters_to_lowercase = array('Belly', 'Grilled', 'Of', 'W');
        foreach($characters_to_lowercase as $character_to_lowercase)
        {
            if(strpos($output, $character_to_lowercase) == true)
            {
                $pos = strpos($output, $character_to_lowercase);
                $output = substr($output, 0, $pos-1) . strtolower(substr($output, $pos-1, 2))
                . substr($output, $pos+1);
            }
        }
        return $output;
    }

    public function validate_form($input)
    {
        $data = [];
        $data['eng_name'] =  $this->style_name($input['eng_name']);
        $data['jpn_name'] =  $this->style_name($input['jpn_name']);
        $data['origin'] =  $this->style_name($input['origin']); 

        if(is_numeric($input['nigiri_price']) == false ) 
        {
            $data['nigiri_price'] = null;
        }else
        {   
            $data['nigiri_price'] = $input['nigiri_price'];
        }
        
        if(is_numeric($input['sashimi_price']) == false ) 
        {
            $data['sashimi_price'] = null;
        }else
        {   
            $data['sashimi_price'] = $input['sashimi_price'];
        }
        
        $data['is_sustainable'] = $input['is_sustainable'];
        $data['is_raw'] = $input['is_raw'];
        $data['is_special'] = $input['is_special'];
        $data['is_on_menu'] = $input['is_on_menu']; 
        
        return $data;
    }




    // Test pages
    public function create()
    {   
        return view('food_menu/create');
    }

    public function store(Request $request)
    {
        $data = [];
        //if(Request::ajax())
        if( $request->isMethod('post'))
        {
            $input = $request->all();
            $data = $this->validate_form($input);
               
        }

        //dd($request->all());
        $input = $request->all();
        $data = $this->validate_form($input);    
    
        sb::create($data);
    
        // Session::flash('flash_message', 'New item successfully added!');
    
        return redirect()->back();
    }




}



