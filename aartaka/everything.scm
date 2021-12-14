(define-module (aartaka everything)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages django)

  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix profiles)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tor))

(use-modules (gnu)
             (gnu packages python-web)
             (gnu packages python-xyz)
             (gnu packages django)

             (guix build-system copy)
             (guix build-system python)
             (guix download)
             (guix packages)
             (guix profiles)
             ((guix licenses) #:prefix license:))

(define-public python-openapi-codec
  (package
    (name "python-openapi-codec")
    (version "1.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "openapi-codec" version))
        (sha256
          (base32 "0i91imvzwxm8r1a8jfw012vzczs0843150rnx80wclyzkql67khv"))))
    (build-system python-build-system)
    (propagated-inputs (list python-coreapi))
    (home-page "http://github.com/core-api/python-openapi-codec/")
    (synopsis "An OpenAPI codec for Core API.")
    (description "An OpenAPI codec for Core API.")
    (license license:bsd-3)))

(define-public python-itypes
  (package
    (name "python-itypes")
    (version "1.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "itypes" version))
        (sha256
          (base32 "1w8gay0yx6g7805snp3z53fy92cm2cnmln9n7lg2ljpakl96z25g"))))
    (build-system python-build-system)
    (home-page "http://github.com/PavanTatikonda/itypes")
    (synopsis "Simple immutable types for python.")
    (description "Simple immutable types for python.")
    (license license:bsd-3)))

(define-public python-coreschema
  (package
    (name "python-coreschema")
    (version "0.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "coreschema" version))
        (sha256
          (base32 "01qn9bfkklpjkr0zn6bd5fr372n1jd5p455scw4ap0nl0xh500wm"))))
    (build-system python-build-system)
    (arguments `(#:tests? #f))
    (propagated-inputs (list python-jinja2))
    (home-page "https://github.com/core-api/python-coreschema")
    (synopsis "Core Schema.")
    (description "Core Schema.")
    (license license:bsd-3)))

(define-public python-coreapi
  (package
    (name "python-coreapi")
    (version "2.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "coreapi" version))
        (sha256
          (base32 "1jy1zxw3zbaqjknds7q5j4lqmla1nrlljs7gl9vc05vh3z65y526"))))
    (build-system python-build-system)
    (propagated-inputs
      (list python-coreschema
            python-itypes
            python-requests
            python-uritemplate))
    (home-page "https://github.com/core-api/python-client")
    (synopsis "Python client library for Core API.")
    (description "Python client library for Core API.")
    (license license:bsd-3)))

(define-public python-django-rest-swagger
  (package
    (name "python-django-rest-swagger")
    (version "2.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "django-rest-swagger" version))
        (sha256
          (base32 "0nv8w00cfy1jic411q641kw8ljvlp4rckrp9rgkhms9pk7nsvxj8"))))
    (build-system python-build-system)
    (arguments `(#:tests? #f))
    (propagated-inputs
      (list python-coreapi
            python-djangorestframework
            python-openapi-codec
            python-simplejson))
    (home-page "https://github.com/marcgibbons/django-rest-swagger")
    (synopsis "Swagger UI for Django REST Framework 3.5+")
    (description "Swagger UI for Django REST Framework 3.5+")
    (license #f)))
