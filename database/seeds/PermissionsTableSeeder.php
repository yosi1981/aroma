<?php

use Caffeinated\Shinobi\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        //Usuarios
        Permission::create([
            'name'        => 'Navegar Usuarios',
            'slug'        => 'users.index',
            'description' => 'Lista y navega todos los usuarios del sistema',
        ]);
        Permission::create([
            'name'        => 'Ver detalle de usuario',
            'slug'        => 'users.show',
            'description' => 'Ver en detalle un usuario del sistema',
        ]);
        Permission::create([
            'name'        => 'Edicion de Usuarios',
            'slug'        => 'users.edit',
            'description' => 'Editar cualquier dato de un usuario del sistema',
        ]);
        Permission::create([
            'name'        => 'Eliminar usuario',
            'slug'        => 'users.destroy',
            'description' => 'Eliminar cualquier usuario del sistema',
        ]);
        //Roles
        Permission::create([
            'name'        => 'Navegar roles',
            'slug'        => 'roles.index',
            'description' => 'Lista y navega todos los roles del sistema',
        ]);
        Permission::create([
            'name'        => 'Crear rol',
            'slug'        => 'roles.create',
            'description' => 'Crear un rol del sistema',
        ]);
        Permission::create([
            'name'        => 'Ver detalle de un rol',
            'slug'        => 'roles.show',
            'description' => 'Ver en detalle un rol del sistema',
        ]);
        Permission::create([
            'name'        => 'Edicion de roles',
            'slug'        => 'roles.edit',
            'description' => 'Editar cualquier dato de un rol del sistema',
        ]);
        Permission::create([
            'name'        => 'Eliminar rol',
            'slug'        => 'roles.destroy',
            'description' => 'Eliminar cualquier rol del sistema',
        ]);
        //Provincias
        Permission::create([
            'name'        => 'Navegar provincias',
            'slug'        => 'provincias.index',
            'description' => 'Lista y navega todos los provincias del sistema',
        ]);
        Permission::create([
            'name'        => 'Crear provincia',
            'slug'        => 'provincias.create',
            'description' => 'Crear una provincia en el sistema',
        ]);
        Permission::create([
            'name'        => 'Ver detalle de una provincia',
            'slug'        => 'provincias.show',
            'description' => 'Ver en detalle una provincia del sistema',
        ]);
        Permission::create([
            'name'        => 'Edicion de provincias',
            'slug'        => 'provincias.edit',
            'description' => 'Editar cualquier dato de una provincia del sistema',
        ]);
        Permission::create([
            'name'        => 'Eliminar provincia',
            'slug'        => 'provincias.destroy',
            'description' => 'Eliminar cualquier provincia del sistema',
        ]);
    }
}
