<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Personnels extends Model
{
    //
    protected $fillable = [
        'NOM',
    ];



    protected $table = 'PERSONNELS';
    protected $primaryKey = 'ID_PERSONNELS';
    Public $timestamps = false;
}
