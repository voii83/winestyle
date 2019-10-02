<?php

namespace controllers;

use models\Worker;

class IndexController
{
	public function actionIndex()
	{
		require_once(ROOT.'/views/index/index.php');
		return true;
	}

    public function actionPayments($month)
    {
        $workersDataPayment = Worker::getWorkersDataPayment($month);
        require_once(ROOT.'/views/index/payments.php');
        return true;
    }
}