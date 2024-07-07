---
title: System Architecture
nav_order: 4
---

# System Architecture Summary
{: .no_toc }

## Preface

### Version History

| Version | Date       | Description      |
|---------|------------|------------------|
| 1.0     | 2024-07-07 | Initial revision |

## Table of Contents
{: .no_toc }

- TOC
{:toc}

## Introduction

This document is written as a high-level architecture overview for the "System for Citizen-centric Human Resource Management in Smart Cities" project. It aims to provide a bird's-eye view that stakeholders can use to orient themselves with the project, complementing the more detailed [System Design Document](/system-design-document.md).

## Context

![C4 System Context Diagram](/diagrams/PBL3-2024-system-context-diagram.svg)

The "System for Citizen-centric Human Resource Management in Smart Cities" serves as a small, independently deployable piece of a smart city's ecosystem to support citizen reskilling and upskilling. The system depends on multiple external systems to achieve its functional requirements. In the event that the reference implementation is not available in a given administrative area, open standards (such as OAuth2, RSS) were utilized to make interoperability with equivalent systems as painless as possible. For modules that do not utilize open standards (e.g., USAJobs.gov), extension points were included to allow for customized integrations.

### External System Dependencies

| External System                | Purpose                                                         | Reference Implementation      |
|--------------------------------|-----------------------------------------------------------------|-------------------------------|
| Content Management System      | Managing learning material                                      | Contentful                    |
| IdAM Provider (OIDC Compliant) | User authentication and authorization                           | Auth0                         |
| Labor Statistics System        | Provide employment, unemployment, and occupation categorization | US Bureau of Labor Statistics |
| News API                       | Provide a stream of news sources to show citizens               | New York Times, DailyMail     |
| Jobs API                       | Provide an API via which the system can search for job openings | USAJobs.gov                   |

## Three-Tier Deployment Architecture

The system will follow a three-_tier_ architecture, splitting the user interface (presentation tier), backend services (application tier), and database (data tier) across three different logical host groups. This pattern was chosen for its simplicity; serverless or microservice-based architectures could lead to lower hosting costs, but the technical sophistication required to manage such infrastructure may put the system out of reach of some smaller municipalities.

The presentation and application tiers of the system are mostly stateless (completely stateless in regard to transactional data; some state is held in memory to improve performance). This allows some level of performance tuning by individually scaling each tier that would not be possible with a monolithic deployment.

![Three tier architecture diagram](/diagrams/Three%20tier%20architecture%20diagram.png)

## Presentation Tier

The presentation tier of the system consists of a single page app (SPA) implemented in Vue.js.

### Component-Based Architecture

The presentation tier follows a component-based architecture. Many of the use cases of the system are quite similar, so instead of implementing each view independently, they were instead broken down into a bag of reusable components that could then be composed into their respective views. This pattern is quite common within the Vue ecosystem, and as such is very well-supported by the framework itself. Additionally, component libraries are available to provide out of the box functionality beyond what is offered natively by the browser; the system utilizes components from PrimeVue and Vuetiful to augment its capabilities.

The following diagram shows an example component hierarchy: `NewsView` is made up of multiples `NewsCard` components, which themselves contain `Button` components that are themselves composed of `Card` and `Chip` components. Note that this diagram is simply to illustrate the concept; more complete documentation of the system's components is available in the component and view catalogs in the [System Design Document](/system-design-document.md).

![Sample component hierarchy](/diagrams/News%20Component%20Example.png)

### Model-View-ViewModel Architecture (MVVM)

The system follows Vue's recommendation to utilize MVVM for component implementation. Each component is internally split into three distinct parts: a View, a Model, and a ViewModel.

The View is conceptually the easiest to understand; it is implemented as a set of component tags (using TSX, an analogue to HTML that supports higher-level components and simplifies binding to the ViewModel) and is rendered directly to the browser as something the user can see or interact with. Examples of View elements include buttons, forms, charts, and even simple text. The View interacts with the ViewModel by emitting events on user actions, such as form submissions or button clicks.

The Model contains representations of the application's domain model. In Vue, it is generally defined using reactive state references. On modification, it emits events for the ViewModel to consume.

The ViewModel serves as a mediation layer between the View and the Model. It contains the orchestration logic that turns events emitted by the View into concrete changes to the underlying Model. It is also responsible for providing the View with updated versions of the Model when an update occurs.

![MVVM](/diagrams/MVVM%20architecture%20diagram.png)

## Application Tier

The application tier consist of a modular monolith implemented using Spring Boot. It is split into a series of vertical slices mirroring the business domains of the application, each of which internally follows a layered architecture.

![Vertical slices and internal layers of the application tier](/diagrams/pbl3-2024-application-tier-architecture.svg)

### Vertical Slice Architecture