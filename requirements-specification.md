---
title: Requirements Specification
nav_order: 2
---

# Software Requirements Specification
{: .no_toc }

## Preface

### Version History

| Version | Date       | Description |
| ------- | ---------- | ----------- |
| 1.0     | 2024-05-20 | Initial     |

### Document Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

Requirements in this specification are classified at three levels of aggregation to suit the needs of various readers of this document: functional or non-functional, user requirement identifier, and an optional trailing system requirement subidentifier. Unless otherwise stated, it is to be assumed that each requirement is hierarchical and that stated user-level requirements implicitly depend on the system requirements sharing the same identifier.

Functional requirements will be prefixed with "FREQ-". Non-functional requirements will be prefixed with "NREQ-".

Requirement identifiers will be proceeded by a short title. This title should be applicable to the requirement, but should not be construed as part of the requirement and exists only to improve the navigability and searchability of this document.

FREQ-0 Example User Requirement
: This denotes a functional user requirement with the id of 0

NREQ-0.0 Example System Requirement
: This denotes a non-functional system requirement with the id of 0.0. This requirement is implicitly a dependency of the non-functional user requirement NREQ-0.

### Intended Audience and Reading Suggestions

Which sections of this document are relevant to each of the following

* Developers
* Project Managers
* Marketing Staff
* End users
* Testers
* Documentation Writers

## Table of Contents
{: .no_toc }

- TOC
{:toc}

## Introduction

### Product Scope

Short description of objectives/goals

### Product Perspective

How does this fit in to the wider smart city's systems, if at all

### Product Functions

bullet point list of major features

### Use Cases

Use case diagram here

## Glossary

### General Terms

Term
: Definition

### User Classes and Characteristics

Citizen
: Definition

Smart City Manager
: Definition

System Administrator
: Definition

## User Requirements

### Functional Requirements

#### FREQ-1 - Create Account

Citizens MUST be able to register for a profile by initiating the signup process, providing necessary information, consenting to terms of use, and verifying their identity.

#### FREQ-2 - Administer Account

This system MUST be able to allow administrators to set or create a variety or rules or accounts while allowing users to reset their accounts personal details themselves.

#### FREQ-3 - Select Job Goal

Citizens MUST be shown information regarding their desired occupational goal reccomended from their current job title and choose which to pursue

#### FREQ-4 - Edit Citizen Profile

Citizens MUST be able to edit their current profile to accomodate for changes in their desired goals

#### FREQ-2 - Short Name

Natural language description of the functional requirement, one or two sentences.

### Non-Functional Requirements

#### NREQ-1 - WCAG 2 AA Compliance

The system MUST adhere to the Web Content Accessibility Guidelines (WCAG) 2.2, meeting a minimum of AA level success criteria outlined in the guidelines. Refer to Appendix A for further details.

#### NREQ-2 - Supported Devices

The system MUST provide equivalent experiences for both mobile and desktop clients.

#### NREQ-3 - Internationalization

The system MUST be able to translate displayed content into one or more languages as selected by the user.

#### NREQ-4 - Client Performance

The system MUST be usable on low-end to medium-end devices.

#### NREQ-5 - Server Performance

Any APIs presented by the system MUST be able to handle peak load without degraded performance.

#### NREQ-6 - Availability and Uptime

The system MUST achieve three nines of availability (99.9% uptime) during standard operating hours. Maintenance downtime scheduled in advance is excluded from this requirement.

#### NREQ-7 - Development Practices

The system MUST be developed using processes that follow industry standard best practices.

#### NREQ-8 - Continuous Deployment

The system SHOULD be deployed using processes that minimize human involvement.

#### NREQ-9 - Observability and Monitoring

The system SHOULD expose diagnostic logging and metrics to aide in measuring performance and business indicators.

#### NREQ-10 - Authentication

The system MUST require users to authenticate using an externalized authentication scheme, such as OAuth 2, OIDC, or SAML.

#### NREQ-11 - Authorization

The system MUST enforce Role Based Access Control (RBAC) to limit interactions with system components to only users that are authorized to do so.

#### NREQ-12 - Personally Identifiable Information

The system MUST manage citizen data in compliance with the terms of the General Data Protection Regulation (GDPR), California Consumer Protection Act (CCPA), and other similar legislation.

#### NREQ-13 - Encryption in Transit

All communication between a user and the system MUST utilize end-to-end encryption.

#### NREQ-14 - Encryption at Rest

All personally identifiable information related to citizens MUST be encrypted at rest.

#### NREQ-15 - Clickstream Analytics

The system MUST collect and ingest clickstream data for use in reports specified in FREQ-XXXX.

## System Architecture

High level architecture diagram, brief description

## System Requirements

### Functional Requirements

FREQ-1.1
: Citizens MUST be able to register for a profile in the system

FREQ-1.2
: Citizen MUST initiate the signing up process

FREQ-1.3
: Citizen MUST be prompted for their email, password, and legal name

FREQ-1.4
: Citizen MUST consent to our terms of use (eg. Must be older than 18)

FREQ-1.5
: Citizen MUST verify their identity

---

FREQ-2.1
: Admins SHOULD be able to create users to put in the system

FREQ-2.2
: Admins SHOULD be able to create a profile with an email and legal name

FREQ-2.3
: Admins MUST be able to assign security rules to the users

FREQ-2.4
: Citizens MUST be emailed a one-time link to reset their password

---

FREQ-3.1
: Citizens MUST be able to select a detailed occupation

FREQ-3.2
: Citizens MUST be shown broad occupations and detailed occupations from the major group and minor recommended from their current job

FREQ-3.3
: Citizens MUST be able to select a detailed occupatioons as a goal from a list

FREQ-3.4
: Selected goal SHOULD be saved to the user profile

---

FREQ-4.1
: Citizens MUST be able to select their current job

FREQ-4.2
: Citizens MUST be shown a list of major/minor groups of jobs and their descriptions and select one of them

FREQ-4.3
: Citizens MUST be able to drill down and select a detailed occupationo and be shown related occupations as a possible choice

FREQ-4.4
: Selected detailed occupation SHOULD be saved to the user profile

### Non-Functional Requirements

NREQ-2.1
: The system MUST provide a web interface with responsive capabilities as defined by the MDN web docs (See Appendix A).

NREQ-2.2
: The system MAY provide alternative clients, such as iOS or Android native apps.

---

NREQ-3.1
: The system MUST expose a control that allows users to select a language or locale for the user interface.

NREQ-3.2
: The system MUST at minimum support the generic English locale (en).

NREQ-3.3
: The system MUST display all static text, such as labels or prompts, in the language or locale selected by the user.

NREQ-3.4
: The system MAY display alternate dynamic content, such as news articles or job postings, in the language or locale selected by the user.

---

NREQ-4.1
: The system MUST limit the bundle size of the web interface's static content to no more than 10MB.

NREQ-4.2
: The system SHOULD support responsive images as defined by the MDN web docs (See Appendix A).

NREQ-4.3
: The system MUST achieve a Google PageSpeed **Performance** score of 80 or higher for its web interface.

---

NREQ-5.1
: All HTTP APIs presented by the system MUST maintain P95 latency not exceeding 1000ms.

NREQ-5.2
: All server-side components of the system MUST be capable of starting up in less than 60 seconds to allow for sufficient elasticity when deployed in autoscale-capable environments.

---

NREQ-7.1
: All system source code MUST be persisted in a git repository.

NREQ-7.2
: Each source code repository MUST follow trunk-based development. The `main` branch should always be in a deployable state; all feature work should take place on auxiliary branches.

NREQ-7.3
: The `main` branch of each git repository MUST enforce change controls preventing direct modification or merges.

NREQ-7.4
: Each source code repository MUST achieve at least 60% test coverage.

NREQ-7.5
: Changes to the `main` branch of each source code repository MUST be made via pull request. 

NREQ-7.6
: Pull requests SHOULD require at least two peer approvals and the successful execution of the component's test suite before being merged.

---

NREQ-9.1
: Server-side components MUST expose operational logs via STDOUT for collection by external log aggregation systems.

NREQ-9.2
: Server-side components SHOULD expose performance and operational metrics using a standardized format (e.g., Prometheus) for collection by external metrics ingestion systems.

NREQ-9.3
: Client-side components SHOULD integrate with a web or mobile monitoring solution (e.g., Raygun).

---

NREQ-10.1
: The system MUST NOT have any knowledge of user credentials, such as passwords.

---

NREQ-11.1
: The system MUST define a role for citizens and limit their access to only their own profile and public educational content.

NREQ-11.2
: The system MUST define a role for smart city managers and limit their access to only citizen aggregate data reports and demand management tooling.

---

NREQ-12.1
: The system MUST limit personally identifiable information collection to only that which is required for system operation.

NREQ-12.2
: The system MUST acquire citizen consent before collecting any analytics data on their usage of the system.

NREQ-12.3
: The system MUST provide the capability for citizens to retrieve a complete copy of all data that the system has collected about them.

NREQ-12.4
: The system MUST provide the capability for citizens to request deletion of all data that the system has collected about them.

NREQ-12.5
: Upon receiving a data deletion request, the system MUST complete it within 30 days in compliance with the terms of the GDPR.

---

NREQ-13.1
: All HTTP APIs MUST utilize TLS 1.3 or newer.

NREQ-13.2
: Private keys MUST NOT be accessible to developers of the system.

---

NREQ-14.1
: All databases containing personally identifiable information relating to a citizen MUST utilize some form of encryption at rest, either at the filesystem level or, if supported, in the database itself.

NREQ-14.2
: Encryption keys MUST NOT be accessible to developers of the system.

---

NREQ-15.1
: The system MUST expose an API for the collection of clickstream data. This data should contain at minimum the citizen's profile ID, current occupation SOC code, and identifying information about the content they interacted with.

NREQ-15.2
: Clickstream data SHOULD be indexed and aggregated for efficient querying and reporting.

NREQ-15.3
: Client-side components MUST, with citizen consent, publish clickstream data for all citizen actions in the system to the API described in NREQ-15.1.

## System Models

C4 Models Here

## System Evolution

### Assumptions

### Anticipated Changes

## Appendix A: References

* [2018 Standard Occupational Classification System (SOC)](https://www.bls.gov/soc/2018/)
* [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/)
* [MDN Web Docs - Responsive Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
* [MDN Web Docs - Responsive Images](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)
