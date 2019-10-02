<?php

namespace components;

class Router
{
    private $router;

    public function __construct()
    {
        $this->router = App::routes();
    }

    public function run()
    {
        $uri = $this->getUri();

        foreach ($this->router as $uriPattern => $path) {

            if (preg_match("~^$uriPattern$~", $uri)) {

                $internalRoute = preg_replace("~$uriPattern~", $path, $uri);

                $segments = explode('/', $internalRoute);
                $controllerName = array_shift($segments) . 'Controller';
                $controllerName = '\controllers\\' . ucfirst($controllerName);

                $actionName = 'action' . ucfirst(array_shift($segments));

                $isGet = strpos(implode($segments), '?');
                if ($isGet === false) {
                    $parameters = $segments;
                } else {
                    $parameters = [];
                }

                $controllerObject = new $controllerName;
                $result = call_user_func_array([$controllerObject, $actionName], $parameters);

                if ($result != null) {
                    break;
                }
            }
        }
    }

    private function getUri()
    {
        if (!empty($_SERVER['REQUEST_URI'])) {
            return trim($_SERVER['REQUEST_URI'], '/');
        }
    }
}