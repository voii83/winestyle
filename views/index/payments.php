<?php include ROOT . '/template/header.php'; ?>
    <h1>Данные по зарплате за <?= $month ?></h1>
<?php if ($workersDataPayment) : ?>
    <?php foreach ($workersDataPayment as $item) : ?>
        <p><?= $item['name'] ?></p>
        <p><?= $item['surname'] ?></p>
        <p><?= $item['photo'] ?></p>
        <p><?= $item['payment'] ?></p>
        <hr>
    <?php endforeach; ?>
<?php else : ?>
    <p>Нет данных</p>
<?php endif;?>
<?php include ROOT . '/template/footer.php'; ?>