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
                    <h3>Liste des frais Visteur</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Non</th>
                                <th>Le total de la note</th>

                            </tr>
                        </thead>
                        <tbody>                            
                            @foreach($facture as $mission)
                            <tr>
                                <td>{{$mission->Nom}}</td>
                                <td>{{$mission->TOTAL}}</td>
                                
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection