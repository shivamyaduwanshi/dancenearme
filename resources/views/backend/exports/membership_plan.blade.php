<table>
    <thead>
    <tr>
        <th>Sr.</th>
        <th>Plan</th>
        <th>Price</th>
        <th>Recruite Bonus Amount</th>
        <th>First Generation</th>
        <th>Second Generation</th>
        <th>Third Generation</th>
        <th>Active</th>
    </tr>
    </thead>
    <tbody>
    @php $i = 1 @endphp
    @foreach ($memberships as $key => $value)
    <tr>
        <td>{{$i++}}</td>
        <td>{{$value->title}} ({{$value->sub_title}})</td>
        <td>RM {{$value->price}}</td>
        <td>RM {{$value->recruit_rm_bonus_amount}}</td>
        <td> {{$value->first_generation }} %</td>
        <td> {{$value->second_generation }} %</td>
        <td> {{$value->third_generation }} %</td>
        <td> {{$value->is_active == '1' ? 'Active' : 'Deactive' }}</td>
    </tr>
    @endforeach
    </tbody>
</table>