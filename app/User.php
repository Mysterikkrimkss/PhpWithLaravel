<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'MATRICULE','NOM','PRENOM','RUE','CP','VILLE','DATE_D_EMBAUCHE','email', 'password','isAdmin',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function isAdmin(){
        return $this->isAdmin;
    }

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public $table = 'PERSONNELS';
    protected $primaryKey = 'ID_PERSONNELS';
    Public $timestamps = false;

    public function missions(){
        return $this->hasMany(Mission::class,"ID_PERSONNELS");
    }

    public function countries(){
        return $this->belongsTo(Mission::class, 'ID_PERSONNELS');
              }

    
    

}
