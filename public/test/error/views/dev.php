<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>

<h1>An error was detected</h1>
<p><b>Error code:</b> <?= $errno ?></p>
<p><b>Error text:</b> <?= $errstr ?></p>
<p><b>in file:</b> <?= $errfile ?></p>
<p><b>in string:</b> <?= $errline ?></p>

</body>
</html>