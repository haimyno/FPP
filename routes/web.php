<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\permissionAndRole;

Route::get('/', function () {
    return Inertia::render('welcomee');
})->name('home');
Route::middleware(['auth', 'verified'])->group(function () {
    //Route::get('role', function () { return Inertia::render('role');})->name('role');
    Route::get('/role', [permissionAndRole::class, 'role']);
});
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', function () {
        return Inertia::render('dashboarde');
    })->name('dashboard');
});

require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
