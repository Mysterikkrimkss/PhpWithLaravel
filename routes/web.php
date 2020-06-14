<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('admin',['middleware'=>'isadmin', function () {
    return view('admin');
}]);
Route::get('user',['middleware'=>'auth', function () {
    return view('user');
}]);

Route::resource('missions','MissionController');

Route::resource('missionsuser','MissionUserController');

Route::resource('notefrais','NoteFraisController');

Route::resource('listligne','LigneFraisController');

Route::resource('facture','FactureController');





Route::get( 'LigneFraisController@show')->name('show.show');
Route::get( 'NoteFraisController@show')->name('show.show');
//URL::route('show.show', array('ID_PERS' => '15' ));



//::get('notefrais' ,'NoteFraisController')->name('note1');

//Route::get('notefrais2','NoteFraisController@show')->name('note2');

//Route::get('note','NoteFraisController@show');

//Route::get('notefrais/{ID_MISSION}','NoteFraisController@index')->name('note');


Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');


