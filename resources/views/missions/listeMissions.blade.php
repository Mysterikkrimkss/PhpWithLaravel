@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard Admin</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif
                    <h3>Liste des missions</h3>
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
                                <td>{{$mission['NOM1']}}</td>
                                <td>{{$mission['DATE_MISSION']}}</td>                       
                                <td>{{$mission['ID_PER_NOM']}}</td>



                                <td><a href="{{action('MissionController@edit', $mission['ID_MISSION'])}}" class="btn btn-warning">Modifier


                                <td>
                                    <form action="{{action('MissionController@destroy', $mission['ID_MISSION'])}}" method="post">
                                        @csrf
                                        <input name="_method" type="hidden" value="DELETE">
                                        <button class="btn btn-danger" type="submit">Supprimer</button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                            
                        </tbody>
                    </table>
                    <div>
                        <a href="{{route('missions.create')}}">Ajouter un missions</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection