dnl config.m4
PHP_ARG_WITH(tesseract, [ Whether to enable the Tesseract OCR extension ],
[  --with-tesseract[=DIR]    Where to find libtesseract and headers ])

if test "$PHP_TESSERACT" != "no"; then
  AC_MSG_CHECKING([for libtesseract])
  for i in $PHP_TESSERACT /usr/local /usr; do
    if test -f "$i/include/tesseract/baseapi.h"; then
      PHP_TESSERACT_DIR=$i
      break
    fi
  done
  if test -z "$PHP_TESSERACT_DIR"; then
    AC_MSG_ERROR([tesseract/capi.h not found])
  fi
  AC_MSG_RESULT([found in $PHP_TESSERACT_DIR])

  PHP_ADD_INCLUDE($PHP_TESSERACT_DIR/include)
  PHP_ADD_LIBRARY_WITH_PATH(tesseract, $PHP_TESSERACT_DIR/$PHP_LIB_DIR, TESSERACT_SHARED_LIBADD)

  AC_MSG_CHECKING([for libleptonica])
  for i in $PHP_TESSERACT /usr/local /usr; do
    if test -f "$i/include/leptonica/allheaders.h"; then
      PHP_LEPTONICA_DIR=$i
      break
    fi
  done
  if test -z "$PHP_LEPTONICA_DIR"; then
    AC_MSG_ERROR([leptonica/allheaders.h not found])
  fi
  AC_MSG_RESULT([found in $PHP_LEPTONICA_DIR])

  PHP_ADD_INCLUDE($PHP_LEPTONICA_DIR/include)
  PHP_ADD_LIBRARY_WITH_PATH(lept, $PHP_LEPTONICADIR/$PHP_LIB_DIR, TESSERACT_SHARED_LIBADD)

  PHP_SUBST(TESSERACT_SHARED_LIBADD)
  PHP_REQUIRE_CXX()
  PHP_NEW_EXTENSION(tesseract, tesseract.cpp, $ext_shared,, -std=c++11)
fi
