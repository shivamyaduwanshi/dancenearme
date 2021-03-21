@if(Session::get('message'))
    <div class="alert @if(Session::get('status')) alert-success @else alert-danger @endif alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>@if(Session::get('status')) {{__('Success')}}! @else {{__('Failed')}}! @endif</strong> {{Session::get('message')}}
    </div>
@endif