;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; guix.scm - GNU Guix package definition for lsm
;; Usage: guix build -f guix.scm
;;        guix shell -f guix.scm

(use-modules (guix packages)
             (guix git-download)
             (guix build-system cargo)
             ((guix licenses) #:prefix license:)
             (gnu packages crates-io)
             (gnu packages rust))

(define-public lsm
  (package
    (name "lsm")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hyperpolymath/lsm")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ndarray" ,rust-ndarray-0.15)
        ("rust-ndarray-rand" ,rust-ndarray-rand-0.14)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-rand-distr" ,rust-rand-distr-0.4)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-tracing" ,rust-tracing-0.1))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx-0.5))))
    (home-page "https://github.com/hyperpolymath/lsm")
    (synopsis "Liquid State Machine - Spiking Neural Network reservoir in Rust")
    (description
     "A Rust implementation of Liquid State Machines (spiking neural network
reservoirs) for temporal pattern recognition.  Features include 3D grid of
Leaky Integrate-and-Fire (LIF) neurons, distance-dependent connectivity,
excitatory/inhibitory neuron balance, real-time spike processing, and
synaptic plasticity (STDP).")
    (license (list license:expat license:agpl3+))))

;; Return the package for `guix build -f guix.scm`
lsm
