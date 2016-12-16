--TEST--
Recognize basic text
--FILE--
<?php

$t = new PhpLang\Tesseract("eng");
$t->setImage(__DIR__ . '/quick-brown-fox.png');
echo $t->getUTF8Text();
--EXPECT--
The quick brown fox
jumped over the lazy dog.
