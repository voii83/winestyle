<?php

namespace components;

class App
{
    public static function routes() {
        $routesPath = ROOT.'/config/routes.php';
        return include($routesPath);
    }

    public static function dbParams()
    {
        $routesPath = ROOT.'/config/db_params.php';
        return include($routesPath);
    }
}