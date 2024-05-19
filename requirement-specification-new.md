---
title: Requirements Specification
nav_order: 2
---

# Software Requirements Specification
{: .no_toc }

## Preface

### Version History

| Version | Date       | Description      |
|---------|------------|------------------|
| 1.0     | 2024-05-20 | Initial revision |

### Document Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

Requirements in this specification are classified at three levels of aggregation to suit the needs of various readers of this document: functional or non-functional, user requirement identifier, and an optional trailing system requirement sub identifier. Unless otherwise stated, it is to be assumed that each requirement is hierarchical and that stated user-level requirements implicitly depend on the system requirements sharing the same identifier.

Functional requirements will be prefixed with "FREQ-". Non-functional requirements will be prefixed with "NREQ-".

Requirement identifiers will be proceeded by a short title. This title should be applicable to the requirement, but should not be construed as part of the requirement and exists only to improve the navigability and searchability of this document.

FREQ-0 Example User Requirement
: This denotes a functional user requirement with the id of 0

NREQ-0.0 Example System Requirement
: This denotes a non-functional system requirement with the id of 0.0. This requirement is implicitly a dependency of the non-functional user requirement NREQ-0.

### Intended Audience and Reading Suggestions

This software requirement specification is intended for various stakeholders involved in the development, deployment, and use of the system. Each section of the document contains information pertinent to different groups, as outlined below:

Developers
: System Features, External Interface Requirements, Functional Requirements, Non-Functional Requirements, System Evolution.

Project Managers
: Introduction, Overall Description, System Features, System Evolution.

Marketing Staff
: Introduction, Overall Description, Functional Requirements.

End Users 
: Introduction, System Features, Functional Requirements.

Test Engineers
: System Features, External Interface Requirements, Functional Requirements, Non-Functional Requirements.
 
Documentation Writers
: Overall Description, System Features, External Interface Requirements.
 
## Table of Contents
{: .no_toc }

- TOC
{:toc}

## Introduction

This document serves as the Software Requirements Specification (SRS) for the 'System for Citizen-centric Human Resource Management in Smart Cities'. It outlines the functional and non-functional requirements of the system, providing a detailed description of the software's expected behavior and features. This SRS is intended for use by the project development team, project managers, marketing staff, end users, testers, and documentation writers to ensure a common understanding of the system requirements.

### Product Objectives and Scope

Objectives

- Engage citizenry by allowing them to explore available opportunities (Link to project proposal)
- Provide a data-driven approach to human resource management in smart cities (Link to project proposal)
- Encourage reskilling and upskilling by gamifying the process (Link to project proposal)

Scope

The system is designed to optimize human resource management in a smart city context, providing data-driven insights and engaging citizens in exploring job opportunities and educational materials. The prototype will cover a single metropolitan area and a limited subset of occupational segments based on available data.

### Product Perspective

![C4 System Context Diagram](/diagrams/PBL3-2024-system-context-diagram.svg)

In the context of a smart city, this system is an asset for optimizing human resource management. By integrating this system into the city's infrastructure through data-driven insights (demand predictions) and citizen engagement (suggestions of educational material), it enhances the city's capacity to anticipate and meet evolving labor demands. Ultimately, this product contributes to the overarching objective of creating a more efficient and citizen-centric urban environment.

### Product Functions

- Allow citizens to select a career goal and receive customized resources based on it
- Allow citizens to explore news, educational material, job postings, employment trends, employment forecasts, and projected demand for each occupation.
- Provide engagement data and employment trend forecasts to assist smart city managers in predicting future demand.

### Use Cases

Use case diagram here

## Glossary

### General Terms

The following are terminologies and their definitions used in the document.

City Manager
: The official appointed administrative manager of a city government responsible for administrative operations of the city municipality.

SOC Codes
: Standard Occupational Classification (SOC) codes is a federal statistical standard classification used by federal agencies to classify workers into occupational categories for the purpose of collecting, calculating, or disseminating data. 

User
: In this document, when 'User' is mentioned, it encompasses both 'Citizen' and 'Smart City Manager' defined in User Classes and Characteristics.

### User Classes and Characteristics

Citizen
: Direct user of the system that is from the citizenry. Citizens use the system to view job opportunities, acquire educational materials, and gain insights into their skillsets and job market trends to transition into new employment opportunities.

Smart City Manager
: Direct end user of the system from the government. Smart City Managers utilize the system to analyze and manage the workforce within the city, using data-driven insights to predict labor demands, assess workforce skills, and plan for future urban development needs.

System Administrator
: An individual responsible for managing, maintaining, and overseeing the system's technical aspects. This role includes administrating accounts for city managers, maintaining system, troubleshooting issues, and supporting users.

## Functional Requirements

### FREQ-1 - Account Creation

Citizens MUST be able to register for an account by initiating the signup process, providing necessary information, and consenting to terms of use.

#### System Requirements

FREQ-1.1
: System MUST provide a control to initiate the signup process

FREQ-1.2
: System MUST collect the citizen's email, password, legal name, and postal code

FREQ-1.3
: The system MUST enforce password strength requirements. This may be achieved by either enforcing character restrictions (a mix of uppercase letters, lowercase letters, numbers, and symbols) or by measuring complexity (using a tool such as zxcvbn).

FREQ-1.4
: Users MUST receive feedback on the strength of their password as they enter it

FREQ-1.3
: System MUST collect citizens consent to our terms of use

---

### FREQ-2 - Account Administration

This system MUST allow System Administrators to create user accounts and assign a role to them.

#### System Requirements

FREQ-2.1
: System must provide an interface for System Administrators to create new user accounts.

FREQ-2.2
: System Administrators MUST be able to associate an account with an email, legal name, and optionally a postal code.

FREQ-2.3
: System Administrators MUST be able to assign security roles to the users, such as "citizen" or "smart city manager".

FREQ-2.4
: The system SHOULD email users created in this fashion a one-time password reset link. This link should function as described in FREQ-4.

---

### FREQ-3 - Edit Profile

Users must be able to edit their profile to change important information about themselves, such as their legal name or location.

#### System Requirements

FREQ-3.1
: The system MUST provide the capability for existing users to modify their legal name.

FREQ-3.2
: The system MUST provide the capability for existing users to modify their postal code.

FREQ-3.3
: The system MUST provide the capability for existing users to change their password. This may utilize the functionality described in FREQ-4.

FREQ-3.3
: The system MAY provide the capability for existing users to change their email. This may require additional verification steps depending on the IdAM provider being used.

---

### FREQ-4 - Recover Password

Citizens MUST be able to recover their accounts by using a "Forgot Password" link, receiving a password reset email, and creating a new, secure password within a limited time frame.

#### System Requirements

FREQ-4.1
: The system MUST provide a "Forgot Password" link on the login page for users who have forgotten their passwords

FREQ-4.2
: When users click on the "Forgot Password" link, they MUST be directed to a password recovery page

FREQ-4.3
: Users MUST be prompted to enter their email address or username associated with their account

FREQ-4.4
: After entering their email address or username, the system MUST send a password reset link to the user's registered email address

FREQ-4.5
: The password reset link sent to the user's email MUST be unique and valid for 2 hours, after which it should cease functioning.

FREQ-4.6
: Clicking on the password reset link MUST redirect the user to a page where they can create a new password for their account

FREQ-4.7
: The system MUST enforce password strength requirements. This may be achieved by either enforcing character restrictions (a mix of uppercase letters, lowercase letters, numbers, and symbols) or by measuring complexity (using a tool such as zxcvbn).

FREQ-4.8
: Users MUST receive feedback on the strength of their new password as they enter it

FREQ-4.9
: After successfully resetting their password, users MUST receive a confirmation message informing them that their password has been changed

FREQ-4.10
: Users MUST be redirected to the login page to log in with their new password

---

### FREQ-5 - Delete Account

Citizen MUST be able to delete their account any time they want

#### System Requirements

FREQ-5.1
: Citizen MUST be logged in for their account to be deleted

FREQ-5.2
: If the citizen has no access to the account, the person shall contact the service via email or customer support and the person then provide information to verify their identity and then system MUST delete user profile

---

### FREQ-6 - Occupation Views

The system MUST present content to users in hierarchical views mirroring the structure described in the 2018 Standard Occupational Classification System (Appendix A).

#### System Requirements

FREQ-6.1
: The system MUST provide a root view aggregating content for all occupations.

FREQ-6.2
: The root view MUST contain navigational links and informative content for each SOC major group. 

FREQ-6.3
: The root view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.4
: The system MUST provide a SOC major group view aggregating content for all occupations in that major group.

FREQ-6.5
: The SOC major group view MUST contain navigational links and informative content for each SOC minor group.

FREQ-6.6
: The SOC major group view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.7
: The system MUST provide a SOC minor group view aggregating content for all occupations in that minor group.

FREQ-6.8
: The SOC minor group view MUST contain navigational links and informative content for each SOC broad occupation.

FREQ-6.9
: The SOC minor group view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.10
: The system MUST provide a SOC broad occupation view aggregating content for all occupations in that broad occupation.

FREQ-6.11
: The SOC broad occupation view MUST contain navigational links and informative content for each SOC detailed occupation.

FREQ-6.12
: The SOC broad occupation view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.13
: The system MUST provide a SOC detailed occupation view displaying content for a specific detailed occupation.

FREQ-6.14
: The SOC detailed occupation view SHOULD contain navigational links and informative content for other detailed occupations in the same minor group.

FREQ-6.15
: Citizens that have selected a career goal as defined in FREQ-4 SHOULD be automatically navigated to the SOC detailed occupation view for that occupation upon signing in to the system.

FREQ-6.16
: Users SHOULD be able to navigate to a specific occupation (at any level) by typing the occupation name or title into a search control.

FREQ-6.17
: Users SHOULD be able to navigate to a specific occupation (at any level) by typing the SOC code into a search control.

FREQ-6.18
: Each SOC view should have a dedicated URL to allow standard browser functionality, such as bookmarking and history, to function as expected.

---

### FREQ-7 - Select Career Goal

Citizens MUST be able to select a detailed occupation as their career goal.

#### System Requirements

FREQ-7.1
: The SOC detailed occupation view should present a control that, when interacted with, sets the citizen's career goal to the current detailed occupation.

FREQ-7.2
: Selected career goal MUST be saved to the citizen's profile.

---

### FREQ-8 - Unemployment Data

Smart city managers MUST be able to view historical unemployment data.

#### System Requirements

FREQ-8.1
: System MUST be able to ingest unemployment data from the Bureau of Labor Statistics.

FREQ-8.2
: System MUST display aggregate unemployment data to smart city managers as a line chart.

FREQ-8.3
: System MUST display aggregate unemployment data to smart city managers as a table.

FREQ-8.4
: System MAY display specific occupation unemployment data in the associated SOC view (as described in FREQ-6) when available.

---

### FREQ-9 - Employment Trends

Users MUST be able to see employment trends for the occupation they are currently viewing.

#### System Requirements

FREQ-9.1
: The system MUST be able to ingest occupation data from the Bureau of Labor Statistics.

FREQ-9.2
: The system MUST apply time series analysis to forecast future trends.

FREQ-9.3
: The system MUST display historical and forecasted employment trends for the occupation currently being viewed.

FREQ-9.4
: The system SHOULD display historical and forecasted employment trends for occupations related to the occupation currently being viewed (as described in FREQ-6.2, FREQ-6.5, FREQ-6.8, FREQ-6.11, and FREQ-6.14)

FREQ-9.5
: The system SHOULD clearly denote which trend data is historical and which is forecasted. This may be done using colors, symbols, or other visual techniques.

---

### FREQ-10 - Job Postings

Users MUST be able to view job postings for the occupation they are currently viewing.

#### System Requirements

FREQ-10.1
: The system MUST integrate with an external job posting API to retrieve this data.

FREQ-10.2  
: The system MUST display job listings in a clear and organized manner, showing relevant information such as job title, company name, salary range, location, and application deadline

FREQ-10.3
: Each job listing MUST be clickable, allowing users to view more details about the job on an external web page.

FREQ-10.4
: If available in the dataset, the system MAY additionally display user reviews and ratings for each job posting.

FREQ-10.5
: The system SHOULD provide sorting and filtering capability for job posting.

---

### FREQ-11 - Certifications

Users MUST be able to view certifications applicable to the occupation they are currently viewing.

#### System Requirements

FREQ-11.1
: The system MUST ingest data from careeronestop to obtain a list of certifications.

FREQ-11.2
: The system MUST display relevant information about each certification, such as a title and description.

FREQ-11.3
: Each certification MUST be clickable, allowing users to view more detailed information on a separate page.

FREQ-11.4
: This detailed certification page must contain the title, description, links to external resources, and any other relevant information obtained in the careeronestop dataset.

FREQ-11.5
: The system MUST provide a unique URL for each detailed certification page to allow for browser capabilities such as bookmarking and history to function.

FREQ-11.6
: The system SHOULD provide sorting and filtering capability for certifications.

---

### FREQ-12 - Online Learning Material

Users MUST be able to view online learning material applicable to the occupation they are currently viewing.

#### System Requirements

FREQ-12.1
: The system MUST display relevant information about each material, such as a title and description.

FREQ-12.2
: Each material MUST be clickable, allowing users to view more detailed information on a separate page.

FREQ-12.3
: This detailed learning material page MUST contain the title, description, links to external resources, and any other relevant information about the learning material.

FREQ-12.4
: The system MUST provide a unique URL for each detailed learning material page to allow for browser capabilities such as bookmarking and history to function.

FREQ-12.5
: The system SHOULD provide sorting and filtering capability for learning material.

---

### FREQ-13 - Online Learning Material Management

Smart city managers MUST be able to create, update, and delete online learning material from the system.

#### System Requirements

FREQ-13.1
: Smart city managers SHOULD be able to attach files and videos to learning material

---

### FREQ-14 News

System MUST be able to aggregate news from various sources and associate it with its related occupation / SOC codes.

#### System Requirements

FREQ-14.1
: System SHOULD display the date each news article was posted to its original source

---

### FREQ-15 - Reporting (Citizen Current Occupation)

City managers SHALL be able to view a report on aggregated data of citizens' current occupation.

#### System Requirements

FREQ-15.1
: The system SHALL retrieve current occupation data of citizens from the existing database.

FREQ-15.2
: The system SHALL aggregate occupation data of citizens.

FREQ-15.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens per occupation.

FREQ-15.4
: The system SHALL generate a bar chart and/or pie chart based on the aggregated occupation data.

FREQ-15.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-15.6
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-15.7
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-15.8
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-16 - Reporting (Citizen Location)

City managers SHALL be able to view a report on aggregated data of citizens' general location.

#### System Requirements

FREQ-16.1
: The system SHALL retrieve location data of citizens from the existing database.

FREQ-16.2
: The system SHALL aggregate location data of citizens.

FREQ-16.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens in a given location.

FREQ-16.4
: The system SHALL generate a map chart based on the aggregated location data.

FREQ-16.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-16.6
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-16.7
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-16.8
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-17 - Reporting (Citizen Job Goals)

City managers SHALL be able to view a report on aggregated data of citizens' selected job goals.

#### System Requirements

FREQ-17.1
: The system SHALL retrieve selected job goals of citizens from the existing database.

FREQ-17.2
: The system SHALL aggregate job goals data of citizens.

FREQ-17.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens per job goal.

FREQ-17.4
: The system SHALL generate a bar chart and/or pie chart based on the aggregated job goal data.

FREQ-17.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-17.6
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-17.7
: The system SHALL include a feature for city managers to export the aggregated data to an Excel sheet format.

FREQ-17.8
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-18 - Reporting (Citizen Current Occupation based on Location)

City managers SHALL be able to view a report on aggregated data of citizens' selected current occupation based on their locations.

#### System Requirements

FREQ-18.1
: The system SHALL retrieve both location and selected occupation data of citizens from the existing database.

FREQ-18.2
: The system SHALL aggregate occupation and location data of citizens.

FREQ-18.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of occupation for a given location and vice versa.

FREQ-18.4
: The system SHALL generate a heatmap based on the aggregated occupation data by location.

FREQ-18.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-18.6
: The system SHALL allow city managers to filter and sort the aggregated data by different occupation and location categories.

FREQ-18.7
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-18.8
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-18.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-19 - Reporting (Citizen Goal Job based on Location)

City managers SHALL be able to view a report on aggregated data of citizens' selected job goals based on their locations.

#### System Requirements

FREQ-19.1
: The system SHALL retrieve both location and selected goal job data of citizens from the existing database.

FREQ-19.2
: The system SHALL aggregate job goals and location data of citizens.

FREQ-19.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of job goals for a given location and vice versa.

FREQ-19.4
: The system SHALL generate a heatmap based on the aggregated job goals data by location.

FREQ-19.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-19.6
: The system SHALL allow city managers to filter and sort the aggregated data by different job goals and location categories.

FREQ-19.7
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-19.8
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-19.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-20 - Reporting (Citizen Job Goal based on Current Occupation)

City managers SHOULD be able to view a report on aggregated data of selected job goals of citizens based on their current occupation.

#### System Requirements

FREQ-20.1
: The system SHALL retrieve both current occupation and selected goal job data of citizens from the existing database.

FREQ-20.2
: The system SHALL aggregate job goals and current occupation data of citizens.

FREQ-20.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of job goals for a given occupation and vice versa.

FREQ-20.4
: The system SHALL generate a heatmap based on the aggregated job goals data by occupation.

FREQ-20.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-20.6
: The system SHALL allow city managers to filter and sort the aggregated data by different job goals and current occupation categories.

FREQ-20.7
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-20.8
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-20.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-21 - Reporting (Content Engagement between Job Listings and Occupation)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's occupation.

#### System Requirements

FREQ-21.1
: The system SHALL capture and log clickstream data that includes the job listing viewed whenever a citizen views job listing information.

FREQ-21.2
: The system SHALL aggregate the collected data.

FREQ-21.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by occupation.

FREQ-21.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-22 - Reporting (Content Engagement between Job Listings and Citizen Location)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's general location.

#### System Requirements

FREQ-22.1
: The system SHALL capture and log clickstream data that includes the job listing viewed and the citizen's location whenever a citizen views job listing information.

FREQ-22.2
: The system SHALL aggregate the collected data.

FREQ-22.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by citizen location.

FREQ-22.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-23 - Reporting (Content Engagement between Job Listings and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's selected goal job.

#### System Requirements

FREQ-23.1
: The system SHALL capture and log clickstream data that includes the job listing viewed and the citizen's selected goal job whenever a citizen views job listing information.

FREQ-23.2
: The system SHALL aggregate the collected data.

FREQ-23.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by selected goal job.

FREQ-23.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-24 - Reporting (Content Engagement between News Content and Occupation)

City managers SHALL be able to view engagement analytics of the news content viewed by citizens based on the citizen's occupation.

#### System Requirements

FREQ-24.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's occupation whenever a citizen views news content.

FREQ-24.2
: The system SHALL aggregate the collected data.

FREQ-24.3
: The system SHALL generate reports which include analytics on the type of news content viewed by occupation.

FREQ-24.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-25 - Reporting (Content Engagement between News Content and Citizen Location)

City managers SHALL be able to view engagement analytics of the news content viewed by citizens based on the citizen's general location.

#### System Requirements

FREQ-25.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's location whenever a citizen views news content.

FREQ-25.2
: The system SHALL aggregate the collected data.

FREQ-25.3
: The system SHALL generate reports which include analytics on the type of news content viewed by citizen location.

FREQ-25.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-26 - Reporting (Content Engagement between News Content and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the news content viewed by citizens based on the citizen's selected goal job.

#### System Requirements

FREQ-26.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's selected goal job whenever a citizen views news content.

FREQ-26.2
: The system SHALL aggregate the collected data.

FREQ-26.3
: The system SHALL generate reports which include analytics on the type of news content viewed by selected goal job.

FREQ-26.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-27 - Reporting (Content Engagement between Certifications and Occupation)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's occupation.

#### System Requirements

FREQ-27.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's occupation whenever a citizen views certification information.

FREQ-27.2
: The system SHALL aggregate the collected data.

FREQ-27.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by occupation.

FREQ-27.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-28 - Reporting (Content Engagement between Certifications and Citizen Location)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's general location.

#### System Requirements

FREQ-28.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's location whenever a citizen views certification information.

FREQ-28.2
: The system SHALL aggregate the collected data.

FREQ-28.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by citizen location.

FREQ-28.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-29 - Reporting (Content Engagement between Certifications and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's selected goal job.

#### System Requirements

FREQ-29.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's selected goal job whenever a citizen views certification information.

FREQ-29.2
: The system SHALL aggregate the collected data.

FREQ-29.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by selected goal job.

FREQ-29.4
: The system SHALL generate a heatmap based on the aggregated data.

---

## Non-Functional Requirements

### NREQ-1 - WCAG 2 AA Compliance

The system MUST adhere to the Web Content Accessibility Guidelines (WCAG) 2.2, meeting a minimum of AA level success criteria outlined in the guidelines. Refer to Appendix A for further details.

---

### NREQ-2 - Supported Devices

The system MUST provide equivalent experiences for both mobile and desktop clients.

#### System Requirements

NREQ-2.1
: The system MUST provide a web interface with responsive capabilities as defined by the MDN web docs (See Appendix A).

NREQ-2.2
: The system MAY provide alternative clients, such as iOS or Android native apps.

---

### NREQ-3 - Internationalization

The system MUST be able to translate displayed content into one or more languages as selected by the user.

#### System Requirements

NREQ-3.1
: The system MUST expose a control that allows users to select a language or locale for the user interface.

NREQ-3.2
: The system MUST at minimum support the generic English locale (en).

NREQ-3.3
: The system MUST display all static text, such as labels or prompts, in the language or locale selected by the user.

NREQ-3.4
: The system MAY display alternate dynamic content, such as news articles or job postings, in the language or locale selected by the user.

---

### NREQ-4 - Client Performance

The system MUST be usable on low-end to medium-end devices.

#### System Requirements

NREQ-4.1
: The system MUST limit the bundle size of the web interface's static content to no more than 10MB.

NREQ-4.2
: The system SHOULD support responsive images as defined by the MDN web docs (See Appendix A).

NREQ-4.3
: The system MUST achieve a Google PageSpeed **Performance** score of 80 or higher for its web interface.

---

### NREQ-5 - Server Performance

Any APIs presented by the system MUST be able to handle peak load without degraded performance.

#### System Requirements

NREQ-5.1
: All HTTP APIs presented by the system MUST maintain P95 latency not exceeding 1000ms.

NREQ-5.2
: All server-side components of the system MUST be capable of starting up in less than 60 seconds to allow for sufficient elasticity when deployed in autoscale-capable environments.

---

### NREQ-6 - Availability and Uptime

The system MUST achieve three nines of availability (99.9% uptime) during standard operating hours. Maintenance downtime scheduled in advance is excluded from this requirement.

---

### NREQ-7 - Development Practices

The system MUST be developed using processes that follow industry standard best practices.

#### System Requirements

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

### NREQ-8 - Continuous Deployment

The system SHOULD be deployed using processes that minimize human involvement.

---

### NREQ-9 - Observability and Monitoring

The system SHOULD expose diagnostic logging and metrics to aide in measuring performance and business indicators.

#### System Requirements

NREQ-9.1
: Server-side components MUST expose operational logs via STDOUT for collection by external log aggregation systems.

NREQ-9.2
: Server-side components SHOULD expose performance and operational metrics using a standardized format (e.g., Prometheus) for collection by external metrics ingestion systems.

NREQ-9.3
: Client-side components SHOULD integrate with a web or mobile monitoring solution (e.g., Raygun).

---

### NREQ-10 - Authentication

The system MUST require users to authenticate using an externalized authentication scheme, such as OAuth 2, OIDC, or SAML.

#### System Requirements

NREQ-10.1
: The system MUST NOT have any knowledge of user credentials, such as passwords.

---

### NREQ-11 - Authorization

The system MUST enforce Role Based Access Control (RBAC) to limit interactions with system components to only users that are authorized to do so.

#### System Requirements

NREQ-11.1
: The system MUST define a role for citizens and limit their access to only their own profile and public educational content.

NREQ-11.2
: The system MUST define a role for smart city managers and limit their access to only citizen aggregate data reports and demand management tooling.

---

### NREQ-12 - Personally Identifiable Information

The system MUST manage citizen data in compliance with the terms of the General Data Protection Regulation (GDPR), California Consumer Protection Act (CCPA), and other similar legislation.

#### System Requirements

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

### NREQ-13 - Encryption in Transit

All communication between a user and the system MUST utilize end-to-end encryption.

#### System Requirements

NREQ-13.1
: All HTTP APIs MUST utilize TLS 1.3 or newer.

NREQ-13.2
: Private keys MUST NOT be accessible to developers of the system.

---

### NREQ-14 - Encryption at Rest

All personally identifiable information related to citizens MUST be encrypted at rest.

#### System Requirements

NREQ-14.1
: All databases containing personally identifiable information relating to a citizen MUST utilize some form of encryption at rest, either at the filesystem level or, if supported, in the database itself.

NREQ-14.2
: Encryption keys MUST NOT be accessible to developers of the system.

---

### NREQ-15 - Clickstream Analytics

The system MUST collect and ingest clickstream data for use in reports specified in FREQ-XXXX.

#### System Requirements

NREQ-15.1
: The system MUST expose an API for the collection of clickstream data. This data should contain at minimum the citizen's profile ID, current occupation SOC code, and identifying information about the content they interacted with.

NREQ-15.2
: Clickstream data SHOULD be indexed and aggregated for efficient querying and reporting.

NREQ-15.3
: Client-side components MUST, with citizen consent, publish clickstream data for all citizen actions in the system to the API described in NREQ-15.1.

---

### NREQ-16 - SOC Occupation Description

The system MUST provide functionality to load SOC occupation definitions and descriptions from a government dataset

## System Architecture

![C4 System Container Diagram](/diagrams/PBL3-2024-system-container-diagram.svg)

## System Models

## System Evolution

### Assumptions

### Anticipated Changes

## Appendix A: References

* [2018 Standard Occupational Classification System (SOC)](https://www.bls.gov/soc/2018/)
* [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/)
* [MDN Web Docs - Responsive Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
* [MDN Web Docs - Responsive Images](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)

