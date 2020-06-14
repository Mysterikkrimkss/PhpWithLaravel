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
                    <div class="container">

                        <h2>Enregistrer une nouvelle ligne de frais:</h2><br />

                        <form method="post" action="{{ route('listligne.store') }}" enctype="multipart/form-data">

                            @csrf

                            <div class="row">

                                <div class="col-md-4"></div>

                                <div class="form-group col-md-4">

                                    <label for="NOM">Nom frais:</label>

                                    <input type="text" class="form-control" name='NOM'>

                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-4"></div>

                                <div class="form-group col-md-4">

                                    <label for="frais">frais consomer:</label>

                                    <input type="text" class="form-control" name='frais'>

                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-4"></div>

                                <div class="form-group col-md-4">

                                    <label for="donner">Somme donner:</label>

                                    <input type="text" class="form-control" name='donner'>

                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-4"></div>

                                <div class="form-group col-md-4">



                                    <label for="ID_PERS">Le nom de la note de frais:</label>

                                    <select name="ID_PERS" class="form-control">
                                        @foreach($ID_PERS as $ID_PERSE)
                                        <!--<option value="{{$ID_PERSE['ID_PERSONNELS']}}"> {{$ID_PERSE['ID_PERSONNELS']}}</option>-->
                                        <option value="{{$ID_PERSE['ID_NOTE_DE_FRAIS']}}"> {{$ID_PERSE['Nom']}}</option>
                                        @endforeach



                                    </select>





                                </div>

                            </div>

                           

                            <div class="row">

                                <div class="col-md-4"></div>

                                <div class="form-group col-md-4" style="margin-top:60px">

                                    <button type="submit" class="btn btn-success">Valider</button>

                                </div>

                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection