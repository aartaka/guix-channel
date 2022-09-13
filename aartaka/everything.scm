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


(use-modules
   (gnu packages)
   (guix gexp)
   ((guix licenses) #:prefix license:)
   (guix packages)
   (guix download)
   (guix git-download)
   (guix hg-download)
   (guix utils)
   (guix build-system asdf)
   (guix build-system gnu)
   (guix build-system trivial)
   (gnu packages base)
   (gnu packages c)
   (gnu packages compression)
   (gnu packages databases)
   (gnu packages enchant)
   (gnu packages figlet)
   (gnu packages file)
   (gnu packages fonts)
   (gnu packages fontutils)
   (gnu packages game-development)
   (gnu packages gl)
   (gnu packages glib)
   (gnu packages gnome)
   (gnu packages gnupg)
   (gnu packages gtk)
   (gnu packages image)
   (gnu packages imagemagick)
   (gnu packages libevent)
   (gnu packages libffi)
   (gnu packages linux)
   (gnu packages lisp)
   (gnu packages lisp-xyz)
   (gnu packages lisp-check)
   (gnu packages maths)
   (gnu packages mp3)
   (gnu packages mpi)
   (gnu packages ncurses)
   (gnu packages networking)
   (gnu packages package-management)
   (gnu packages pkg-config)
   (gnu packages python)
   (gnu packages python-xyz)
   (gnu packages readline)
   (gnu packages sdl)
   (gnu packages serialization)
   (gnu packages sqlite)
   (gnu packages statistics)
   (gnu packages tcl)
   (gnu packages tls)
   (gnu packages version-control)
   (gnu packages video)
   (gnu packages web)
   (gnu packages webkit)
   (gnu packages xdisorg)
   (gnu packages xml)
   (gnu packages xorg)
   (ice-9 match)
   (srfi srfi-1)
   (srfi srfi-19))

(define-public sbcl-njson
  (package
    (name "sbcl-njson")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atlas-engineer/njson")
             (commit version)))
       (file-name (git-file-name "cl-njson" version))
       (sha256
        (base32 "1f7s9g5s9riyyrbj8lyvzlvymdbh9x9sknxmjzfrkbz3iqlpanc3"))))
    (build-system asdf-build-system/sbcl)
    (inputs
     (list sbcl-cl-json))
    (native-inputs
     (list sbcl-lisp-unit2))
    (home-page "https://github.com/atlas-engineer/njson")
    (synopsis
     "JSON (JavaScript Object Notation) handling framework for Common Lisp.")
    (description
     "NJSON aims to make it convenient for one to decode, encode,
and process JSON data, in the minimum keystrokes/minutes possible.

NJSON is parser-independent, with existing Common Lisp JSON parsers being
loadable as additional system.  @code{cl-json} is included by default, though.
Conveniences that NJSON provides are:

@itemize

@item @code{encode} and @code{decode} as single entry points for JSON reading
and writing, be it from streams/string/files, or from those.

@item @code{jget}, @code{jrem}, @code{jtruep}, and their aliases to
access/delete the decoded objects' properties and check their truth value
without the need to worry about the low-level details of how these values are
decoded.

@item @code{jif}, @code{jwhen}, @code{jor}, @code{jand}, and other macros
mimicking Lisp ones, while using truth values of JSON-decoded data.

@end itemize\n")
    (license license:bsd-3)))

(define-public cl-njson
  (sbcl-package->cl-source-package sbcl-njson))

(define-public ecl-njson
  (sbcl-package->ecl-package sbcl-njson))

(define-public sbcl-nactivitypub
  (package
    (name "sbcl-nactivitypub")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/atlas-engineer/nactivitypub")
             (commit version)))
       (file-name (git-file-name "cl-nactivitypub" version))
       (sha256
        (base32 "1f7s9g5s9riyyrbj8lyvzlvymdbh9x9sknxmjzfrkbz3iqlpanc3"))))
    (build-system asdf-build-system/sbcl)
    (inputs
     (list
      sbcl-cl-json
      sbcl-serapeum
      sbcl-cl-str
      sbcl-local-time
      sbcl-lparallel
      sbcl-dexador
      sbcl-quri))
    (home-page "https://github.com/atlas-engineer/nactivitypub")
    (synopsis
     "Common Lisp Implementation of ActivityPub and ActivityStreams standards.")
    (description
     "Features:
@itemize

@item Parsing and un-parsing ActivityStreams JSON-LD objects to/from CLOS
objects with convenient accessors on those.

@item Sending and fetching ActivityStreams objects to/from the
ActivityStreams-enabled HTTP(S) URLs.

@item Semantic info extraction with methods like @code{name*}, @code{url*},
@code{author*}, and @code{published*}.

@item No reliance on JSON parser. @code{njson} is used for parser-independent
JSON handling. Load the parser backend you prefer!

@end itemize")
    (license license:bsd-3)))

(define-public cl-nactivitypub
  (sbcl-package->cl-source-package sbcl-nactivitypub))

(define-public ecl-nactivitypub
  (sbcl-package->ecl-package sbcl-nactivitypub))
