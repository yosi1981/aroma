<?php

use Faker\Generator as Faker;

$factory->define(App\Provincia::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
    ];
});
