<?php

namespace models;

use components\Db;

class Worker
{
    public static function getWorkersDataPayment($month)
    {
        $workersDataPayment = [];
        $db = Db::getConnection();
        $sql = 'SELECT workers.id, workers.name, workers.surname, workers.photo, payments.payment
                FROM workers
                LEFT JOIN payments ON payments.id_worker = workers.id
                WHERE payments.month = ' . $month;

        $result = $db->query($sql);
        $i = 0;
        $result->setFetchMode(\PDO::FETCH_ASSOC);

        while ($row = $result->fetch()) {
            $workersDataPayment[$i]['id'] = $row['id'];
            $workersDataPayment[$i]['name'] = $row['name'];
            $workersDataPayment[$i]['surname'] = $row['surname'];
            $workersDataPayment[$i]['photo'] = $row['photo'];
            $workersDataPayment[$i]['payment'] = $row['payment'];
            $i++;
        }
        return $workersDataPayment;
    }
}