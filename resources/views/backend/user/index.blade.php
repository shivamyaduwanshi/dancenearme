@extends('backend.layouts.loggedIn')

@section('title') {{__('User List')}} @endsection

@section('content')
<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">{{__('Users')}} ({{$data['users']->total()}})</h3>
    </div>
</div>

@include('backend.components.alert')

<div class="row">
    <div class="col-md-12">
         <form class="form-inline">
              <input type="search" class="form-control" placeholder="{{__('Search by name,phone,email')}}" value="{{Request::get('search')}}" name="search" />
              <select class="form-control" name="status"><option value="">{{__('All')}}</option><option @if(Request::get('status') == 'active') selected @endif value="active">{{__('Active')}}</option><option @if(Request::get('status') == 'deactive') selected @endif value="deactive">{{__('Deactive')}}</option></select>
              <a href="{{route('backend.index.user')}}" class="btn btn-default">{{__('Clear')}}</a>
              <input type="submit" class="btn btn-primary" value="{{__('Submit')}}"/>
              <a href="{{route('backend.export.user',['search'=>Request::get('search'),'status'=>Request::get('status')])}}" class="btn btn-primary">{{__('Export')}}</a>
         </form>
    </div>
</div>
<br/>
<div class="row">
    <div class="col-lg-12">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                    <tr>
                        <th>{{__('Sr')}}.</th>
                        <th>{{__('Name')}}</th>
                        <th>{{__('Phone')}}</th>
                        <th>{{__('Email')}}</th>
                        <th>{{__('Status')}}</th>
                        <th>{{__('Action')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @php $i = $data['users']->perPage() * ($data['users']->currentPage() - 1); @endphp
                    @foreach ($data['users'] as $key => $value)
                        <tr class="odd gradeX">
                            <td>{{++$i}}</td>
                            <td>{{$value->name ?? '-'}}</td>
                            <td>{{$value->phone ?? '-'}}</td>
                            <td class="center">{{$value->email ?? '-'}}</td>
                            <td class="center">{{$value->is_active == '1' ? __('Active') : __('Deactive') }}</td>
                            <td>
                                <a href="{{route('backend.show.user',$value->id)}}" class="btn btn-sm btn-primary">{{__('Info')}}</a>
                                <button class="btn btn-sm btn-danger btn-dlt" data-id="{{$value->id}}">{{__('Delete')}}</button>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-md-12 text-right">
        {{ $data['users']->links() }}
    </div>
</div>

 <!-- Modal -->
 <div class="modal fade" id="deleteModal" role="dialog">
    <div class="modal-dialog modal-md">
        <form class="form" action="{{route('backend.delete.user')}}" method="POST">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">{{__('Delete user')}}</h4>
        </div>
        <div class="modal-body">
                @csrf
                {{ method_field('DELETE') }}
                 <input type="hidden" name="id" value="">
                 <div class="form-group">
                      <textarea class="form-control" name="reason" placeholder="{{__('Why are you delete this user account?(Optional)')}}"></textarea>
                 </div>
                 <label><input type="checkbox" checked name="is_notify" value="1"/>&nbsp;&nbsp;&nbsp;{{__('Notify to user')}}</label>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
          <input type="submit" class="btn btn-danger" value="{{__('Delete')}}" />
        </div>
      </div>
    </form>
    </div>
  </div>
</div>

@endsection
@push('js')
   <script>
       $('.btn-dlt').on('click',function(e){
          $('#deleteModal').modal('show');
          $('#deleteModal input[name="id"]').val($(this).attr('data-id'));
       });
   </script>
@endpush
