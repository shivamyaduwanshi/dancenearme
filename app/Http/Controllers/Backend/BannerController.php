<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;

class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banners = Banner::whereNull('deleted_at')->orderBy('id','desc')->paginate('10');
        return view('backend.banner.index',compact('banners'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.banner.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $rules = [
            'title' => 'required',
            'banner_image' => 'required|mimes:jpeg,jpg,png,gif'
        ];

        $request->validate($rules);

        if ($request->hasFile('banner_image')) {
           $fileName = str_random('10').'.'.time().'.'.request()->banner_image->getClientOriginalExtension();
           request()->banner_image->move(public_path('images/banner/'), $fileName);
         }

        $inserData = [
            'title'  => $input['title'],
            'banner' => $fileName
        ];

        if($request->is_active)
             $inserData['is_active'] = '1';
        else 
            $inserData['is_active']  = '0';

        $Banner  = Banner::insertGetId($inserData);

        if($Banner){
            return redirect()->route('backend.index.banner')->with('status',true)->with('message',__('Successfully added banner'));
        }else{
            return redirect()->route('backend.index.banner')->with('status',false)->with('message',__('Failed add banner'));
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       $banner = Banner::find($id);
       return view('backend.banner.edit',compact('banner'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->all();
        $rules = [
            'title' => 'required',
            'banner_image' => 'mimes:jpeg,jpg,png,gif'
        ];

        $request->validate($rules);
        
        $fileName = null;
        if ($request->hasFile('banner_image')) {
           $fileName = str_random('10').'.'.time().'.'.request()->banner_image->getClientOriginalExtension();
           request()->banner_image->move(public_path('images/banner/'), $fileName);
         }

        $Banner  = Banner::find($id);
        $Banner->title = $request->title;
        
        if($request->is_active)
             $Banner->is_active = '1';
        else 
            $Banner->is_active  = '0';

        if($fileName)
          $Banner->banner = $fileName;

        if($Banner->update()){
            return redirect()->route('backend.index.banner')->with('status',true)->with('message',__('Successfully updated banner'));
        }else{
            return redirect()->route('backend.index.banner')->with('status',false)->with('message',__('Failed update banner'));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $Banner = Banner::find($request->id);
        $Banner->deleted_at = date('Y-m-d H:i:s');
        if($Banner->update()){
            return redirect()->route('backend.index.banner')->with('status',true)->with('message',__('Successfully deleted banner'));
        }else{
            return redirect()->route('backend.index.banner')->with('status',false)->with('message',__('Failed delete banner'));
        }
            
    }
}
