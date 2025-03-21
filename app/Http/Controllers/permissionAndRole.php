<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
class permissionAndRole extends Controller
{
    //

    public function role()
    {
        return Inertia::render('role',[
            'message' =>"Haimanot Belachew" ]);
}
}