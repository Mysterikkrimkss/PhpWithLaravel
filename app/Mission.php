<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class mission extends Model
{
    //

    public function user(){
        return $this->belongsTo(User::class,"ID_PERSONNELS");
    }

    public function user2(){
        return $this->hasMany(User::class, 'ID_PERSONNELS');
        }

   

    public function notefrais(){
        return $this->hasMany(NoteFrais::class,"ID_MISSION");
    }

    protected $fillable = [
        'NOM1','DATE_MISSION','ID_PER','ID_PER_NOM'
    ];


    protected $table = 'MISSION';
    protected $primaryKey = 'ID_MISSION';
    Public $timestamps = false;
}
