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

## Business Domains

![Business domains](/diagrams/pbl3-2024-business-domains.svg)

The system is split into a collection of business domains that span its functional and non-functional requirements. These domains represent the core functionalities of the system and are the basis upon which the rest of the system's architecture was decided.

| Domain            | Description                                                   |
|-------------------|---------------------------------------------------------------|
| Analytics         | Primarily deals with clickstream analytics and reporting.     |
| Certifications    | Similar to learning material, utilizes CareerOneStop dataset. |
| Demand            | Employment target for a given occupation.                     |
| Employment        | Number of people employed in an occupation for a given year.  |
| Job Postings      | Feed of job postings relating to an occupation.               |
| Learning Material | CMS-managed learning content for citizen consumption.         |
| News              | Aggregated news articles from various open RSS feeds.         |
| Occupations       | Occupation descriptions and metadata from 2018 SOC.           |
| Unemployment      | Unemployment level for a given year.                          |
| Users             | User profiles                                                 |


## Three-Tier Deployment Architecture

The system will follow a three-_tier_ architecture, splitting the user interface (presentation tier), backend services (application tier), and database (data tier) across three different logical host groups. This pattern was chosen for its simplicity; cloud-native or microservice-based architectures could lead to lower hosting costs, but the technical sophistication required to manage such infrastructure may put the system out of reach of smaller municipalities.

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

The application tier consist of a modular monolith implemented using Spring Boot. It is split into a series of vertical slices mirroring the business subdomains of the application, each of which internally follows a layered architecture.

![Vertical slices and internal layers of the application tier](/diagrams/pbl3-2024-application-tier-architecture.svg)

### Vertical Slice Architecture

The application tier is split into vertical slices, each of which represents a business domain of the application. Each vertical slice can be considered a full service; while the application is deployed monolithically, the slices are independent and can be easily extracted into separate deployable artifacts if the need arises. Communication between slices is restricted to a well-defined interface at the business layer (see Layered Architecture below), preventing implementation details from leaking between slices.

This pattern was chosen to mitigate the inherent weaknesses of a monolithic deployment. By treating our backend as a set of independent, connected slices, we can achieve many of the organizational benefits of microservices without needing to accommodate the increased difficulty of deploying and managing them. Because each slice can be developed and tested in isolation, with minimal requirements on the other slices, this pattern enables the system's development to be easily parallelized.

![Vertical slice architecture diagram](/diagrams/PBL3-vertical-slice-architecture.svg)

### Layered Architecture

Each vertical slice of the application tier follows a traditional layered architecture. Every slice contains a presentation layer built on spring-webmvc. This presentation layer is responsible for mapping between HTTP requests and Java method invocations. Each slice also contains a business layer, which is written in pure Java and is responsible for the business logic of the system. Finally, slices that require persistent storage also contain a data access layer, which is responsible for interacting with the data tier via JDBC.

![Layered architecture](/diagrams/pbl3-2024-layered-architecture.svg)

## Data Tier

The data tier consists of a postgres database with the timescaledb extension enabled to facilitate efficient analytics ingestion and aggregation.

It contains two schemas. The `public` schema is used for standard system operation and contains all of the data generated by the system. The `careeronestop` schema mirrors the structure of the careeronestop certification dataset (described in further detail in the [System Design Document](/system-design-document.md)) and is used as a staging area to import new certifications into the system.

![Database architecture](/diagrams/pbl3-2024-database-architecture.svg)