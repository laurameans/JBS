# JBS – Justin Bridge Services

JBS forms the connective tissue between Justin Web Services (JWS) on the server and Justin Client Services (JCS) on the client. It contains the domain transfer objects (DTOs) shared across the ecosystem. The package is written entirely in Swift 6 with strict concurrency enabled.

## Repository Structure

The Swift package exposes multiple libraries:

- **JBS** – The primary collection of DTOs and utilities.
- **JBSNews** – Models for delivering news items.
- **JBSDream** – Types used when generating imagery and interacting with external ML services.
- **JBSPay** – Representations for payment instruments and wallet functionality.

Within the `Sources/JBS` directory you will find focused modules for authentication, monitoring, distributed systems, web structures, moderation, and more. A full breakdown of each module resides in [docs/Overview.md](docs/Overview.md).

## Additional Documentation

The [docs/Overview.md](docs/Overview.md) file provides a tour through every module. Reviewing it alongside this README will furnish newcomers with a solid grasp of how the DTOs fit together.

