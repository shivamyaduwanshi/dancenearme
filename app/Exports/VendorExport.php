<?php

namespace App\Exports;
use App\User;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class VendorExport implements FromView
{
    public $data = null;

    public function __construct($data = null){
           $this->data = $data;         
    }

    public function view(): View
    {
        return view('exports.vendors', [
            'users' => $this->data
        ]);
    }
}
