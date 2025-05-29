# Module Overview

This document gives a high-level description of each library and submodule contained within JBS. Each module defines domain transfer objects or supporting utilities shared across Justin Web Services and Justin Client Services.

## Core Library – `JBS`

The `JBS` target houses the majority of shared types.

- **JBSCore** – Foundational structures, property wrappers, and extensions.
- **JBSAI** – Helpers for local and remote inference models.
- **JBSAuth** – DTOs surrounding authentication and user accounts.
- **JBSDistributed** – Types intended for distributed actor scenarios and cross-node communication.
- **JBSGeoSpatial** – Static geospatial data such as U.S. state definitions.
- **JBSMedia** – Representations of uploaded or remote media assets.
- **JBSMessage** – Announcements, templates, and general user messaging.
- **JBSModerate** – Reporting and moderation utilities.
- **JBSMonitor** – Structures for instrumentation, statistics, and heartbeats.
- **JBSPM** – Simple objects for project and issue tracking.
- **JBSWeb** – Structures used to describe websites and web pages.

## Additional Libraries

Other top-level targets extend functionality in focused domains.

- **JBSNews** – Exposes the `News` namespace for distributing headlines and related content.
- **JBSPay** – Provides wallet-related models for handling payments.
- **JBSDream** – Builds upon `JBS` and `JBSPay` with types aimed at image generation and machine-learning services.

## File Layout

```
Sources/
    JBS/            # Core DTO modules
    JBSNews/        # News-specific models
    JBSDream/       # Dream imagery integrations
    JBSPay/         # Payment instruments
Tests/
    JBSTests/       # Unit tests for the package
```

