<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MetaKey;

class MetaKeyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $metakeys = MetaKey::whereNull('deleted_at')->orderBy('id','desc')->paginate('10');
        return view('backend.metakey.index',compact('metakeys'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.metakey.create');
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
            'key'    => 'required',
            'content'  => 'required'
        ];

        $request->validate($rules);

        $inserData = [
            'key'  => $input['key'],
            'value'  => $input['content']
        ];

        $metakey  = MetaKey::insertGetId($inserData);

        if($metakey){
            return redirect()->route('backend.index.metakey')->with('status',true)->with('message',__('Successfully added meta'));
        }else{
            return redirect()->route('backend.index.metakey')->with('status',false)->with('message',__('Failed add meta'));
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
       $metakey = MetaKey::find($id);
       return view('backend.metakey.edit',compact('metakey'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $metakey = MetaKey::find($id);
        return view('backend.metakey.edit',compact('metakey'));
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
            'key' => 'required',
            'content' => 'required'
        ];

        $request->validate($rules);
        
        $metakey  = MetaKey::find($id);
        $metakey->key = $request->key;
        $metakey->value = $request->content;

        if($metakey->update()){
            return redirect()->route('backend.index.metakey')->with('status',true)->with('message',__('Successfully updated meta'));
        }else{
            return redirect()->route('backend.index.metakey')->with('status',false)->with('message',__('Failed update meta'));
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
        $metakey = MetaKey::find($request->id);
        if($metakey->delete()){
            return redirect()->route('backend.index.metakey')->with('status',true)->with('message',__('Successfully deleted metakey'));
        }else{
            return redirect()->route('backend.index.metakey')->with('status',false)->with('message',__('Failed delete metakey'));
        }
            
    }
}
