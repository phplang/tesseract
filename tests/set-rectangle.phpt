--TEST--
Limit scan to sub-section of image
--FILE--
<?php

$t = new PhpLang\Tesseract("eng");
$t->setImage(__DIR__ . '/quick-brown-fox.png');
echo "**Top\n";
$t->setRectangle(0, 0, 368, 38);
echo $t->getUTF8Text();
echo "**Bottom\n";
$t->setRectangle(0, 38, 368, 38);
echo $t->getUTF8Text();
--EXPECT--
**Top
The quick brown fox

**Bottom
jumped over the lazy dog.
