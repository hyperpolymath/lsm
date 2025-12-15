;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — lsm

(ecosystem
  (version "1.0.0")
  (name "lsm")
  (type "project")
  (purpose "A Rust implementation of Liquid State Machines (spiking neural network reservoirs) for temporal pattern recognition.")

  (position-in-ecosystem
    "Part of hyperpolymath ecosystem. Follows RSR guidelines.")

  (related-projects
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "A Rust implementation of Liquid State Machines (spiking neural network reservoirs) for temporal pattern recognition.")
  (what-this-is-not "- NOT exempt from RSR compliance"))
