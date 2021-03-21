@extends('backend.layouts.loggedIn')

@section('title') {{ __('Add Dance')}} @endsection

@section('content')

<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">{{__('Config List')}}</h3>
    </div>
</div>

    <div class="main-body">
           @include('backend.components.alert')
           <!-----START searching box--------->
          <section class="searching-filter">
            <form method="GET">
              <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="input">
                        <input type="text" placeholder="Search by key" name="key" class="form-control" value="{{Request::get('key')}}">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                  <div class="filter-btn">
                    <a class="button btn btn-default" href="{{route('backend.index.config')}}">Clear</a>
                    <button class="button btn btn-primary" type="submit">Submit</button>
                  </div>
                </div>
              </div>
            </form>
          </section>
          <!-----END searching box--------->

          <br>

          <div class="inner-body">
            <!--header-->
            <div class="header">
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="title">
                  </div>
                </div>
              </div>
            </div><!--END header-->

            <!--my tenders-->
            <div class="supplier-request table-responsive">
                <table class="table table-striped">
                  <tr>
                     <thead>
                        <th>Sr.</th> 
                        <th>Config Key</th>
                        <th>Action</th>
                     </thead>
                     <tbody>
                        @php $i = 1 @endphp
                        @foreach($data['config'] as $key => $config)
                           <tr>
                             <td>{{$i++}}</td>
                             <td>{{$config->key}}</td>
                             <td>
                                <a href="{{route('backend.show.config',$config->id)}}" class="btn edit-btn">Edit</a>
                             </td>
                           </tr>
                        @endforeach
                     </tbody>
                  </tr>
                </table>
            </div><!--END my tenders-->

          </div>  
        </div>
@endsection
@push('css')
{{--  <style type="text/css">
   table tbody tr td{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
   }
 </style> --}}
@endpush
@push('js')
@endpush