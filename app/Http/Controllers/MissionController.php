<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Personnels;
use App\User;
use App\Mission;
use Illuminate\Support\Facades\DB;
class MissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $membre = auth()->user();

        $missions = $membre->missions;

        
        $Visiteurs = User::all();
        $tab = array();
        foreach($Visiteurs as $v){

            if($v['isAdmin']=='0'){
                $tab[]=$v;
            }                
        }

       

        

        return view('missions.listeMissions')->with('missions', $missions)->with('countries',$tab);



        //$ID_PERS = USER::select('NOM')->get();

            //$ID_PERS = User::select('select NOM from PERSONNELS')->get();


        //return view('missions.create',['ID_PERS'=>$ID_PERS]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

            //$ID_PERS = Mission::select('select')->distinct()->get();

            //$ID_PERS = User::select('NOM')->distinct()->get();

            //$Visiteurs = DB::table('PERSONNELS')->select('ID_PERSONNELS')->where('isAdmin')->value('0');

            //$Visiteurs = DB::table('PERSONNELS')->where('isadmin', 0);

            // $Visiteurs = User::all();
            // $tab = array();
            // foreach($Visiteurs as $v){
            //     if($v['isAdmin']= 0);
            //     $tab[]=$v;
            // }




             $Visiteurs = User::all();
             $tab = array();
             foreach($Visiteurs as $v){

                 if($v['isAdmin']=='0'){
                     $tab[]=$v;
                 }                
             }

           //$Visiteurs = User::select('select ID_PERSONNELS from PERSONNELS where isAdmin = :isAdmin', ['isAdmin' => 0]);


        return view('missions.create',['ID_PERS'=>$tab]);
        return view('missions.create',['ID_PERS2'=>$tab]);
        //return (view('missions.create'));
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $membre = auth()->user();

        $mission = new \App\Mission;

        $mission->NOM1 = $request->input('NOM');

        $mission->DATE_MISSION = $request->input('DATE_MISSION');

        $mission->ID_PER = $request->input('ID_PERS');

        $mission->ID_PER_NOM = $request->input('ID_PERS2');

        //$mission->ID_PER = $request->input('ID_PERSS');



        $mission->ID_PERSONNELS = $membre->ID_PERSONNELS;

        $mission->save();

        return redirect('missions');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $mission = \App\Mission::find($id);

        $Visiteurs = User::all();
             $tab = array();
             foreach($Visiteurs as $v){

                 if($v){
                     $tab[]=$v;
                 }                
             }


        return view('missions/edit', compact('mission', 'id'),['ID_PERS'=>$tab]);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)

    {
// edit
        $membre = auth()->user();

        $mission = \App\Mission::find($id);
        $mission->NOM1 = $request->input('NOM');

        $mission->DATE_MISSION = $request->input('DATE_MISSION');

        $mission->ID_PER = $request->input('ID_PERS');

        $mission->ID_PER_NOM = $request->input('ID_PERS2');



        $mission->ID_PERSONNELS = $membre->ID_PERSONNELS;

        $mission->save();

        return redirect('missions');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)

    {

        $mission = \App\Mission::find($id);

        $mission->delete();

        return redirect('missions');
    }
}
