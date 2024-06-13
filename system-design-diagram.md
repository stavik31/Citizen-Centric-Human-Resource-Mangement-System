---
title: System Design Diagrams
nav_order: 3
---

# System Design Document
{: .no_toc }

## Preface

### Version History

| Version | Date       | Description      |
|---------|------------|------------------|
| 1.0     | 2024-06-17 | Initial revision |

## Table of Contents
{: .no_toc }

- TOC
{:toc}

## Introduction

This document is written as a Software Design Document for the "System for Citizen-centric Human Resource Management in Smart Cities" project. It aims to describe how the functional and non-functional requirements documented in the [Requirements Specification](/requirements-specification.md) can be transformed into a working application by specifying both the high-level system design and low-level detailed design.

## General Overview

### System Context

![System context diagram](/diagrams/PBL3-2024-system-context-diagram.svg)

## System Architecture

The system will follow a three-tier architecture, splitting the user interface (presentation tier), backend services (application tier), and database (data tier) across three different logical host groups. Communication between the presentation and application tiers will take place using REST over HTTP.

![Three-tier architecture](/diagrams/PBL3-three-tier-architecture.svg)

Additionally, the system will interact with a variety of external actors and systems. This document contains a detailed description of each of these integrations, but the following diagram may be used as a summary view.

![System container diagram](/diagrams/PBL3-2024-system-container-diagram.svg)

### Bounded Contexts

Due to our relatively wide set of functionality, this system design loosely follows the practices of Domain-Driven-Design (DDD) to avoid the complexities presented by using a single unified model. The system is structured as a series of "vertical slices", each one dealing primarily with a single bounded context. The following table documents these bounded contexts.

| Context           | Description                                                   |
|-------------------|---------------------------------------------------------------|
| Analytics         | Primarily deals with clickstream analytics and reporting.     |
| Certifications    | Similar to learning material, utilizes careeronestop dataset. |
| Demand            | Employment target for a given occupation.                     |
| Employment        | Number of people employed in an occupation for a given year.  |
| Job Postings      | Feed of job postings relating to an occupation.               |
| Learning Material | CMS-managed learning content for citizen consumption.         |
| News              | Aggregated news articles from various open RSS feeds.         |
| Occupations       | Occupation descriptions and metadata from 2018 SOC.           |
| Unemployment      | Unemployment level for a given year.                          |

These boundaries span all three of the application tiers, but are most heavily relied upon in the application tier, where they heavily shaped the design of the system.

### Presentation Tier

The presentation tier of this system consists of a Vue single page application deployed to and served directly from a CDN.

| Purpose              | Library or Framework |
|----------------------|----------------------|
| Programming Language | Typescript           |
| App Framework        | Vue                  |
| Test Framework       | Vitest               |
| Build System         | Vite                 |

#### Component Architecture

The presentation tier is structured as a set of reusable components, which are composed into individual views that the user may interact with. A complete catalogue of components and views is available in the UI section of this document.

### Application Tier

The application tier of this system consists of a single Spring Boot service bundled as an OCI image and deployed to a managed kubernetes-based container orchestration platform.

| Purpose              | Library or Framework |
|----------------------|----------------------|
| Programming Language | Java                 |
| App Framework        | Spring + Spring Boot |
| Test Framework       | JUnit                |
| Build System         | Apache Maven         |

#### Vertical Slice Architecture

Mirroring the bounded contexts described above, the application tier will be composed of a series of "vertical slices", each of which spans the traditional presentation, business, and data layers. This aims to reduce dependencies between each bounded context to allow for independent development and testing.

![Architecture diagram displaying vertical slice architecture](/diagrams/PBL3-vertical-slice-architecture.svg)

### Data Tier

The data tier of this system consists of a single instance of Postgres managed by a cloud provider. Schema migrations will be handled using a code-based approach; the database structure will be embedded in the application-tier container and automatically applied at startup using liquibase.

| Purpose           | Library or Framework |
|-------------------|----------------------|
| Database Platform | Postgres             |
| Management Tool   | Liquibase            |

## Presentation Tier Design

### View Transition State Diagram

![view transition state diagram](/diagrams/UI_State_Diagram/UI_State_Diagram.jpg)

### View Catalogue

#### CertificationInformationView

![component diagram](/diagrams/componentDiagrams/views/CertificationInformationView.jpg)

#### CertificationView

![component diagram](/diagrams/componentDiagrams/views/CertificationView.jpg)

#### DeleteAccountView

![component diagram](/diagrams/componentDiagrams/views/DeleteAccountView.jpg)

#### DownloadReportDataView

![component diagram](/diagrams/componentDiagrams/views/DownloadReportDataView.jpg)

#### ExploreAllOccupationView

![component diagram](/diagrams/componentDiagrams/views/ExploreAllOccupationView.jpg)

#### ExploreOccupationsView

![component diagram](/diagrams/componentDiagrams/views/ExploreOccupationsView.jpg)

#### HomePageView

![component diagram](/diagrams/componentDiagrams/views/HomePageView.jpg)

#### InformationView

![component diagram](/diagrams/componentDiagrams/views/InformationView.jpg)

#### JobView

![component diagram](/diagrams/componentDiagrams/views/JobView.jpg)

#### LearningInformationView

![component diagram](/diagrams/componentDiagrams/views/LearningInformationView.jpg)

#### LearningView

![component diagram](/diagrams/componentDiagrams/views/LearningView.jpg)

#### ManageDemandView

![component diagram](/diagrams/componentDiagrams/views/ManageDemandView.jpg)

#### NewsView

![component diagram](/diagrams/componentDiagrams/views/NewsView.jpg)

#### ProfileHomePageView

![component diagram](/diagrams/componentDiagrams/views/ProfileHomePageView.jpg)

#### ProfileView

![component diagram](/diagrams/componentDiagrams/views/ProfileView.jpg)

#### ReportTypeView

![component diagram](/diagrams/componentDiagrams/views/ReportTypeView.jpg)

#### ReportsView

![component diagram](/diagrams/componentDiagrams/views/ReportsView.jpg)

#### SelectDetailedOccupationView

![component diagram](/diagrams/componentDiagrams/views/SelectDetailedOccupationView.jpg)

#### SelectMajorAndMinorGroupView

![component diagram](/diagrams/componentDiagrams/views/SelectMajorAndMinorGroupView.jpg)

### Component Catalogue
#### Breadcrumb

![component diagram](/diagrams/componentDiagrams/Breadcrumb.jpg)

#### Button

![component diagram](/diagrams/componentDiagrams/Button.jpg)

#### CertificationsDetails

![component diagram](/diagrams/componentDiagrams/CertificationsDetails.jpg)

#### CitizenHeatMap

![component diagram](/diagrams/componentDiagrams/CitizenHeatMap.jpg)

#### FormInput

![component diagram](/diagrams/componentDiagrams/FormInput.jpg)

#### JobDetails

![component diagram](/diagrams/componentDiagrams/JobDetails.jpg)

#### LearningDetails

![component diagram](/diagrams/componentDiagrams/LearningDetails.jpg)

#### NewsDetails

![component diagram](/diagrams/componentDiagrams/NewsDetails.jpg)

#### OccupationDataButton

![component diagram](/diagrams/componentDiagrams/OccupationDataButton.jpg)

#### Report

![component diagram](/diagrams/componentDiagrams/Report.jpg)

#### SelectWithTypeahead

![component diagram](/diagrams/componentDiagrams/SelectWithTypeahead.jpg)

## Application Tier Operations

{% include apidocs.md %}

{% for controller in site.apidocs_controllers %}
### {{ controller.title }}
{{ controller.content }}
{% endfor %}

### Models

{% for model in site.apidocs_models %}
#### {{ model.title }}
{{ model.content }}
{% endfor %}

## Application Tier Design

## Data Tier Design

## Operations

### getCertifications

![getCertifications sequence diagram](/diagrams/CertificationController-getCertifications-sequence.svg)

### notifyEntryPublished

![notifyEntryPublished sequence diagram](/diagrams/ContentfulController-notifyEntryPublished-sequence.svg)

### notifyEntryUnpublished

![notifyEntryUnpublished sequence diagram](/diagrams/ContentfulController-notifyEntryUnpublished-sequence.svg)

### getEmploymentBySocCode

![getEmploymentBySocCode sequence diagram](/diagrams/EmploymentController-getEmploymentBySocCode-sequence.svg)

### getJobPosting

![getJobPosting sequence diagram](/diagrams/JobPostingController-getJobPosting-sequence.svg)

### getLearningMaterial

![getLearningMaterial sequence diagram](/diagrams/LearningMaterialController-getLearningMaterial-sequence.svg)

### getNews

![getNews sequence diagram](/diagrams/NewsController-getNews-sequence.svg)

### getOccupationsBySocCode

![getOccupationsBySocCode sequence diagram](/diagrams/OccupationController-getOccupationsBySocCode-sequence.svg)

### getUnemploymentBySocCode

![getUnemploymentBySocCode sequence diagram](/diagrams/UnemploymentController-getUnemploymentBySocCode-sequence.svg)

### deleteCurrentUserProfile

![deleteCurrentUserProfile sequence diagram](/diagrams/UserController-deleteCurrentUserProfile-sequence.svg)

### getCurrentUserProfile

![getCurrentUserProfile sequence diagram](/diagrams/UserController-getCurrentUserProfile-sequence.svg)

### updateUserProfile

![updateUserProfile sequence diagram](/diagrams/UserController-updateUserProfile-sequence.svg)

### getDemand

![getDemand sequence diagram](/diagrams/DemandController-getDemand-sequence.svg)

### setDemand

![setDemand sequence diagram](/diagrams/DemandController-setDemand-sequence.svg)

## Accounts / Profiles

### U1 - Create Account
#### Activity Diagram
![Create Account](/diagrams/CreateProfile.jpg)

### U2 - Administer Account
#### Activity Diagram
![Administer Account](/diagrams/AdministerAccount.jpg)

### U3 - Edit Account Profile
#### Activity Diagram
![Edit Account Profile](/diagrams/EditAccountProfile.jpg)

### U4 - Reset Account Password

### U5 - Delete Account
#### Activity Diagram
![Delete Account](/diagrams/DeleteAccount.jpg)

### U7 - Select Job Goal
#### Activity Diagram
![Select Job Goal](/diagrams/SelectJobGoal.jpg)

## Occupations

### U6 - View Occupation Information
#### Activity Diagram
![View Occupation Information](/diagrams/ViewOcupationalInformation.jpg)

### U8 - View Unemployment Data
#### Activity Diagram
![View Unemployment Data](/diagrams/ViewUnemploymentData.jpg)

### U9 - View Occupation Trend
#### Activity Diagram
![View Occupation Trend](/diagrams/ViewOccupationTrend.jpg)

### U14 - View Occupation Demand
#### Activity Diagram
![View Occupation Demand](/diagrams/ViewOccupationDemand.jpg)

### U16 - Manage Occupation Demand
#### Activity Diagram
![Manage Occupation Demand](/diagrams/ManageOccupationDemand.jpg)

## Job Postings

### U10 - View Job Postings
#### Activity Diagram
![View Job Postings](/diagrams/ViewJobPosting.jpg)

## Certifications

### U11 - View Certifications
#### Activity Diagram
![View Certifications](/diagrams/ViewCertifications.jpg)

## Learning Material

### U12 - View Learning Material
#### Activity Diagram
![View Learning Material](/diagrams/ViewLearningMaterial.jpg)

### U13 - Manage Learning Material

#### State Diagram

```mermaid
stateDiagram-v2
  new : NEW
  synchronized : SYNCHRONIZED
  unsynchronized : SYNCHRONIZATION_FAILED
  state if_success <<choice>>

  [*] --> new
  new --> if_success
  if_success --> synchronized : received content
  if_success --> unsynchronized : error
  synchronized --> new : if content changes
  unsynchronized --> new : after 5 minutes  
```

#### Using Contentful

![Activity diagram showing the process flow for managing learning content](/diagrams/pbl3-manage-learning-material-activity-diagram.svg)

## News

### U15 - View Occupation News

### Load News

#### State Diagram

```mermaid
stateDiagram-v2
  new : NEW
  classified : CLASSIFIED
  unclassified : UNCLASSIFIED
  state if_success <<choice>>

  [*] --> new
  new --> if_success
  if_success --> classified : if classification successful
  if_success --> unclassified : if classification failed
  classified --> new : if article changes
  unclassified --> new : if article changes  
```

#### News Classification

![Activity diagram showing the process flow for news classification using doc2vec](/diagrams/pbl3-news-classification-activity-diagram.svg)

## Reporting

### U17 - View Analytics Reports
#### Activity Diagram
![View Analytics Reports](/diagrams/ViewAnalyticsReports.jpg)