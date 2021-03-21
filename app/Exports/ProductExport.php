<?php

namespace App\Exports;
use App\Models\Product;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class ProductExport implements FromView
{

    public $data = null;

    public function __construct($data = null){
           $this->data = $data;         
    }

    public function view(): View
    {
        return view('exports.products', [
            'products' => $this->data
        ]);
    }

}
