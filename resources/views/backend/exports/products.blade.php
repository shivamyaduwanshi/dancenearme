<table>
    <thead>
    <tr>
        <th>Sr.</th>
        <th>Title</th>
        <th>Type</th>
        <th>Worth</th>
        <th>Coupon Code</th>
        <th>Limitation</th>
        <th>Start Date</th>
        <th>End Date</th>
        <td>Marchant</td>
        <td>Email</td>
        <td>Phone</td>
        <th>Status</th>
        <th>Shop name</th>
        <th>Shoplink</th>
        <th>Shop start time</th>
        <th>Shop end time</th>
        <th>Address</th>
        <th>City</th>
        <th>Zip code</th>
        <th>Created Date</th>
    </tr>
    </thead>
    <tbody>
    @php $i = 1 @endphp
    @foreach($products as $key => $product)
        <tr>
            <td>{{$i++}}</td>
            <td>{{ $product->title }}</td>
            <td>{{ $product->type == '1' ? 'Gift' : '-' }}</td>
            <td>{{ $product->price }}</td>
            <td>{{ $product->coupon_code ?? '-' }}</td>
            <td>{{ $product->limitation  ?? '-' }}</td>
            <td>{{ date('Y m d',strtotime($product->start_date)) }}</td>
            <td>{{ date('Y m d',strtotime($product->end_date)) }}</td>
            <td>{{ $product->name }}</td>
            <td>{{ $product->email }}</td>
            <td>{{ $product->phone }}</td>
            <td>{{ $product->is_active == '1' ? 'Active' : 'Deactive' }}</td>
            <td>{{ $product->shop_name }}</td>
            <td>{{ $product->shop_link }}</td>
            <td>{{ date('h:i A',strtotime($product->shop_start_time)) }}</td>
            <td>{{ date('h:i A',strtotime($product->shop_end_time)) }}</td>
            <td>{{ $product->address }}</td>
            <td>{{ $product->city }}</td>
            <td>{{ $product->zip_code }}</td>
            <td>{{ date('Y M d',strtotime($product->created_at)) }}</td>
        </tr>
    @endforeach
    </tbody>
</table>