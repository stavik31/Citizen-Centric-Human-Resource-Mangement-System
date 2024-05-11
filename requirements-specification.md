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
#### FREQ-2 - Administer Account
#### FREQ-3 - Select Job Goal
#### FREQ-4 - Edit Citizen Profile

Natural language description of the functional requirement, one or two sentences.

#### FREQ-2 - Short Name

Natural language description of the functional requirement, one or two sentences.

### Non-Functional Requirements

#### NREQ-1 - WCAG 2 AA Compliance

The system MUST adhere to the Web Content Accessibility Guidelines (WCAG) 2.2, meeting a minimum of AA level success criteria outlined in the guidelines. Please refer to Appendix A for further details.

#### NREQ-2 - Supported Devices

The system MUST provide equivalent experiences for both mobile and desktop clients.

#### NREQ-3 - Internationalization

The system MUST be able to translate displayed content into one or more languages as selected by the user.

## System Architecture

High level architecture diagram, brief description

## System Requirements

### Functional Requirements

FREQ-1.1
: Citizens must be able to register for a profile in the system

FREQ-1.2
: Citizen must initiate the signing up process

FREQ-1.3
: Citizen must be prompted for their email, password, and legal name

FREQ-1.4
: Citizen must consent to our terms of use (eg. Must be older than 18)

FREQ-1.5
: Citizen must verify their identity

FREQ-2.1
: Admins should be able to create users to put in the system

FREQ-2.2
: Admins should be able to create a profile with an email and legal name

FREQ-2.3
: Admins must be able to assign security rules to the users

FREQ-2.4
: Citizens must be emailed a one-time link to reset their password

FREQ-3.1
: Citizens must be able to select a SOC code/Job title

FREQ-3.2
: Citizens must be shown SOC codes recommended from their current job

FREQ-3.3
: Citizens must be able to select a SOC code as a goal from a list

FREQ-3.4
: Selected goal should be saved to the user profile

FREQ-4.1
: Citizens must be able to select their current job

FREQ-4.2
: Citizens must be shown a list of high level SOC codes (titles and descriptions) and select one of them

FREQ-4.3
: Citizens must be able to drill down and select a low level SOC code and be shown related SOC codes as a possible choice

FREQ-4.4
: Selected SOC code should be saved to the user profile

### Non-Functional Requirements

NREQ-3.1
: The system MUST expose a control that allows users to select a language or locale for the user interface.

NREQ-3.2
: The system MUST at minimum support the generic English locale (en).

NREQ-3.3
: The system MUST display all static text, such as labels or prompts, in the language or locale selected by the user.

NREQ-3.4
: The system MAY display alternate dynamic content, such as news articles or job postings, in the language or locale selected by the user.


## System Models

C4 Models Here

## System Evolution

### Assumptions

### Anticipated Changes

## Appendix A: References

* [2018 Standard Occupational Classification System (SOC)](https://www.bls.gov/soc/2018/)
* [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/)
