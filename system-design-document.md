---
title: System Design Document
nav_order: 3
---

# System Design Document
{: .no_toc }

## Preface

### Version History

| Version | Date       | Description      |
|---------|------------|------------------|
| 1.0     | 2024-06-17 | Initial revision |
| 1.1     | 2024-07-08 | Gamification     |

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

This section of the document describes the general architecture of the system and lists architectural patterns that the overarching design or specific components will follow. It takes a high-level view of the system and is suitable for orientation; more specific details are available in the documentation for the individual tiers.

### System Tiers and General Architecture

The system will follow a three-tier architecture, splitting the user interface (presentation tier), backend services (application tier), and database (data tier) across three different logical host groups.

The presentation tier will consist of a single page application (SPA) written primarily using Vue.js. It will be structured following a **component-based architecture**, wherein interactable elements are defined as reusable **Components**, which are then composed into **Views** that implement one or more use cases.

Between the presentation and application tiers, a virtual tier henceforth referred to as the HTTP Application Programming Interface (API) exists. While this is physically part of the application tier, it can logically be considered the bridge between the presentation and application tiers. It provides a set of **Operations** that are implemented by the application tier and consumed by the presentation tier to power the various views and components of the latter.

The application tier will consist of a modular monolith written primarily using Spring Boot. Internally, it will follow a **three-layer architecture**: a presentation layer utilizing spring-web-mvc, an application layer written primarily in plain Java, and a data-access layer implemented via spring-data.

The data tier will consist of an instance of Postgres with the `timescaledb` extension enabled to facilitate high-performance analytics ingestion and processing.

![Three-tier architecture](/diagrams/PBL3-three-tier-architecture.svg)

### Vertical Slicing

Due to the wide array of domain objects needed to meet the functional requirements of the system, treating individual tiers as monolithic blocks presents significant organizational challenges in the implementation and maintenance of the system. While the presentation tier is able to achieve loose coupling due to its component-based architecture, the same cannot be said for the application tier. Were it to be designed as a single model, significant time would be lost to inter-developer interference. A microservice architecture could be utilized to work around these constraints, but due to the limited development period afforded to this project it is impossible to achieve the process maturity required to deploy and monitor a large number of services.

Despite these limitations, some benefit can still be obtained by loosely following the practices of **Domain-Driven-Design**. Instead of treating the application tier as a single, unified model, this system design instead splits the domain into a set of bounded contexts, each of which is isolated in its own **vertical slice**.

| Context           | Description                                                   |
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

To achieve the full benefits of domain-driven-design, it is important to enforce design constraints around inter-domain communication to limit coupling. Each vertical slice may only interact with its peers at a particular layer, in this case the application business layer.

![Architecture diagram displaying vertical slice architecture](/diagrams/PBL3-vertical-slice-architecture.svg)

By siloing each bounded context and providing strict guidelines around inter-domain communication, the system can be effectively developed in parallel; each domain is small enough to be implemented by a single developer and can be tested completely in isolation.

### Illustrative Example

To better understand the design language used in the remainder of this document, let's look at an illustrative example. This example will show the full end-to-end structure of a single operation within the fictitious *Example* bounded context and the process we could take to learn more about specific parts of it.

As mentioned above, the presentation tier consists of a set of loosely coupled **Components** which are composed into **Views**. In this case, we will focus on the *ExampleView*, which has a dependency on the **Operation** *getExample()*. Were this a real view, it could be found in the [View Catalogue](#view-catalog) and would be diagrammed similar to the following:

![Example of a view component](/diagrams/PBL3-2024-operation-architecture-presentation-tier.svg)

To trace this into the application tier, we will next look to the [HTTP API](#http-api) section. Within this section, we will look for the *ExampleController* subsection (these will generally follow the pattern `<BoundedContext>Controller`), which will contain a UML class diagram showing the structure of the application tier implementation of this **Operation**. Scrolling down to the specific operation, in this case `getExample()`, we will find a UML sequence diagram showing how these classes interact. Putting this all together, we reach the following structure:

![Example of a full operation end-to-end](/diagrams/PBL3-2024-operation-architecture.svg)

Having read these sections, we should now have a good understanding of how the operation is defined both structurally and procedurally, but we may not yet have a full understanding of the internal behaviour of the classes. If a bounded context is non-trivial, additional implementation details will be available in the [Application Tier Design](#application-tier-design) and [Data Tier Design](#data-tier-design) sections of the document.

### System Boundaries and External Interfaces

The boundary of the system contains all three physical tiers of the application, as well as the virtual HTTP API tier. The system provides two interfaces through which external systems and entities can interact with it; a visual interface referred to as the **Web Frontend** for consumption by humans, and a machine-to-machine interface referred to as the **HTTP API** for consumption by external systems.

Additionally, the system integrates with a variety of third party services using their APIs. Details about these integrations can be found in the [External Interfaces](#external-interfaces) section of this document.

![System container diagram](/diagrams/PBL3-2024-system-container-diagram.svg)

## Operational Scenarios

This section describes scenarios that show how the system will be utilized to meet its functional requirements. Each scenario is illustrated by a use case.

### Overview

![Use Case Diagram](/diagrams/use-case-diagram-SRS.svg)

| Number | Name                            | Description                                                                                                             | Associated FREQ   |
|--------|---------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------------|
| U1     | Create Account                  | Register an account on the system                                                                                       | FREQ-1            |
| U2     | Administer Account              | Administer an account and assign a role                                                                                 | FREQ-2            |
| U3     | Edit Account Profile            | Edit profile to change profile information such as legal name, occupation, location                                     | FREQ-3            |
| U4     | Reset Account Password          | Reset and recover account's password                                                                                    | FREQ-4            |
| U5     | Delete Account                  | Delete account from the system                                                                                          | FREQ-5            |
| U6     | View Occupation Information     | View general information about each occupation, such as a title, description, and illustrative examples                 | FREQ-6 - FREQ-7   |
| U7     | Select Goal Job                 | Select an occupation as the preferred goal job                                                                          | FREQ-8, FREQ-6    |
| U8     | View Unemployment Data          | View historical unemployment data                                                                                       | FREQ-9            |
| U9     | View Occupation Trend           | View historical data and estimated trend forecast for a given occupation                                                | FREQ-10, FREQ-6   |
| U10    | View Job Postings               | View job postings for a given occupation                                                                                | FREQ-11, FREQ-6   |
| U11    | View Certifications Information | View applicable certifications for a given occupation                                                                   | FREQ-12, FREQ-6   |
| U12    | View Learning Material          | View applicable online learning material for a given occupation                                                         | FREQ-13, FREQ-6   |
| U13    | Manage Learning Material        | Create, update, remove online learning material for a given occupation on the system                                    | FREQ-14, FREQ-6   |
| U14    | View Occupation Demands         | View the targeted change in employment for a given occupation                                                           | FREQ-16, FREQ-6   |
| U15    | View Occupation News            | View news from various sources associated with a given occupation                                                       | FREQ-15, FREQ-6   |
| U16    | Manage Occupation Demands       | Set demand targets for a given occupation                                                                               | FREQ-17, FREQ-6   |
| U17    | View Analytics Report           | View a generated report on aggregated data of citizens' information and engagement activity with content on the website | FREQ-18 - FREQ-32 |
| U18    | Load News                       | Automatically pull news from RSS feeds                                                                                  | FREQ-37           |
| U19    | Load Unemployment               | Automatically pull unemployment data from the BLS public data API                                                       | FREQ-35           |
| U20    | Load Certifications             | Import the careeronestop certification dataset                                                                          | FREQ-36           |
| U21    | Load SOC Datasets               | Import SOC definitions and yearly employment statistics                                                                 | FREQ-33, FREQ-34  |
| U22    | Gamification                    | Incentivize the user to interact with site elements                                                                     | FREQ-38 - FREQ-39 |

### U1 - Create Account

System allows for users to start the signup process by collecting their email, password, full name, and postal code. Password strength is used while users receive feedback on password strength as they enter it. Finally, user consent is received as their account is created by redirecting them to the systems home page.

![use case diagram](/diagrams/usecaseDiagrams/U1%20-%20Create%20Account.svg)

#### Activity Diagram
![Create Account](/diagrams/PBL3ActivityDiagrams/CreateProfile.jpg)

### U2 - Administer Account

System allows for system administrators to create new user accounts and can link these accounts to an email, legal name, and optionally a postal code. Administrative users can also assign roles such as "citizen" or "smart city manager." Once an account has been created in this way, a one-time password reset link is send for users to change their password.

![use case diagram](/diagrams/usecaseDiagrams/U2%20-%20Administer%20Account.svg)

#### Activity Diagram

![Administer Account](/diagrams/PBL3ActivityDiagrams/AdministerAccount.jpg)

### U3 - Edit Account Profile

System allows existing users to modify their legal name, current occupation, postal code, and password.

![use case diagram](/diagrams/usecaseDiagrams/U3%20-%20Edit%20Account%20Profile.svg)

#### Activity Diagram

![Edit Account Profile](/diagrams/PBL3ActivityDiagrams/EditAccountProfile.jpg)

### U4 - Reset Account Password

System allows users to select a “Forgot Password” link on the login page for users who need to recover their password. Clicking this link directs users to a password recovery page, where auth0 takes resposibility in leading users in the password reset/recovery process.

![use case diagram](/diagrams/usecaseDiagrams/U4%20-%20Reset%20Account%20Password.svg)

#### Activity Diagram

![Reset Account Password](/diagrams/ResetAccountPassword.jpg)

### U5 - Delete Account

System allows users to select "delete account" where auth0 takes responsibility in leading the deletion process and notifying users of success or failure

![use case diagram](/diagrams/usecaseDiagrams/U5%20-%20Delete%20Account.svg)

#### Activity Diagram

![Delete Account](/diagrams/PBL3ActivityDiagrams/DeleteAccount.jpg)

### U6 - View Occupation Information

System allows users to navigate SOC occupation levels starting from a broad overview of all occupations and narrowing down to detailed occupations. Each level would include titles, descriptions, examples, and additional content relevant to the user's role while displaying statistical content (InformationView)

![use case diagram](/diagrams/usecaseDiagrams/U6%20-%20View%20Occupation%20Information.svg)

#### Activity Diagram

![View Occupation Information](/diagrams/PBL3ActivityDiagrams/ViewOcupationalInformation.jpg)

### U7 - Select Job Goal

System allows users to set their career goal by navigating through all SOC occupation levels (Major Group, Minor Group, Broad Occupation, Detailed Occupation). When a user decides on a goal and selects a occupation, the chosen career goal is saved to their profile.

![use case diagram](/diagrams/usecaseDiagrams/U7%20-%20Select%20Job%20Goal.svg)

#### Activity Diagram

![Select Job Goal](/diagrams/PBL3ActivityDiagrams/%20SelectJobGoal.jpg)

### U8 - View Unemployment Data

Smart city managers have the capability to access historical unemployment data as a line graph through exploring all occupations listed on the system.

![use case diagram](/diagrams/usecaseDiagrams/U8%20-%20View%20Unemployment%20Data.svg)

#### Activity Diagram

![View Unemployment Data](/diagrams/PBL3ActivityDiagrams/ViewUnemploymentData.jpg)

### U9 - View Occupation Trend

System allows users to view employment trends by exploring the SOC occupational levels.

![use case diagram](/diagrams/usecaseDiagrams/U9%20-%20View%20Occupation%20Trend.svg)

#### Activity Diagram

![View Occupation Trend](/diagrams/PBL3ActivityDiagrams/ViewOccupationTrend.jpg)

### U10 - View Job Postings

System allows users to view job postings by exploring the SOC occupational levels and each job listing is clickable, redirecting users to an external webpage for more information.

![use case diagram](/diagrams/usecaseDiagrams/U10%20-%20View%20Job%20Postings.svg)

#### Activity Diagram

![View Job Postings](/diagrams/PBL3ActivityDiagrams/ViewJobPosting.jpg)

### U11 - View Certification Information

System allows users to view certification information by exploring the SOC occupational levels and displays essential information about each certification, including a title and description. Addtionally, users can click on each certification to be redirected to a separate page where more information and an external webpage url for the certification is given.

![use case diagram](/diagrams/usecaseDiagrams/U11%20-%20View%20Certification%20Information.svg)

#### Activity Diagram

![View Certifications](/diagrams/PBL3ActivityDiagrams/ViewCertifications.jpg)

### U12 - View Learning Material

System allows users to view learning materials by exploring the SOC occupational levels and clicking on any material allows users to be redirected to a webpage where more information and an external url for the learning material is given.

![use case diagram](/diagrams/usecaseDiagrams/U12%20-%20View%20Learning%20Material.svg)

#### Activity Diagram

![View Learning Material](/diagrams/PBL3ActivityDiagrams/ViewLearningMaterial.jpg)

### U13 - Manage Learning Material

System allows smart city managers have control over online learning materials within the system, including the ability to create, update, and delete learning meterials through a content management system (Contentful).

![use case diagram](/diagrams/usecaseDiagrams/U13%20-%20Manage%20Learning%20Material.svg)

#### Activity Diagram

![Activity diagram showing the process flow for managing learning content](/diagrams/pbl3-manage-learning-material-activity-diagram.svg)

### U14 - View Occupation Demand

System allows users can view the demand for each detailed occupation within the system, as defined by smart city managers. Optionally, the system may display demand values for higher levels provided that the lower level occupations have demand values themselves

![use case diagram](/diagrams/usecaseDiagrams/U14%20-%20View%20Occupation%20Demands.svg)

#### Activity Diagram

![View Occupation Demand](/diagrams/PBL3ActivityDiagrams/ViewOccupationDemand.jpg)

### U15 - View Occupation News

System allows users to view news articles by exploring the SOC occupational levels while displaying specific information about each article such as title, organization, and published date

![use case diagram](/diagrams/usecaseDiagrams/U15%20-%20View%20Occupation%20News.svg)

### U16 - Manage Occupation Demand

System allows smart city managers to have the capability to set demand targets directly in the system for specific detailed occupations.

![use case diagram](/diagrams/usecaseDiagrams/U16%20-%20Manage%20Occupation%20Demands.svg)

#### Activity Diagram

![Manage Occupation Demand](/diagrams/PBL3ActivityDiagrams/ManageOccupationDemand.jpg)

### U17 - View Analytics Reports

System allows city managers to have access to various report types Shown in the activity diagram shows viewing citizens' current occupations, retrieving occupational data from the existing database. Viewing all other types of reports follows the same flow as shown.

![use case diagram](/diagrams/usecaseDiagrams/U17%20-%20View%20Analytics%20Report.svg)

#### Activity Diagram

![View Analytics Reports](/diagrams/PBL3ActivityDiagrams/ViewAnalyticsReports.jpg)

### U18 - Load News

The system automatically scrapes news sources daily for articles posted within the last 24 hours and stores links to these articles along with their related SOC occupations

![use case diagram](/diagrams/usecaseDiagrams/U18%20-%20Load%20News.svg)

### U19 - Load Unemployment

The system loads unemployment data from a government dataset by pulling data from the Bureau of Labor Statistics API on the first day of each month and stores the data in the system

![use case diagram](/diagrams/usecaseDiagrams/U19%20-%20Load%20Unemployment.svg)

### U20 - Load Certifications

The system implements functionality to load certification data from a government partner dataset while allowing system administrators to upload the dataset into the database

![use case diagram](/diagrams/usecaseDiagrams/U20%20-%20Load%20Certifications.svg)

### U21 - Load SOC Data

The system provides functionality to load SOC definitions, descriptions, and employment data from the Bureau of Labor Statistics by parsing files deployed alongside the application tier servivces.

![use case diagram](/diagrams/usecaseDiagrams/U21%20-%20Load%20SOC%20Data.svg)

### U22 - Gamification

The system gamifies certain site interactions via achievements and tutorialization to encourage the user to continue interacting with it.

#### Activity Diagram

![use case diagram](/diagrams/Gamification%20activity%20diagram.png)

## Presentation Tier Design

### Languages

* Typescript
* TSX

### Frameworks / Libraries

* [VueJS](https://vuejs.org/) - Primary Framework
* [PrimeVue](https://github.com/Workday/timeseries-forecast) - Component Framework
* [ChartJS](https://www.chartjs.org/) - Visualizations (Primary)
* [ApexCharts](https://apexcharts.com/docs/vue-charts/) - Visualizations (Heatmap)
* [Google Charts](https://developers.google.com/chart) - Visualizations (Geo Charts)
* [auth0-vue](https://auth0.com/docs/quickstart/spa/vuejs/01-login) - Auth0 SDK

### Build System

* [Vite](https://vitejs.dev/) - Build Automation
* [NPM](https://www.npmjs.com/) - Package Management

### Testing

* [Vitest](https://vitest.dev/) - Unit Testing
* [Selenium](https://www.selenium.dev/) - Integration Testing

### Development Tools

* [VSCode](https://code.visualstudio.com/) - Text Editor

### View Transition State Diagram

![view transition state diagram](/diagrams/UI_State_Diagram2.jpg)

### View Catalog

This section includes a complete list of all user interface views provided by the application.

#### CertificationInformationView

Name
: CertificationInformationView

Description
: View detailed information and links to external resources relating to a single certification.

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-CertificationInformationViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/CertificationInformationView.png)

#### CertificationView

Name
: CertificationView

Description
: View a list of certifications from organizations while being able to sort through each certification

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-CertificationViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/CertificationView.png)

#### DeleteAccountView

Name
: DeleteAccountView

Description
: Ensures the capability to delete an account upon request

User Type
: Citizens, System Administrators

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-DeleteAccountViewMockup.svg)

![component diagram](/diagrams/DeleteAccountView.png)

#### DownloadReportDataView

Name
: DownloadReportDataView

Description
: Enables the ability to download data for all types of reports

User Type
: Smart City Managers

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-DownloadReportDataViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/DownloadReportDataView.png)

#### ExploreAllOccupationView

Name
: ExploreAllOccupationsView

Description
: Provide access to data on unemployment, current occupations, and locations of all citizens. Ensures the capability to view employment statistics and the demand for each major occupation.

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-ExploreAllOccupationViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/ExploreAllOccupationView.png)

#### ExploreOccupationsView

Name
: ExploreOccupationsView

Description
: View detailed information on minor groups, broad occupations, and specific occupations, along with related content. Ensures the capability to explore deeper levels of SOC codes when available.

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-ExploreOccupationsViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/ExploreOccupationView.png)

#### HomePageView

Name
: HomePageView

Description
: View information about the application and enables the capability to sign in or register

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-HomePageViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/HomePageView.jpg)

#### InformationView

Name
: InformationView

Description
: View employment trends, occupational data, and information for major groups, minor groups, or broad occupations

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-InformationViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/InformationView.jpg)

#### JobView

Name
: JobView

Description
: View job postings information for occupations while utilizing sorting and filtering capabilities

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-JobViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/JobView.jpg)

#### LearningInformationView

Name
: LearningInformationView

Description
: View detailed information and links to external resources relating to a single learning resource

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-LearningInformationViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/LearningInformationView.jpg)

#### LearningView

Name
: LearningView

Description
: View learning resources information for occupations while utilizing sorting and filtering capabilities

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-LearningViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/LearningView.png)

#### ManageDemandView

Name
: ManageDemandView

Description
: Enable city managers to input required demand for occupations and view current demand and employment trends

User Type
: Smart City Managers


![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-ManageDemandViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/ManageDemandView.jpg)

#### NewsView

Name
: NewsView

Description
: View news information for occupations while utilizing sorting and filtering capabilities

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-NewsViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/NewsView.jpg)

#### ProfileHomePageView

Name
: ProfileHomePageView

Description
: Enable users to take various actions regarding their information, such as editing current jobs, exploring occupations, downloading report data, and deleting their account

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-ProfileHomePageViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/ProfileHomePageView.jpg)

#### ProfileView

Name
: ProfileView

Description
: Enable users to input or update their personal information and save it

User Type
: Smart City Managers, Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-ProfileViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/ProfileView.jpg)

#### ReportTypeView

Name
: ReportTypeView

Description
: View a list of report types related to occupations and associated content

User Type
: Smart City Managers

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-ReportTypeViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/ReportTypeView.jpg)

#### ReportsView

Name
: ReportsView

Description
: View sub-occupation data, user locations, and heatmaps comparing current and goal occupations for a single occupation

User Type
: Smart City Managers

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-ReportsViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/ReportsView.jpg)

#### SelectDetailedOccupationView

Name
: SelectDetailedOccupationView

Description
: View information on a specific detailed occupation and have the capability to select it as a user's current job, as well as learn more about it

User Type
: Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-SelectDetailedOccupationViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/SelectDetailedOccupationView.jpg)

#### SelectMajorAndMinorGroupView

Name
: SelectMajorAndMinorGroupView

Description
: View and select from a list of major groups, and then choose from minor groups

User Type
: Citizens

![wireframe mockup](/diagrams/componentDiagrams/mockups/PBL3-2024-SelectMajorAndMinorGroupViewMockup.svg)

![component diagram](/diagrams/componentDiagrams/views/SelectMajorAndMinorGroupView.jpg)

### Component Catalog

#### Breadcrumb

Name
: Breadcrumb

Description
: Control element used as a navigational aid to sho users which page they currently are in

![component diagram](/diagrams/componentDiagrams/Breadcrumb.jpg)

#### Button

Name
: Button

Description
: Clickable graphical element that is interactable to trigger actions or navigate from one page to another

![component diagram](/diagrams/componentDiagrams/Button.jpg)

#### CertificationsDetails

Name
: CertificationDetails

Description
: A text box with various information about a single certification such as organization, title, and a button that navigates users to CertificationInformationView

![component diagram](/diagrams/componentDiagrams/CertificationsDetails.jpg)

#### FormInput

Name
: FormInput

Description
: A field where users enter data, such as text, numbers, or selections, to submit information or perform actions within the application

![component diagram](/diagrams/componentDiagrams/FormInput.jpg)

#### JobDetails

Name
: JobDetails

Description
: A text box with various information about a single job posting such as salary range, deadline, description, title, company, location, and a button that navigates users to an external source where the job posting is located

![component diagram](/diagrams/componentDiagrams/JobDetails.jpg)

#### LearningDetails

Name
: LearningDetails

Description
: A text box with various information about a single learning material such as organization, content type, title, and a button that nagivates users to LearningInformationView

![component diagram](/diagrams/componentDiagrams/LearningDetails.jpg)

#### NewsDetails

Name
: NewsDetails

Description
: A text box with various information about a single news source such as published date, organization, title, and a button that nagivates users to an external source where the news article is located 

![component diagram](/diagrams/componentDiagrams/NewsDetails.jpg)

#### OccupationDataButton

Name
: OccupationDataButton

Description
: A button that provides information on employment trends and demand requirements, and is clickable to navigate users through the hierarchical levels of SOC codes

![component diagram](/diagrams/componentDiagrams/OccupationDataButton.jpg)

#### Report

Name
: Report

Description
: A webpage displaying various types of reports (Citizen Current Job Report, Citizen Goals Job Report, Job Postings Report, News Engagement Report, Certification Engagement Report, and Learning Material Engagement Report) with Each report containing detailed information such as the number of individuals in specific occupations, sub-occupation breakdowns, and user location heat maps categorized by occupation. Furthermore, these reports are available for users to download.

![component diagram](/diagrams/componentDiagrams/Report.jpg)

#### SelectWithTypeahead

Name
: SelectWithTypeahead

Description
: An element that combines a dropdown menu with an autosuggesting feature, allowing users to filter and select options by typing part of the desired item's name

![component diagram](/diagrams/componentDiagrams/SelectWithTypeahead.jpg)

#### Chart

Name
: Chart

Description
: A graphical method of representing various types of statistical data through formats such as line graphs, pie charts, heatmaps, and maps

![component diagram](/diagrams/Chart1.jpg)

## HTTP API

{% include apidocs.md %}

{% for controller in site.apidocs_controllers %}
### {{ controller.title }}
{{ controller.content }}
{% endfor %}

## HTTP API Models

{% for model in site.apidocs_models %}
### {{ model.title }}
{{ model.content }}
{% endfor %}

## Application Tier Design

![package diagram](/diagrams/classDiagrams/PackageDiagram.svg)

### Languages

* Java
* SQL

### Frameworks / Libraries

* [Spring](https://spring.io/projects) - IoC Container, Web Framework, Data Access Framework
* [Liquibase](https://www.liquibase.com/) - Database Migrations
* [Deeplearning4j](https://deeplearning4j.konduit.ai/) - Text Vectorization / Cosine Similarity
* [timeseries-forecast](https://github.com/Workday/timeseries-forecast) - ARIMA
* [okta-spring-boot-starter](https://auth0.com/docs/quickstart/backend/java-spring-security5/01-authorization) - Auth0 Integration
* [Commons Collections](https://commons.apache.org/proper/commons-collections/) - Trie Implementation
* [Slf4j](https://slf4j.org/) - Logging API
* [Logback](https://logback.qos.ch/) - Logging
* [LMAX Disruptor](https://lmax-exchange.github.io/disruptor/) - Analytics thread coordination

### Build System

* [Maven](https://maven.apache.org/) - Build Automation and Package Management

### Testing

* [JUnit](https://junit.org/junit5/) - Unit and Simulated Integration Testing
* [Testcontainers](https://testcontainers.com/) - Test Container Orchestration

### Development Tools

* [IntelliJ IDEA](https://www.jetbrains.com/idea/) - IDE
* [Docker](https://www.docker.com/) - Local Container Orchestration Tool

### Cross-Cutting Concerns

#### Security

Security will be implemented using Spring Security primitives. Operation controls will be enforced in a global `HttpSecurity` configuration, while operations that are secured at the individual user level will utilize method security annotations.

#### Logging

Application logging will be implemented using [Slf4j](https://slf4j.org/) to decouple the services from a particular logging implementation.

#### Error Handling

All error handling should be performed using Spring's default error handling mechanism. Exceptions should be allowed to bubble up to the framework, from which they will be mapped to an appropriate error response.

### Analytics Service

#### Ingestion (saveClickData())

Because of the high frequency and low latency requirements of clickstream data in general, this service will utilize a ringbuffer (specifically [LMAX Disruptor](https://lmax-exchange.github.io/disruptor/)) to batch and persist events, minimizing database write contention.

![disruptor execution flow](/diagrams/PBL3-2024-LMAX-disruptor.svg)

Incoming events will be pushed to the ringbuffer which will wake up the consumer. If multiple events come in within a short time window, they will be batched together and written to the database using a single bulk update instead of multiple individual transactions.

#### Querying

Querying will not require any special consideration beyond utilizing the primitives provided by timescaledb.

### Certification Service

![class diagram](/diagrams/classDiagrams/ScheduledCertificationService.svg)

#### Scheduled Synchronization (synchronizeCertifications())

![sequence diagram](/diagrams/CertificationService-synchronizeCertifications-sequence.svg)

Certifications are loaded into the system by dumping the [CareerOneStop dataset](#careeronestop-dataset) (which is provided in sql insert format) into the associated tables in the database. Periodically, this service will execute a synchronization task to pull any newly inserted data from that table, convert it to our internal representation, and push it into the certifications tables.

### Demand Service

This service is simple CRUD and does not require any special consideration.

### Employment Services

![class diagram](/diagrams/classDiagrams/PostConstructEmploymentService.svg)

#### Application Startup (loadEmployment())

![sequence diagram](/diagrams/EmploymentService-loadEmployment-sequence.svg)

At application startup, this service will look for the [SOC Employment Dataset](#soc-employment-dataset) in a predefined location. If it finds it, the service will create an in-memory data structure containing its contents, which it will utilize for other employment-oriented operations.

#### Forecasting

![activity diagram](/diagrams/arima-activity.svg)

### Job Postings Service

This service proxies out to one or more job posting APIs to obtain its data. See [the reference implementation, USAJobs.gov](#usajobs) for integration samples and constraints.

### Learning Material Service

This service is simple CRUD and does not require any special consideration on its own. However, an additional Contentful Service exists that receives webhook events from a CMS and loads them using this service. See [the external interface documentation for Contentful](#contentful) for more information.

### News Service

![class diagram](/diagrams/classDiagrams/ScheduledNewsService.svg)

#### Fetching News (fetchRSSFeeds())

![sequence diagram](/diagrams/NewsService-fetchRSSFeeds-sequence.svg)

Periodically, the system will execute this task to reach out to the [configured RSS feeds](#rss--various-sources-) and obtain a list of news articles. These articles will be stored in the database in a `NEW` state. If an article already exists, it will be forcibly transitioned back to the `NEW` state for reclassification.

#### Classifying News (classifyNews())

![sequence diagram](/diagrams/NewsService-classifyNews-sequence.svg)

Periodically, the system will execute a task to classify any `NEW` news articles. The state transitions of a single news article are shown below.

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

News classification will be performed using cosine similarity between labeled descriptions of each SOC occupation and the vectorization of the concatenated title, description and categories of the news article. Vectorization will be performed using a pretrained doc2vec model.

![Activity diagram showing the process flow for news classification using doc2vec](/diagrams/pbl3-news-classification-activity-diagram.svg)

Due to resource constraints, the corpus used to train doc2vec will be relatively small. Training data will consist of, but not be limited to, at least the following:

* [SOC Definitions (Labeled)](/documents/corpus_soc_definitions.csv)
* [S&P 500 Company Wikipedia Extracts](/documents/corpus_sp500.csv)

### Occupation Service

![class diagram](/diagrams/classDiagrams/PostConstructOccupationService.svg)

#### Application Startup (loadOccupationTrie())

![sequence diagram](/diagrams/OccupationService-loadOccupationTrie-sequence.svg)

At application startup, this service will look for the [SOC Definition Dataset](#soc-definition-dataset) in a predefined location. If it finds it, the service will create an in-memory prefix tree (i.e., [a trie](https://en.wikipedia.org/wiki/Trie)) for efficient hierarchical SOC searches.

### Unemployment Service

![class diagram](/diagrams/classDiagrams/ScheduledUnemploymentService.svg)

#### Update Unemployment Data (loadUnemploymentData())

![sequence diagram](/diagrams/UnemploymentService-loadUnemploymentData-sequence.svg)

Periodically, the system will execute this task to reach out to the [BLS Public Data API](#bls-public-data-api) to obtain updated unemployment statistics. This data will be persisted in the database and used for unemployment queries.

### User Service

This service is mostly simple CRUD, but does require special consideration around first time user sign-ins.

#### First-Time User Sign-Ins

![sequence diagram](/diagrams/UserController-getCurrentUserProfile_FirstTime-sequence.svg)

The first time a user signs in to the system, a profile will not be found. In those cases, the spring-security-oauth OIDC UserInfo endpoint integration should be utilized to fetch claims from Auth0, which should then be persisted for future logins.

## Data Tier Design

![ERD](/diagrams/system-erd.png)

### General Table Structure

Bounded contexts that require long term persistence will each receive their own table with a name matching that of the context. One-to-many and many-to-many relationships (e.g., soc code mappings), will be persisted in separate tables and queried via joins to shape them to fit our system model. Each bounded context table will have a surrogate identifier.

[Click here to download the reference schema for the ERD.](/documents/reference_schema.sql)

### Analytics / TimeseriesDB

Clickstream data will be persisted in a timescaledb [hypertable](https://docs.timescale.com/use-timescale/latest/hypertables/), initialized using the following:

```sql
CREATE EXTENSION timescaledb;
    
SELECT create_hypertable('click_data', 'timestamp');
```

[Continuous aggregates](https://docs.timescale.com/use-timescale/latest/continuous-aggregates/) will be utilized for read queries as performance needs dictate.

## Builds and Deployment

![UML Deployment Diagram](/diagrams/Deployment%20Diagram1.svg)

### Presentation Tier

The presentation tier of the system will be hosted on Netlify's "Starter" plan. Netlify provides excellent tooling for automated continuous integration and deployment of Vue applications that does not require a large amount of setup. Additionally, they have a datacenter in Tokyo, providing low latency for users of the application that happen to be TA'ing at Ritsumeikan.

![deployment pipeline diagram](/diagrams/PBL3-2024-netlify-cicd.svg)

The source code for the presentation tier will be hosted in GitHub with the Netlify app installed. On commit, Netlify will pull the latest source code, bundle it, and publish the resulting bundle to its CDN. From there, it will be accessible to the public.

### Application Tier

The application tier of the system will be hosted on Digital Ocean using their App Platform service.

![deployment pipeline diagram](/diagrams/PBL3-2024-digitalocean-cicd.svg)

The source code for the application tier will be hosted in GitHub with the Digital Ocean app installed. On commit, Digital Ocean will pull the latest source code, build it into an OCI image, and publish it to a private container registry. App Platform will detect a change to the latest tag in that registry, pull the image, and deploy it to the app cluster. A configuration volume will be mounted; this volume will contain SOC employment information, pretrained model files, and any other semi-dynamic configuration. Additionally, a secret vault and environment variables will be exposed to the application from which it can pull secrets, database urls and credentials, and other sensitive runtime information.

### Data Tier

The data tier of the system will be hosted on Digital Ocean's managed database platform. This route was chosen to minimize effort spent towards setting up and maintaining the database.

Database schema migrations will be performed using Spring's [Liquibase](https://www.liquibase.com/) support at application startup. The migration file will be embedded in the application image.

## External Interfaces

### Auth0

Auth0 is an identity and access management (IdAM) provider that manages authentication and authorization using the oauth2 protocol.

#### Integration Details

Auth0 is fully standards compliant - as such we need only follow the procedures defined in [The OAuth2 specification](https://oauth.net/2/). Additional information can be found in the [Auth0 documentation](https://auth0.com/docs).

### BLS Public Data API

The BLS Public Data Application Programming Interface (API) is an application designed to allow third party programmers, developers, and organizations to retrieve published historical time series data in JSON data-interchange format or as an Excel spreadsheet. Using Public Data API signatures, users can consume and manipulate raw data from all of the Bureau’s surveys to create a wide range of applications that conform to W3C standards and accepted practices. The BLS Public Data API does not require registration and is open for public use.

#### Integration Details

Integration guide can be found in the [BLS developer documentation](https://www.bls.gov/developers/home.htm).

#### Request Sample

```shell
curl --location 'https://api.bls.gov/publicAPI/v1/timeseries/data/' \
--header 'Content-Type: application/json' \
--data '{
  "seriesid": ["LNU04000000"],
  "startyear": "2024",
  "endyear": "2024"
}'
```

#### Response Sample

```json
{
  "status": "REQUEST_SUCCEEDED",
  "responseTime": 126,
  "message": [],
  "Results": {
    "series": [
      {
        "seriesID": "LNU04000000",
        "data": [
          {
            "year": "2024",
            "period": "M05",
            "periodName": "May",
            "latest": "true",
            "value": "3.7",
            "footnotes": [
              {}
            ]
          },
          {
            "year": "2024",
            "period": "M04",
            "periodName": "April",
            "value": "3.5",
            "footnotes": [
              {}
            ]
          },
          {
            "year": "2024",
            "period": "M03",
            "periodName": "March",
            "value": "3.9",
            "footnotes": [
              {}
            ]
          },
          {
            "year": "2024",
            "period": "M02",
            "periodName": "February",
            "value": "4.2",
            "footnotes": [
              {}
            ]
          },
          {
            "year": "2024",
            "period": "M01",
            "periodName": "January",
            "value": "4.1",
            "footnotes": [
              {}
            ]
          }
        ]
      }
    ]
  }
}
```

### Contentful

Contentful is a versatile content platform designed to help brands manage and deliver content efficiently. Used by many enterprise brands, it allows developers and creators to independently build, reuse, and connect content, integrating design and scaling projects quickly within a unified system.

#### Integration Details

The system exposes two webhook endpoints to receive notifications when content is published or unpublished. No other interactions are necessary. More details can be found in the [Contentful developer documentation](https://www.contentful.com/developers/docs/).

#### Entry Published Sample Payload

```json
{
  "metadata": {
    "tags": []
  },
  "fields": {
    "title": {
      "en-US": "Test Material"
    },
    "socCodes": {
      "en-US": [
        "11-1011"
      ]
    },
    "description": {
      "en-US": {
        "data": {},
        "content": [
          {
            "data": {},
            "content": [
              {
                "data": {},
                "marks": [],
                "value": "Sample Learning Material",
                "nodeType": "text"
              }
            ],
            "nodeType": "heading-2"
          },
          {
            "data": {},
            "content": [
              {
                "data": {},
                "marks": [],
                "value": "Here's some content! Yay!",
                "nodeType": "text"
              }
            ],
            "nodeType": "paragraph"
          },
          {
            "data": {},
            "content": [
              {
                "data": {},
                "marks": [],
                "value": "",
                "nodeType": "text"
              }
            ],
            "nodeType": "paragraph"
          }
        ],
        "nodeType": "document"
      }
    },
    "externalLinks": {
      "en-US": []
    }
  },
  "sys": {
    "type": "Entry",
    "id": "5d19lTVZTyCONXM8y2LBkz",
    "space": {
      "sys": {
        "type": "Link",
        "linkType": "Space",
        "id": "ai8a3z37eduf"
      }
    },
    "environment": {
      "sys": {
        "id": "master",
        "type": "Link",
        "linkType": "Environment"
      }
    },
    "contentType": {
      "sys": {
        "type": "Link",
        "linkType": "ContentType",
        "id": "learningMaterial"
      }
    },
    "createdBy": {
      "sys": {
        "type": "Link",
        "linkType": "User",
        "id": "4tXOP8kM16rDUICinch1N6"
      }
    },
    "updatedBy": {
      "sys": {
        "type": "Link",
        "linkType": "User",
        "id": "4tXOP8kM16rDUICinch1N6"
      }
    },
    "revision": 2,
    "createdAt": "2024-06-10T01:08:45.670Z",
    "updatedAt": "2024-06-10T01:12:48.279Z"
  }
}
```

#### Entry Unpublished Sample Payload

```json
{
  "sys": {
    "type": "DeletedEntry",
    "id": "5d19lTVZTyCONXM8y2LBkz",
    "space": {
      "sys": {
        "type": "Link",
        "linkType": "Space",
        "id": "ai8a3z37eduf"
      }
    },
    "environment": {
      "sys": {
        "id": "master",
        "type": "Link",
        "linkType": "Environment"
      }
    },
    "contentType": {
      "sys": {
        "type": "Link",
        "linkType": "ContentType",
        "id": "learningMaterial"
      }
    },
    "revision": 1,
    "createdAt": "2024-06-10T01:12:08.553Z",
    "updatedAt": "2024-06-10T01:12:08.553Z",
    "deletedAt": "2024-06-10T01:12:08.553Z"
  }
}
```

### RSS (Various Sources)

RSS is a web feed that allows users and applications to access updates to websites in a standardized, computer-readable format. The system will leverage it to pull recent news articles from various sources to be classified and displayed in the application.

#### Integration Details

All streams will operate as described in [the RSS specification](https://www.rssboard.org/rss-specification).

#### Sample RSS Feed

```xml
<rss
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:media="http://search.yahoo.com/mrss/"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:nyt="http://www.nytimes.com/namespaces/rss/2.0" version="2.0">
	<channel>
		<title>NYT > World News</title>
		<link>https://www.nytimes.com/section/world</link>
		<atom:link href="https://rss.nytimes.com/services/xml/rss/nyt/World.xml" rel="self" type="application/rss+xml"/>
		<description/>
		<language>en-us</language>
		<copyright>Copyright 2024 The New York Times Company</copyright>
		<lastBuildDate>Thu, 13 Jun 2024 02:37:44 +0000</lastBuildDate>
		<pubDate>Thu, 13 Jun 2024 02:06:57 +0000</pubDate>
		<image>
			<title>NYT > World News</title>
			<url>https://static01.nyt.com/images/misc/NYT_logo_rss_250x40.png</url>
			<link>https://www.nytimes.com/section/world</link>
		</image>
		<item>
			<title>Hamas and Israel Face Pressure to Embrace Cease-Fire Adopted by U.N.</title>
			<link>https://www.nytimes.com/2024/06/11/world/middleeast/israel-hamas-ceasefire-plan.html</link>
			<guid isPermaLink="true">https://www.nytimes.com/2024/06/11/world/middleeast/israel-hamas-ceasefire-plan.html</guid>
			<atom:link href="https://www.nytimes.com/2024/06/11/world/middleeast/israel-hamas-ceasefire-plan.html" rel="standout"/>
			<description>Despite positive statements and international urging, neither of the warring parties accepted a U.S.-backed plan to halt the war in Gaza, let displaced Palestinians go home and free hostages.</description>
			<dc:creator>Michael Crowley, Matthew Mpoke Bigg and Thomas Fuller</dc:creator>
			<pubDate>Tue, 11 Jun 2024 23:00:10 +0000</pubDate>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Palestinians</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Israel-Gaza War (2023- )</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Civilian Casualties</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Peace Process</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">International Relations</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Refugees and Displaced Persons</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Terrorism</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Humanitarian Aid</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/des">Kidnapping and Hostages</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_org">Hamas</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_org">Security Council (UN)</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_org">State Department</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_org">Wall Street Journal</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_per">Blinken, Antony J</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_per">Netanyahu, Benjamin</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_per">Sinwar, Yehya</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_per">Biden, Joseph R Jr</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_geo">Gaza Strip</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_geo">Israel</category>
			<category domain="http://www.nytimes.com/namespaces/keywords/nyt_geo">Jordan</category>
			<media:content height="1800" medium="image" url="https://static01.nyt.com/images/2024/06/11/multimedia/11Mideast-Crisis-Leadall-fgmw/11Mideast-Crisis-Leadall-fgmw-mediumSquareAt3X.jpg" width="1800"/>
			<media:credit>Haitham Imad/EPA, via Shutterstock</media:credit>
			<media:description>A street in Khan Younis, Gaza, on Tuesday.</media:description>
		</item>
	</channel>
</rss>
```

#### List of Feeds

| Source         | URL                                                                  |
|----------------|----------------------------------------------------------------------|
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/Business.xml            |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/EnergyEnvironment.xml   |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/SmallBusiness.xml       |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/Economy.xml             |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/Dealbook.xml            |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/MediaandAdvertising.xml |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/YourMoney.xml           |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/Technology.xml          |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/PersonalTech.xml        |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/Sports.xml              |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/Science.xml             |
| New York Times | https://rss.nytimes.com/services/xml/rss/nyt/Climate.xml             |
| DailyMail      | https://www.dailymail.co.uk/articles.rss                             |
| DailyMail      | https://www.dailymail.co.uk/news/index.rss                           |
| DailyMail      | https://www.dailymail.co.uk/ushome/index.rss                         |
| DailyMail      | https://www.dailymail.co.uk/sport/index.rss                          |
| DailyMail      | https://www.dailymail.co.uk/home/index.rss                           |
| DailyMail      | https://www.dailymail.co.uk/health/index.rss                         |
| DailyMail      | https://www.dailymail.co.uk/sciencetech/index.rss                    |
| DailyMail      | https://www.dailymail.co.uk/money/index.rss                          |
| DailyMail      | https://www.dailymail.co.uk/tvshowbiz/index.rss                      |
| DailyMail      | https://www.dailymail.co.uk/video/videos.rss                         |

### USAJobs

USAJobs.gov offers a free API for searching job postings for US federal jobs.

[Click here to access the developer documentation](https://developer.usajobs.gov/)

#### Request Sample

```shell
curl --location 'https://data.usajobs.gov/api/search?Keyword=Software%20Development&ResultsPerPage=1&Page=1' \
--header 'Authorization-Key: <secret>' \
--header 'User-Agent: <email>'
```

#### Response Sample

```json
{
    "LanguageCode": "EN",
    "SearchParameters": {},
    "SearchResult": {
        "SearchResultCount": 1,
        "SearchResultCountAll": 802,
        "SearchResultItems": [
            {
                "MatchedObjectId": "793682000",
                "MatchedObjectDescriptor": {
                    "PositionID": "DAFN240818010077",
                    "PositionTitle": "Division Chief (Engineering)",
                    "PositionURI": "https://www.usajobs.gov:443/GetJob/ViewDetails/793682000",
                    "ApplyURI": [
                        "https://www.usajobs.gov:443/GetJob/ViewDetails/793682000?PostingChannelID="
                    ],
                    "PositionLocationDisplay": "Warren, Michigan",
                    "PositionLocation": [
                        {
                            "LocationName": "Warren, Michigan",
                            "CountryCode": "United States",
                            "CountrySubDivisionCode": "Michigan",
                            "CityName": "Warren, Michigan",
                            "Longitude": -83.02852,
                            "Latitude": 42.511116
                        }
                    ],
                    "OrganizationName": "United States Army Futures Command",
                    "DepartmentName": "Department of the Army",
                    "SubAgency": "US Army Combat Capabilities Development Command (DEVCOM) Ground Vehicle Systems Center (GVSC)",
                    "JobCategory": [
                        {
                            "Name": "General Engineering",
                            "Code": "0801"
                        }
                    ],
                    "JobGrade": [
                        {
                            "Code": "DB"
                        }
                    ],
                    "PositionSchedule": [
                        {
                            "Name": "",
                            "Code": "1"
                        }
                    ],
                    "PositionOfferingType": [
                        {
                            "Name": "This position is to be filled as a TEMPORARY position Not-to-Exceed (NTE) 5 Years.",
                            "Code": "15321"
                        }
                    ],
                    "QualificationSummary": "Who May Apply: Only applicants who meet one of the employment authority categories below are eligible to apply for this job. You will be asked to identify which category or categories you meet, and to provide documents which prove you meet the category or categories you selected. See Proof of Eligibility for an extensive list of document requirements for all employment authorities. Current Department of Army Civilian Employees Applying on Time-Limited Assignments In order to qualify, you must meet the education and experience requirements described below. Experience refers to paid and unpaid experience, including volunteer work done through National Service programs (e.g., Peace Corps, AmeriCorps) and other organizations (e.g., professional; philanthropic; religious; spiritual; community; student; social). You will receive credit for all qualifying experience, including volunteer experience. Your resume must clearly describe your relevant experience; if qualifying based on education, your transcripts will be required as part of your application. Additional information about transcripts is in this document. Basic Education Requirement: A. Degree: Bachelor's degree (or higher degree) in engineering. To be acceptable, the program must: (1) lead to a bachelor's degree (or higher degree) in a school of engineering with at least one program accredited by the Accreditation Board for Engineering and Technology (ABET); OR (2) include differential and integral calculus and courses (more advanced than first-year physics and chemistry) in five of the following seven areas of engineering science or physics: (a) statics, dynamics; (b) strength of materials (stress-strain relationships); (c) fluid mechanics, hydraulics; (d) thermodynamics; (e) electrical fields and circuits; (f) nature and properties of materials (relating particle and aggregate structure to properties); and (g) any other comparable area of fundamental engineering science or physics, such as optics, heat transfer, soil mechanics, or electronics. NOTE: You MUST submit a copy of your transcripts. OR B. Combination of Education and Experience: College-level education, training, and/or technical experience that furnished (1) a thorough knowledge of the physical and mathematical sciences underlying engineering, and (2) a good understanding, both theoretical and practical, of the engineering sciences and techniques and their applications to one of the branches of engineering. The adequacy of such background must be demonstrated by one of the following: 1. Professional registration or licensure- Current registration as an Engineer Intern (EI), Engineer in Training (EIT), or licensure as a Professional Engineer (PE) by any State, the District of Columbia, Guam, or Puerto Rico. Absent other means of qualifying under this standard, those applicants who achieved such registration by means other than written test (e.g., State grandfather or eminence provisions) are eligible only for positions that are within or closely related to the specialty field of their registration. For example, an applicant who attains registration through a State Board's eminence provision as a manufacturing engineer typically would be rated eligible only for manufacturing engineering positions. 2. Written Test - Evidence of having successfully passed the Fundamentals of Engineering (FE) examination, or any other written test required for professional registration, by an engineering licensure board in the various States, the District of Columbia, Guam, or Puerto Rico. 3. Specified academic courses- Successful completion of at least 60 semester hours of courses in the physical, mathematical, and engineering sciences and that included the courses specified in A above. The courses must be fully acceptable toward meeting the requirements of an engineering program. 4. Related curriculum- Successful completion of a curriculum leading to a bachelor's degree in an appropriate scientific field, e.g., engineering technology, physics, chemistry, architecture, computer science, mathematics, hydrology, or geology, may be accepted in lieu of a degree in engineering, provided the applicant has had at least 1 year of professional engineering experience acquired under professional engineering supervision and guidance. (You MUST submit a copy of your transcripts along with a letter of reference stating that you have at least 1 year of professional engineering experience acquired under professional engineering supervision and guidance. The letter must be signed by the engineer who provided the professional engineer supervision. It must also include their name, phone number, and list their engineer credentials such as engineer education or professional certificates). NOTE: An applicant who meets the basic requirements as specified in A or B above, except as noted under B.1., may qualify for positions in any branch of engineering unless selective factors indicate otherwise. In addition to meeting the basic requirement above, to qualify for this position you must also meet the qualification requirements listed below: To qualify at the DB-04/GS-14/15 equivalent grade level: Your resume must clearly describe at least one year of specialized experience equivalent to the DB-03 pay band or equivalent grade level (GS-12/13) level in the Federal service which includes; Expertise in the design and development of major vehicle systems and sub-systems, and/or experience planning, directing, or coordinating combat and tactical vehicle engineering programs, projects and phases of projects. Experience working across multiple organizations, and/or experience leading projects or teams, and experience assigning, overseeing and reviewing the work of assigned teams, and resolving technical or operating problems. This definition of specialized experience is typical of work performed at the next lower grade/level position in the federal service (DB-03 pay band or equivalent grade level (GS-12/13)). This position is part of the Combat Capabilities Development Command (CCDC) Ground Vehicle Systems Center (GVSC), Science and Technology Reinvention Laboratory Personnel Management Demonstration Project. CCDC Ground Vehicle Systems Center (GVSC) is participating in an alternative personnel system known as the Personnel Management Demonstration Projection. The DB-04 pay band is equivalent to the GS-14 step 1 through GS-15 step 10 grade levels. You will be evaluated on the basis of your level of competency in the following areas: Interpersonal Skills Leadership Program Management Technical Competence",
                    "PositionRemuneration": [
                        {
                            "MinimumRange": "134751.0",
                            "MaximumRange": "191900.0",
                            "RateIntervalCode": "PA",
                            "Description": "Per Year"
                        }
                    ],
                    "PositionStartDate": "2024-06-04T00:00:00.0000",
                    "PositionEndDate": "2024-06-12T23:59:59.9970",
                    "PublicationStartDate": "2024-06-04T00:00:00.0000",
                    "ApplicationCloseDate": "2024-06-12T23:59:59.9970",
                    "PositionFormattedDescription": [
                        {
                            "Label": "Dynamic Teaser",
                            "LabelDescription": "Hit highlighting for keyword searches."
                        }
                    ],
                    "UserArea": {
                        "Details": {
                            "JobSummary": "About the Position: Serves as a Division Chief, providing direct technical, programmatic and managerial support to the Associate Director (AD), for the US Army Combat Capabilities Development Command (DEVCOM) Ground Vehicle Systems Center (GVSC), located in Warren, Michigan. This position is also being filled under announcement number DAFN240818011929. Flexible Length Modified Renewable Term (FLMRT) employees must apply under announcement number DAFN240818011929 if you wish to be considered.",
                            "WhoMayApply": {
                                "Name": "",
                                "Code": ""
                            },
                            "LowGrade": "4",
                            "HighGrade": "4",
                            "PromotionPotential": "None",
                            "SubAgencyName": "US Army Combat Capabilities Development Command (DEVCOM) Ground Vehicle Systems Center (GVSC)",
                            "OrganizationCodes": "DD/ARAF",
                            "Relocation": "False",
                            "HiringPath": [
                                "fed-competitive"
                            ],
                            "MCOTags": [
                                "NatSec"
                            ],
                            "TotalOpenings": "1",
                            "AgencyMarketingStatement": "This position is located in Warren, Michigan, and is within the US Army Combat Capabilities Development Command (DEVCOM) Ground Vehicle Systems Center (GVSC). Civilian employees serve a vital role in supporting the Army mission. They provide the skills that are not readily available in the military, but crucial to support military operations. The Army integrates the talents and skills of its military and civilian members to form a Total Army. The Army values diversity of perspectives, backgrounds, cultures and skills, which connects employees to organizations that are committed to building an inclusive work environment where they can contribute to their fullest potential. The United States Army Combat Capabilities Development Command (DEVCOM) Ground Vehicle Systems Center (GVSC), located in Warren, Michigan is the U.S. Armed Forces' research and development facility for advanced technology in ground systems. The U.S. Army DEVCOM is a major subordinate command of the United States Army Futures Command (AFC). Current technology focus areas in the Ground Vehicle Systems Center (GVSC) include Power and Mobility, Autonomous Systems, Force Projection, Survivability and Protection, Electronics and Architecture, Cyber Engineering and Software Integration.",
                            "TravelCode": "2",
                            "ApplyOnlineUrl": "https://apply.usastaffing.gov/Application/Apply",
                            "DetailStatusUrl": "https://apply.usastaffing.gov/Application/ApplicationStatus",
                            "MajorDuties": [
                                "Assists the Associate Director (AD) by participating in strategic planning for area of responsibility and implements assigned strategic objectives with a focus on improving operations.",
                                "Recommends to the AD, the establishment/abolishment of teams to meet overall objectives.",
                                "Assigns, oversees and reviews the work of assigned teams, resolving technical or operating problems.",
                                "Oversees budgets managed and executed by teams.",
                                "Serves as a vital link between the teams, customers, AD, CCDC GVSC Executive Committee and PEO/PM.",
                                "Serves as a direct, first-line supervisor to two or more Supervisory Branch Chiefs within the Division, and serves as second-line supervisor to several associates within the organization.",
                                "Assigns work to subordinates based on priorities, difficulty of assignments, and the capabilities of employees.",
                                "Interviews and selects candidates for vacant positions, and serves as the first level for resolution of disciplinary problems and grievances.",
                                "Executes Management Controls for the work unit and reviews standard operating procedures and certifications."
                            ],
                            "Education": "Some federal jobs allow you to substitute your education for the required experience in order to qualify. For this job, you must meet the qualification requirement using experience alone--no substitution of education for experience is permitted. ***NOTE: TRANSCRIPTS ARE REQUIRED even if you are a current federal employee.*** Only degrees from an accredited college or university recognized by the Department of Education are acceptable to meet positive education requirements or to substitute education for experience. For additional information, please go to the Office of Personnel Management (OPM) and U.S. Department of Education websites at - http://www.opm.gov/qualifications and http://www.ed.gov/admins/finaid/accred/index.html FOREIGN EDUCATION: If you are using education completed in foreign colleges or universities to meet the qualification requirements, you must show the education credentials have been evaluated by a private organization that specializes in interpretation of foreign education programs and such education has been deemed equivalent to that gained in an accredited U.S. education program; or full credit has been given for the courses at a U.S. accredited college or university. For further information, visit: https://sites.ed.gov/international/recognition-of-foreign-qualifications/.",
                            "Requirements": "",
                            "Evaluations": "Once the announcement has closed, a review of your application package (resume, supporting documents, and responses to the questionnaire) will be used to determine whether you meet the qualification requirements listed on this announcement. If you are minimally qualified, your resume and supporting documentation will be compared against your responses to the assessment questionnaire to determine your level of experience. If, after reviewing your resume and/or supporting documentation, a determination is made that you have inflated your qualifications and/or experience, you may lose consideration for this position. Please follow all instructions carefully when applying, errors or omissions may affect your eligibility. You should list any relevant performance appraisals and incentive awards in your resume as that information may be taken into consideration during the selection process. If selected, you may be required to provide supporting documentation.",
                            "HowToApply": "To apply for this position, you must complete the online questionnaire and submit the documentation specified in the Required Documents section above. The complete application package must be submitted by 11:59 PM (EST) on06/12/2024 to receive consideration. To begin, click Apply to access the online application. You will need to be logged into your USAJOBS account to apply. If you do not have a USAJOBS account, you will need to create one before beginning the application (https://apply.usastaffing.gov/ViewQuestionnaire/12430077). Follow the prompts to select your resume and/or other supporting documents to be included with your application package. You will have the opportunity to upload additional documents to include in your application before it is submitted. Your uploaded documents may take several hours to clear the virus scan process. After acknowledging you have reviewed your application package, complete the Include Personal Information section as you deem appropriate and click to continue with the application process. You will be taken to the online application which you must complete in order to apply for the position. Complete the online application, verify the required documentation is included with your application package, and submit the application. You must re-select your resume and/or other documents from your USAJOBS account or your application will be incomplete. It is your responsibility to verify that your application package (resume, supporting documents, and responses to the questionnaire) is complete, accurate, and submitted by the closing date. Uploaded documents may take up to one hour to clear the virus scan. Additional information on how to complete the online application process and submit your online application may be found on the USA Staffing Applicant Resource Center. To verify the status of your application, log into your USAJOBS account (https://my.usajobs.gov/Account/Login), all of your applications will appear on the Welcome screen. The Application Status will appear along with the date your application was last updated. For information on what each Application Status means, visit: https://www.usajobs.gov/Help/how-to/application/status/",
                            "WhatToExpectNext": "If you provided an email address, you will receive an email message acknowledging receipt of your application. Your application package will be used to determine your eligibility, qualifications, and quality ranking for this position. If you are determined to be ineligible or not qualified, your application will receive no further consideration.",
                            "RequiredDocuments": "The documents you are required to submit vary based on the authority you are using to apply (i.e., applying as a veteran, applying as a current permanent Federal employee, applying as a reinstatement, etc). Please review the following links to see which documents you need to provide to prove your eligibility to apply: Applicant Checklist for Internal/Merit Promotion Announcements. As described above, your complete application includes your resume, your responses to the online questionnaire, and documents which prove your eligibility to apply. If you fail to provide these documents, you will be marked as having an incomplete application package and you will not be considered any further. 1. Your resume: Your resume may be submitted in any format and must support the specialized experience described in this announcement. If your resume includes a photograph or other inappropriate material or content, it will not be used to make eligibility and qualification determinations and you may not be considered for this vacancy. For qualifications determinations your resume must contain hours worked per week and the dates of employment (i.e., HRS per week and month/year to month/year or month/year to present). If your resume does not contain this information, your application may be marked as incomplete and you may not receive consideration for this position. For additional information see: What to include in your resume. 2. Other supporting documents: Cover Letter, optional Most recent Performance Appraisal, if applicable Proof of Eligibility to Apply: Your application must include the documents which prove you are eligible to apply for the vacancy. The Proof of Eligibility document describes authorities commonly used in merit promotion recruitment and what document(s) are required to prove you meet the requirements of the authority. You must meet the requirements of at least one of the authorities listed in the Who May Apply section above to receive further consideration. This position has an individual occupational requirement and/or allows for substitution of education for experience. If you meet this requirement based on education you MUST submit a copy of your transcript with your application package or you will be rated ineligible. Your transcripts must show the degree awarded, date conferred, and all required courses as required by the position. Please note, this may be shown with multiple transcripts. See: Transcripts and Licenses NOTE: Applicants must provide the most current SF-50, Notification of Personnel Action, that supports the eligibility to be considered. (Note: SF-52 or agencies \"Request for Personnel Action\" is not acceptable). A SF-50 reflecting that you currently or formerly served as an Engineer for the Federal Government is NOT qualifying supporting documentation for the basic requirement. You MUST submit either your transcripts, current registration as a professional engineer, EIT examination results, letter of professional reference, and/or supporting documentation. Lack of this documentation will make you ineligible to be referred. NOTE: Documents submitted as part of the application package, to include supplemental documents, may be shared beyond the Human Resources Office. Some supplemental documents such as military orders and marriage certificates may contain personal information for someone other than you. You may sanitize these documents to remove another person's personal information before you submit your application. You may be asked to provide an un-sanitized version of the documents if you are selected to confirm your eligibility.",
                            "Benefits": "",
                            "BenefitsUrl": "https://www.usajobs.gov/Help/working-in-government/",
                            "BenefitsDisplayDefaultText": true,
                            "OtherInformation": "Male applicants born after December 31, 1959, must complete a Pre-Employment Certification Statement for Selective Service Registration. You will be required to provide proof of U.S. Citizenship. Three year trial/probationary period may be required. One year supervisory probationary period may be required. Direct deposit of pay is required. This position requires you to submit a Confidential Financial Disclosure Report (OGE450) upon entry, and annually thereafter. Selection is subject to restrictions resulting from Department of Defense referral system for displaced employees. If you have retired from federal service and you are interested in employment as a reemployed annuitant, see the information in the Reemployed Annuitant information sheet. This is a(n) Engineering & Technical Management Career Field (16) position. Multiple positions may be filled from this announcement. Salary includes applicable locality pay or Local Market Supplement. Payment of Permanent Change of Station (PCS) costs is not authorized, based on a determination that a PCS move is not in the Government interest. Recruitment/Relocation incentives will not be authorized. Position may be filled as a time-limited promotion, reassignment or change to lower grade not to exceed (NTE) 5 years, by a current permanent Army employee. Time-limited promotions may be extended up to a maximum of five years. Time-limited reassignments and changes to lower grade may exceed five years, however return rights may be impacted. Position may be made permanent without further competition. Permanent Army employees selected for a time-limited assignment to fill a temporary position within the same major command, must be given advance written notice of the conditions of the time limited nature of the position. This notice will include the time limit nature of the assignment action and that the employee may be returned at any time to the permanent position. Permanent Army employees selected for a time-limited assignment to a different major command must have either statutory or administrative return rights negotiated and documented prior to effecting the action. If this coordination is not completed and the action is affected the employee will return to the permanent position of record upon expiration of the temporary assignment. If the temporary assignment is extended by the gaining organization, additional coordination must be completed with the losing activity. If payment of Permanent Change of Station (PCS) cost is approved, payment will be in accordance with the Joint Travel Regulation (JTR).",
                            "KeyRequirements": [],
                            "WithinArea": "False",
                            "CommuteDistance": "0",
                            "ServiceType": "01",
                            "AnnouncementClosingType": "01",
                            "AgencyContactWebsite": "https://portal.chra.army.mil/hr_public?id=app_inq",
                            "SecurityClearance": "Secret",
                            "DrugTestRequired": "False",
                            "PositionSensitivitiy": "Noncritical-Sensitive (NCS)/Moderate Risk",
                            "AdjudicationType": [
                                "National security"
                            ],
                            "TeleworkEligible": true,
                            "RemoteIndicator": false
                        },
                        "IsRadialSearch": false
                    }
                },
                "RelevanceRank": 0
            }
        ],
        "UserArea": {
            "NumberOfPages": "802",
            "IsRadialSearch": false
        }
    }
}
```

### SOC Definition Dataset

The US Bureau of Labor Statistics (BLS) maintains a dataset of occupations classified with a standard occupation code (SOC) identifier. This dataset is distributed in XLSX format; the columns relevant to the system are shown below:

| SOC Group | SOC Code | SOC Title                                                                  | SOC Definition           |
|-----------|----------|----------------------------------------------------------------------------|--------------------------|
| Major     | 11-0000  | Management Occupations                                                     |                          |
| Minor     | 11-1000  | Top Executives                                                             |                          |
| Broad     | 11-1010  | Chief Executives                                                           |                          |
| Detailed  | 11-1011  | Chief Executives                                                           | Truncated for brevity... |
| Broad     | 11-1020  | General and Operations Managers                                            |                          |
| Detailed  | 11-1021  | General and Operations Managers                                            | Truncated for brevity... |
| Broad     | 11-1030  | Legislators                                                                |                          |
| Detailed  | 11-1031  | Legislators                                                                | Truncated for brevity... |
| Minor     | 11-2000  | Advertising, Marketing,   Promotions, Public Relations, and Sales Managers |                          |
| Broad     | 11-2010  | Advertising and Promotions   Managers                                      |                          |
| Detailed  | 11-2011  | Advertising and Promotions   Managers                                      | Truncated for brevity... |

For ingestion into the system, this data should be converted to CSV format and embedded in the application container. This dataset is released very infrequently and as such there is no need to store it externally.

[Click here to download this dataset](https://www.bls.gov/soc/2018/soc_2018_definitions.xlsx)

[Click here for additional SOC material](https://www.bls.gov/soc/2018/)

### SOC Employment Dataset

The US Bureau of Labor Statistics (BLS) maintains a dataset of employment broken down by SOC code. This dataset is distributed in XLS format; the columns relevant to the system are shown below:

| OCC_CODE |            OCC_TITLE            | O_GROUP  |   TOT_EMP   |
|:--------:|:-------------------------------:|:--------:|:-----------:|
| 00-0000  |         All Occupations         |  total   | 151,853,870 |
| 11-0000  |     Management Occupations      |  major   | 10,495,770  |
| 11-1000  |         Top Executives          |  minor   |  3,751,510  |
| 11-1010  |        Chief Executives         |  broad   |   211,230   |
| 11-1011  |        Chief Executives         | detailed |   211,230   |
| 11-1020  | General and Operations Managers |  broad   |  3,507,810  |
| 11-1021  | General and Operations Managers | detailed |  3,507,810  |

For ingestion into the system, this data should be converted to CSV format and renamed to match the following format.

```
yyyy-MM-dd-employment.csv
```

This should be included in a volume mounted to the application tier hosts and the application tier services should be configured with the location of the directory containing these files.

[Click here to download this dataset](https://www.bls.gov/oes/tables.htm)

### CareerOneStop Dataset

![careeronestop erd](/diagrams/careeronestop-erd.png)

CareerOneStop exports their certification dataset as a set of Oracle sql migration files. While the provided insert statements can be run against postgres as-is, the schema cannot. The following sections define postgres-compatible equivalents.

For ingestion into the system, the system administrator should truncate these three tables and then execute the provided insert statements. These should be performed in the following order to maintain foreign key integrity:

* CERT_ORGS (organizations that own the certification)
* CERTIFICATIONS (the actual certification data)
* CERT_ONET_ASSIGN (certification to onet extended soc codes)

[Click here to download this dataset](https://www.careeronestop.org/Developers/Data/certifications.aspx)

#### CERT_ORGS PostgresQL Converted Schema

```sql
CREATE TABLE CERT_ORGS
(
  ORG_ID           CHAR(4) CONSTRAINT ORG_ID_NN NOT NULL PRIMARY KEY,
  ORG_NAME         VARCHAR(150) CONSTRAINT ORG_NAME_NN NOT NULL,
  ORG_ADDRES       VARCHAR(200),
  ORG_PHONE1       VARCHAR(30),
  EXT              VARCHAR(10),
  ORG_PHONE2       VARCHAR(30),
  ORG_FAX          VARCHAR(30),
  ORG_EMAIL        VARCHAR(50),
  ORG_WEBPAG       VARCHAR(2000),
  ACRONYM          VARCHAR(20),
  ORG_LAST_UPDATE  DATE,
  SUPPRESS         VARCHAR(1),
  DATEADDED        DATE                         DEFAULT 'now'::timestamp,
  VERIFIED         VARCHAR(1),
  UPDATEDBY        VARCHAR(2),
  DELETED          DECIMAL(1)                    DEFAULT 0
);
```

#### CERTIFICATIONS PostgresQL Converted Schema

```sql
CREATE TABLE CERTIFICATIONS
(
  CERT_ID           VARCHAR(5) CONSTRAINT CERT_ID_NN NOT NULL PRIMARY KEY,
  CERT_NAME         VARCHAR(200) CONSTRAINT CERT_NAME_NN NOT NULL,
  ORG_ID            CHAR(4),
  TRAINING          decimal(1),
  EXPERIENCE        decimal(1),
  EITHER            decimal(1),
  EXAM              decimal(1),
  RENEWAL           CHAR(2),
  CEU               decimal(1),
  REEXAM            decimal(1),
  CPD               decimal(1),
  CERT_ANY          decimal(1),
  URL               VARCHAR(254),
  ACRONYM           VARCHAR(16),
  NSSB_URL          VARCHAR(254),
  CERT_URL          VARCHAR(254),
  CERT_LAST_UPDATE  DATE,
  KEYWORD1          VARCHAR(64),
  KEYWORD2          VARCHAR(64),
  KEYWORD3          VARCHAR(64),
  SUPPRESS          VARCHAR(1),
  DATEADDED         DATE                        DEFAULT 'now'::timestamp,
  COMMENTS          VARCHAR(1000),
  VERIFIED          VARCHAR(1),
  UPDATEDBY         VARCHAR(2),
  CERT_DESCRIPTION  VARCHAR(2000),
  DELETED           decimal(1)                   DEFAULT 0,
  EXAM_DETAILS      VARCHAR(2000)
);

ALTER TABLE CERTIFICATIONS ADD CONSTRAINT CERTIFICATIONS_ORG_ID_FK FOREIGN KEY (ORG_ID) REFERENCES CERT_ORGS (ORG_ID);
```

#### CERT_ONET_ASSIGN PostgresQL Converted Schema

```sql
CREATE TABLE CERT_ONET_ASSIGN
(
    ID         DECIMAL(7)                          NOT NULL PRIMARY KEY,
    CERT_ID    VARCHAR(5)                   NOT NULL,
    ONETCODE   VARCHAR(10)                  NOT NULL,
    ACTIVE_YN  CHAR(1)                       NOT NULL,
    RELATION   CHAR(1)
);

ALTER TABLE CERT_ONET_ASSIGN ADD CONSTRAINT CERT_ONET_ASSIGN_CERT_FK FOREIGN KEY (CERT_ID) REFERENCES CERTIFICATIONS (CERT_ID);
```

#### Converting to System Format

```sql
SELECT 
	c.cert_id as id, 
	c.cert_name as title, 
	c.cert_description as description, 
	c.url as url, 
	o.org_name as organization,
	s.onetcode as soc
FROM certifications c
LEFT JOIN cert_orgs o ON c.org_id = o.org_id
LEFT JOIN cert_onet_assign s ON s.cert_id = c.cert_id;
```

#### On ONET Extended SOC Codes

ONET utilizes SOC extensions to provide additional granularity; to map to standard SOC codes simply truncate anything past the first 7 characters and deduplicate the remainders.

## Appendix A - Large Format Diagrams

The diagrams in this section are useful for understanding the system's overall design but are difficult to view in a normal document. To view these diagrams, right click on them and open them in a new tab. From there, you can use your browser's zooming and panning capabilities to explore them in detail.

### Composite View Mockups / State Transitions

![Composite diagram of view mockups and the transitions between them](/diagrams/PBL3-2024-UI-Mockups.svg)

Note that the colors are strictly for readability and have no specific meaning.

### Composite Application Tier Class Diagram

![Composite class diagram for the application tier](/diagrams/classDiagrams/MainClassDiagram.svg)

Note that the colors denote different types of class (e.g., controller vs service vs dao).

## Appendix B - Time Series Forecasting Analysis

### ARIMA

![chart](/diagrams/forecasting/arima-00-0000.png)

![chart](/diagrams/forecasting/arima-11-0000.png)

![chart](/diagrams/forecasting/arima-11-1000.png)

![chart](/diagrams/forecasting/arima-11-1010.png)

![chart](/diagrams/forecasting/arima-11-1011.png)

These five graphs shows the number of total employees in each occ-code and forecast number of 2024 and 2025. To forecasting we use ARIMA model.

| Year/OCC-code | Forecasted number  | Real number |
|---------------|--------------------|-------------|
| 2023/00-0000  | 153140175.48817983 | 151853870   |
| 2022/25-1031  | 6187.588626263153  | 6420        |
| 2021/41-1000  | 1295681.9752079758 | 1387190     |
| 2020/15-1220  | 39020.965173350225 | 30220       |
| 2019/19-4061  | 28550.854023546708 | 35580       |

### SARIMA

![chart](/diagrams/forecasting/sarima-00-0000.png)

![chart](/diagrams/forecasting/sarima-11-0000.png)

![chart](/diagrams/forecasting/sarima-11-1000.png)

![chart](/diagrams/forecasting/sarima-11-1010.png)

![chart](/diagrams/forecasting/sarima-11-1011.png)

| Year/OCC-code | Forecast number    | Real number |
|---------------|--------------------|-------------|
| 2023/00-0000  | 218148308.14718592 | 151853870   |
| 2022/41-1011  | 1694665.303387348  | 1097160     |
| 2021/29-2052  | 641625.0906724547  | 436630      |
| 2020/17-3030  | 80025.01198749401  | 53370       |
| 2019/49-9070  | 2127690.312269844  | 1418990     |
