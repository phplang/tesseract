# Tesseract

PHP Wrapper for the [libtesseract](https://github.com/tesseract-ocr/tesseract) OCR library.

``` php
class PhpLang\Tesseract {
  // Create an OCR processor for the given language
  public function __construct(string $lang = "eng");

  // Specify the image to parse (will load from filesystem, does not support streams)
  public function setImage(string $filename): this;

  // Narrow the area of the image to process to a specified rectangle
  public function setRectangle(int $left, int $top, int $width, int $height);

  // Process the image and return the detected text
  public function getUTF8Text(): string;
}
```

Example:

``` php
echo (new PhpLang\Tesseract)->setImage("/tmp/foo.png")->getUTF8Text();
```
