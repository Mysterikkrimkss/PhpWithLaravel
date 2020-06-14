<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    protected function redirectTo()
    {
        if (auth()->user()->role_id == 1) {
            return '/admin';
        }
        return '/user';
    }
    //protected $redirectTo = '/Welcome';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'NOM' => ['required', 'string', 'max:255'],
            'PRENOM' => ['required', 'string', 'max:255'],
            'RUE' => ['required', 'string', 'max:255'],
            'CP' => ['required', 'int'],
            'VILLE' => ['required', 'string', 'max:255'],
            'DATE_D_EMBAUCHE' => ['required', 'date', 'max:255'],
            //'email' => ['required', 'string', 'email', 'max:255', 'unique:PERSONNELS'],
            'password' => ['required', 'string','min:2'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'NOM' => $data['NOM'],
            'PRENOM' => $data['PRENOM'],
            'RUE' => $data['RUE'],
            'CP' => $data['CP'],
            'VILLE' => $data['VILLE'],
            'DATE_D_EMBAUCHE' => $data['DATE_D_EMBAUCHE'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'isAdmin' => '0'
        ]);

        
    }
}
