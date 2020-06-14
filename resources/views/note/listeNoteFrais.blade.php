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
                    <h3>Liste de Note de frais</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Non</th>
                                <th>Date note de frais</th>
                                <th>Le total de la note</th>
                                <th colspan="4">Les actions</th>

                            </tr>
                        </thead>
                        <tbody>
                            @foreach($missions as $mission)
                                <tr>
                                    <td>{{$mission->Nom}}</td>
                                    <td>{{$mission->DATE_DEPOT}}</td>
                                    <td><a class="btn btn-primary" href="{{action('LigneFraisController@show',$mission -> ID_NOTE_DE_FRAIS)}}">+d'info</a></td>
                                    <td><a href="{{action('NoteFraisController@edit', $mission -> ID_NOTE_DE_FRAIS)}}" class="btn btn-warning">Modifier</a></td>

                                    <td><form action="{{action('NoteFraisController@destroy', $mission->ID_NOTE_DE_FRAIS)}}" method="post">
                                        @csrf
                                        <input name="_method" type="hidden" value="DELETE">
                                        <button class="btn btn-danger" type="submit">Supprimer</button>
                                    </form></td>
                                </td>
                            @endforeach
                                  
                                </tr>
                        </tbody>
                    </table>
                    <div>
                        <a class="btn btn-primary" href="{{route('notefrais.create')}}">Ajouter une note de frais</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection