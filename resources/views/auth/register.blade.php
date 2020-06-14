@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Register') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf
 
                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Nom') }}</label>

                            <div class="col-md-6">
                                <input id="NOM" type="text" class="form-control @error('NOM') is-invalid @enderror" name="NOM" value="{{ old('NOM') }}" required autocomplete="NOM" autofocus>

                                @error('NOM')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="PRENOM" class="col-md-4 col-form-label text-md-right">{{ __('Prenom') }}</label>

                            <div class="col-md-6">
                                <input id="PRENOM" type="text" class="form-control @error('PRENOM') is-invalid @enderror" name="PRENOM" value="{{ old('PRENOM') }}" required autocomplete="PRENOM" autofocus>

                                @error('PRENOM')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="RUE" class="col-md-4 col-form-label text-md-right">{{ __('Rue') }}</label>

                            <div class="col-md-6">
                                <input id="RUE" type="text" class="form-control @error('RUE') is-invalid @enderror" name="RUE" value="{{ old('RUE') }}" required autocomplete="RUE" autofocus>

                                @error('RUE')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="CP" class="col-md-4 col-form-label text-md-right">{{ __('Code postale') }}</label>

                            <div class="col-md-6">
                                <input id="CP" type="text" class="form-control @error('CP') is-invalid @enderror" name="CP" value="{{ old('CP') }}" required autocomplete="CP" autofocus>

                                @error('CP')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="VILLE" class="col-md-4 col-form-label text-md-right">{{ __('Ville') }}</label>

                            <div class="col-md-6">
                                <input id="VILLE" type="text" class="form-control @error('VILLE') is-invalid @enderror" name="VILLE" value="{{ old('VILLE') }}" required autocomplete="VILLE" autofocus>

                                @error('VILLE')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                        <label for="DATE_D_EMBAUCHE" class="col-md-4 col-form-label text-md-right">{{ __('DATE_D_EMBAUCHE') }}</label>

                            <div class="col-md-6">
                                <input id="DATE_D_EMBAUCHE" type="date" class="form-control @error('DATE_D_EMBAUCHE') is-invalid @enderror" name="DATE_D_EMBAUCHE" value="{{ old('DATE_D_EMBAUCHE') }}" required autocomplete="DATE_D_EMBAUCHE" autofocus>

                                @error('DATE_D_EMBAUCHE')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div> 

                        

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Mot de passe') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirmation du mot de passe') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
