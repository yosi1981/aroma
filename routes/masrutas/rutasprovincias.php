   <?php
//Provincias
Route::post('provincias/store', 'ProvinciaController@store')->name('provincias.store')
    ->middleware('permission:provincias.create');

Route::get('provincias', 'ProvinciaController@index')->name('provincias.index')
    ->middleware('permission:provincias.index');

Route::get('provincias/create', 'ProvinciaController@create')->name('provincias.create')
    ->middleware('permission:provincias.create');

Route::put('provincias/{provincia}', 'ProvinciaController@update')->name('provincias.update')
    ->middleware('permission:provincias.edit');

Route::get('provincias/{provincia}', 'ProvinciaController@show')->name('provincias.show')
    ->middleware('permission:provincias.show');

Route::delete('provincias/{provincia}', 'ProvinciaController@destroy')->name('provincias.destroy')
    ->middleware('permission:provincias.destroy');

Route::post('provincias/{provincia}/edit', 'ProvinciaController@edit')->name('provincias.edit')
    ->middleware('permission:provincias.edit');?>
