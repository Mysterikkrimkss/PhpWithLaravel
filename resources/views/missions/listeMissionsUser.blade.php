@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard User</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif
                    <h3>Ma liste de tes missions </h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Non</th>
                                <th>Date de la mission</th>
                                <th>Le nom du visiteur</th>
                                <th colspan="4">Les actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($missions as $mission)
                            <tr>
                                <td>{{$mission->NOM1}}</td>
                                <td>{{$mission->DATE_MISSION}}</td>
                                <td>{{$mission->ID_PER_NOM}}</td> 
                                <td><a class="btn btn-primary" href="{{ action('NoteFraisController@show', $mission -> ID_MISSION ) }}">+d'info</a></td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection