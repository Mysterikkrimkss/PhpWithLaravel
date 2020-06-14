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

                    Bienvenue !! {{ Auth::user()->NOM }}
                    <br>
                    <br>
                    <a class="btn btn-primary" href="{{ route('missionsuser.index') }}">Mission</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection