<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NoteFrais extends Model
{
    protected $fillable = [
        'DATE_DEPOT','Nom','ID_MISSION'
    ];


    protected $table = 'NOTE_DE_FRAIS';
    protected $primaryKey = 'ID_NOTE_DE_FRAIS';
    Public $timestamps = false;

    public function mission(){
        return $this->belongsTo(Mission::class,"ID_MISSION");
    }

    public function ligneFrais(){
        return $this->hasMany(LigneFrais::class,"ID_NOTE_DE_FRAIS");
    }
}

