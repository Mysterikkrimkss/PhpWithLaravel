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
                    <h3>Ma liste de tes ligne de frais </h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Non</th>
                                <th>Utiliser</th>
                                <th>Donner</th>
                                <th colspan="4">Les actions</th>

                                

                            </tr>
                        </thead>
                        <tbody>
                            @foreach($missions as $mission)
                            <tr>
                                <td>{{$mission->Nom}}</td>
                                <td>{{$mission->Total}}</td>
                                <td>{{$mission->donner}}</td> 

                                

                                <td><a href="{{action('LigneFraisController@edit', $mission -> ID_NOTE_DE_FRAIS)}}" class="btn btn-warning">Modifier

                                <td>
                                    <form action="{{action('LigneFraisController@destroy', $mission -> ID_NOTE_DE_FRAIS)}}" method="post">
                            @csrf
                                        <input name="_method" type="hidden" value="DELETE">
                                        <button class="btn btn-danger" type="submit">Supprimer</button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach

                            
                        </tbody>
                    </table>
                    <div><a href="{{route('listligne.create')}}">Ajouter une ligne</a></button></div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection