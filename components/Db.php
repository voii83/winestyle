<?php

namespace components;

class Db
{
	public static function getConnection()
	{
		$params = App::dbParams();
		$dsn = "mysql:host={$params['host']};dbname={$params['dbname']}";
		$db = new \PDO($dsn, $params['user'], $params['password']);

		return $db;
	}
}