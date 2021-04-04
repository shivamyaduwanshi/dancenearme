<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use Auth;
use DB;

class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $services = Service::whereNull('deleted_at')->orderBy('id','desc')->paginate('10');
        return view('backend.service.index',compact('services'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.service.create');
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
            'title'  => 'required|string|max:255|unique:services,title,null,id,deleted_at,NULL',
           // 'image'  => 'required|image|mimes:jpeg,jpg,png,gif'
            'image'  => 'required'
        ];
        $request->validate($rules);
        $fileName = null;
        if ($request->hasFile('image')) {
           $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
           request()->image->move(public_path('images/service/'), $fileName);
         }
        $inserData = [
            'title'   => $input['title'],
            'user_id' => auth::id(),
            'description' => $input['description']
        ];
        if($fileName){
            $inserData['image'] = $fileName;
        }
        if($request->is_active)
             $inserData['is_active'] = '1';
        else 
            $inserData['is_active']  = '0';
            DB::beginTransaction();
        try{
            $service  = Service::insertGetId($inserData);
            DB::commit();
            return redirect()->route('backend.index.service')->with('status',true)->with('message',__('Successfully added service'));
        }catch(\Exception $e){
            DB::rollback();
            return redirect()->route('backend.index.service')->with('status',false)->with('message',__('Failed add service'));
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
       $service  = Service::find($id);
       return view('backend.service.edit',compact('service'));
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
            'title'  => 'required|string|max:255|unique:services,title,'.$id.',id,deleted_at,NULL',
          //  'category_image' => 'mimes:jpeg,jpg,png,gif'
        ];

        $request->validate($rules);
        
        $fileName = null;
        if ($request->hasFile('image')) {
           $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
           request()->image->move(public_path('images/service/'), $fileName);
         }
        
        $updateData = [
            'title' => $input['title'],
            'description' => $input['description']
        ];

        if($request->is_active)
            $updateData['is_active'] = '1';
        else
            $updateData['is_active'] = '0';

        if($fileName)
            $updateData['image'] = $fileName;

        DB::beginTransaction();
        try{
            $service = Service::find($id);
            $previousImage = $service->image;
            if($previousImage){
                $arr = explode('/',$previousImage);
                $previousImage = end($arr);
            }
            DB::table('services')->where('id',$id)->update($updateData);
            DB::commit();
            if($fileName)
               \File::delete('public/images/service/'.$previousImage);
            return redirect()->route('backend.index.service')->with('status',true)->with('message',__('Successfully updated service'));
        }catch(\Exception $e){
            DB::rollback();
            return redirect()->route('backend.index.service')->with('status',false)->with('message',__('Failed update service'));
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
        $Service = Service::find($request->id);
        $Service->deleted_at = date('Y-m-d H:i:s');
        if($Service->update()){
            return redirect()->route('backend.index.service')->with('status',true)->with('message',__('Successfully deleted category'));
        }else{
            return redirect()->route('backend.index.service')->with('status',false)->with('message',__('Failed delete category'));
        }
            
    }
}
