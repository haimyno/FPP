<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run()
    {
        // Create Permissions
        $permission1 = Permission::create(['name' => 'edit articles']);
        $permission2 = Permission::create(['name' => 'delete articles']);
        $permission3 = Permission::create(['name' => 'publish articles']);

        // Create Roles
        $role1 = Role::create(['name' => 'writer']);
        $role2 = Role::create(['name' => 'admin']);

        // Assign permissions to roles
        $role1->givePermissionTo($permission1);
        $role1->givePermissionTo($permission2);

        $role2->givePermissionTo($permission1);
        $role2->givePermissionTo($permission2);
        $role2->givePermissionTo($permission3);
    }
}