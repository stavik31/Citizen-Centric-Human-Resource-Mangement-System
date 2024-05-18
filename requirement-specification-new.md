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
| 1.1     | 2024-05-20 | Late Stage  |

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

This SRS document is intended for various stakeholders involved in the development, deployment, and use of the system. Each section of the document contains information pertinent to different groups, as outlined below:

- **Developers**: 
  - Relevant Sections: System Features, External Interface Requirements, Non-Functional Requirements, System Evolution.

- **Project Managers**: 
  - Relevant Sections: Introduction, Overall Description, System Features, System Evolution.

- **Marketing Staff**: 
  - Relevant Sections: Introduction, Overall Description.

- **End Users**: 
  - Relevant Sections: Introduction, System Features, User Requirements.

- **Testers**: 
  - Relevant Sections: System Features, External Interface Requirements, Non-Functional Requirements.
 
- **Documentation Writers**: 
  - Relevant Sections: Overall Description, System Features, External Interface Requirements.
 

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

In the context of a smart city, this system is an asset for optimizing human resource management. By integrating this system into the city's infrastructure through data-driven insights (demand predictions) and citizen engagement (suggestions of educational material) , it enhances the city's capacity to anticipate and meet evolving labor demands. Ultimately, this product contributes to the overarching objective of creating a more efficient and citizen-centric urban environment.

### Product Functions

- Allowing citizens to choose their desired occupational goal and receive different data regarding their choice
- View News on their current or desired occupation
- View Demand data from previous years and future predictions
- View Job postings 
- View potential educational material for their desired goal
- Allowing smart city managers to view different data on citizens and creating demand
- Post number of employees needed for a job
- View unemployment data based of groups of occupations and location
- Post educational material for citizens 

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

## User Requirements

### Functional Requirements

#### FREQ-1 - Create Account

Citizens MUST be able to register for an account by initiating the signup process, providing necessary information, consenting to terms of use, and verifying their identity.

##### System Requirements

FREQ-1.1
: System MUST provide a control to initiate the signup process

FREQ-1.2
: System MUST collect the citizen's email, password, legal name, and their broad location

FREQ-1.3
: System MUST collect citizens consent to our terms of use

#### FREQ-2 - Administer Account

This system MUST allow administrators to create user accounts and assign a role to them

##### System Requirements

FREQ-2.1
: Admins MUST be able to create users to put in the system

FREQ-2.2
: Admins MUST be able to associate an account with an email, legal name

FREQ-2.3
: Admins MUST be able associate an account with an OPTIONAL location

FREQ-2.4
: Admins MUST be able to assign security roles to the users

FREQ-2.5
: The system SHOULD email the user to a one-time password setup link

#### FREQ-3 - View Occupations

User MUST be able to view information regarding different major/minor groups and broad/detailed occupations

##### System Requirements

FREQ-3.1
: Citizens MUST be shown broad occupations and detailed occupations from the major group and minor group recommended from their current job

FREQ-3.2
: Citizens MUST select a major or minor group and then be shown its related broad and detailed occupation

#### FREQ-4 - Select Job Goal

User MUST be able to select a detailed occupation as their desired goal

##### System Requirements

FREQ-4.1
: Citizens MUST be able to select a detailed occupations as a goal from a list.

FREQ-4.2
: Selected goal MUST be saved to the user profile.

#### FREQ-5 - Edit Citizen Profile

Citizens MUST be able to edit their current profile to accommodate for changes in their desired goals.

##### System Requirements

FREQ-5.1
: Citizens MUST be shown a list of major/minor groups of jobs and their descriptions and select one of them.

FREQ-5.2
: Citizens MUST be able to drill down and select a detailed occupation and be shown related occupations as a possible choice.

FREQ-5.3
: Selected detailed occupation SHOULD be saved to the user profile.

#### FREQ-6 - View Unemployment Data

Smart city managers MUST be able to view unemployment data across all citizens

##### System Requirements

FREQ-6.1
: System MUST be able to access SOC occupation records database from the Bureau of Labor Statistics to show unemployment data across all citizens

#### FREQ-7 - Major Group Unemployment

Smart City managers SHOULD be able to view unemployment data by major group

##### System Requirements

FREQ-7.1
: Smart city managers MUST be shown and be able to select a list of major groups along with the unemployment data of all citizens

FREQ-7.2
: Smart city managers MUST be able to select a major group to view their unemployment data of citizens

#### FREQ-8 - View Trend By SOC

User MUST be able to see job trends proposed by the system

##### System Requirements

FREQ-8.1
: System MUST be able to ingest occupation data from the Bureau of Labor Statistics

FREQ-8.2
: Using SOC and statistical methods, the system MUST be able to determine trends regarding employment

FREQ-8.3
: System MUST display trends

#### FREQ-9 - Delete Account

Citizen MUST be able to delete their account any time they want

##### System Requirements

FREQ-9.1
: Citizen MUST be logged in for their account to be deleted

FREQ-9.2
: If the citizen has no access to the account, the person shall contact the service via email or customer support and the person then provide information to verify their identity and then system MUST delete user profile

#### FREQ-10 - User Authentication

Citizens MUST be able to register for a profile by initiating the signup process, providing necessary information, consenting to terms of use, and verifying their identity

##### System Requirements

FREQ-10.1
: The system MUST require users to log in before accessing job listings by SOC

FREQ-10.2
: Users MUST be able to create an account if they don't have one already

FREQ-10.3
: Users MUST be prompted for their email, password, and legal name during account creation

FREQ-10.4
: Users MUST consent to the terms of use (e.g., MUST be older than 18)

FREQ-10.5
: Users MUST verify their identity during the sign-up process

FREQ-10.6
: Users SHOULD have the option to log in using email/password or through social media accounts

#### FREQ-11 - Search Functionality

The system MUST enable users to efficiently search for job listings by SOC codes or keywords, with advanced filtering and autocomplete suggestions to enhance the search experience

##### System Requirements

FREQ-11.1
: Users MUST be able to search for jobs by entering SOC codes or keywords related to job titles or descriptions

FREQ-11.2  
: The search functionality MUST support filtering options such as location, industry, salary range, etc

FREQ-11.3  
: The system MUST provide autocomplete suggestions as users type in the search bar to improve user experience

#### FREQ-12 - Job Listing Display

The system MUST present job listings in a clear, organized manner, allowing users to easily access detailed job information by clicking on each listing

##### System Requirements

FREQ-12.1  
: The system MUST display job listings in a clear and organized manner, showing relevant information such as job title, company name, location, and application deadline

FREQ-12.2
: Each job listing MUST be clickable, allowing users to view more details about the job

#### FREQ-13 - Detailed Job Information

Citizens MUST be able to view comprehensive details about job listings and have the option to save or bookmark these listings for future reference

##### System Requirements

FREQ-13.1  
: When users click on a job listing, the system MUST display detailed information about the job, including job description, required qualifications, responsibilities, benefits, etc

FREQ-13.2  
: Users MUST have the option to save or bookmark job listings for future reference

#### FREQ-14 - User Feedback and Ratings

The system MUST facilitate user feedback and ratings on job listings, enabling users to provide and view aggregated reviews to assess job suitability

##### System Requirements

FREQ-14.1  
: The system MUST allow users to provide feedback and ratings for job listings based on their experience or suitability

FREQ-14.2  
: Users MUST be able to view aggregated ratings and reviews left by other users for each job listing

#### FREQ-15 - Recover Password

Citizens MUST be able to recover their accounts by using a "Forgot Password" link, receiving a password reset email, and creating a new, secure password within a limited time frame.

##### System Requirements

FREQ-15.1  
: The system MUST provide a "Forgot Password" link on the login page for users who have forgotten their passwords

FREQ-15.2  
: When users click on the "Forgot Password" link, they MUST be directed to a password recovery page

FREQ-15.3  
: Users MUST be prompted to enter their email address or username associated with their account

FREQ-15.4  
: After entering their email address or username, the system MUST send a password reset link to the user's registered email address

FREQ-15.5
: The password reset link sent to the user's email MUST be unique and valid for a limited time (e.g., 2 hours)

FREQ-15.6  
: Clicking on the password reset link MUST redirect the user to a page where they can create a new password for their account

FREQ-15.7  
: The system MUST enforce password strength requirements (e.g., minimum length, combination of uppercase and lowercase letters, numbers, and special characters) to enhance security

FREQ-15.8  
: Users MUST receive feedback on the strength of their new password as they enter it

FREQ-15.9
: After successfully resetting their password, users MUST receive a confirmation message informing them that their password has been changed

FREQ-15.10
: Users MUST be redirected to the login page to log in with their new password

#### FREQ-16 - View Educational Material by SOC

Citizens MUST Be able to search the SOC code or Job name and retrieve relevant educational information

##### System Requirements

FREQ-16.1
: System MUST be able to access SOC occupation records database from Bureau of Labor Statistics.

FREQ-16.2
: System SHOULD accept search input from the user and retrieve the relevant records that match the input.

FREQ-16.3
: System SHOULD Display the information in an organized manner that the user can understand.

FREQ-16.4
: In case of video or documents, it MAY be able to playback the video or allow users to download

#### FREQ-17 - Edit Educational Material

Smart City Managers MUST be able to add information and delete information

##### System Requirements

FREQ-17.1
: System MUST require login before files can be uploaded.

FREQ-17.2
: System MUST allow smart-city managers and MAY allow users to add content (via a built-in text editor). Also, they MUST be able to upload files or videos.

FREQ-17.3
: System MUST allow smart-city managers to delete content

#### FREQ-18 - View History, Bookmark

Citizens MAY be able to view their search history, bookmark searches and view them later.

##### System Requirements

FREQ-18.1
: System MAY be able to store each user's search history in a database.

FREQ-18.2
: System MAY allow users to bookmark content they are interested in.

FREQ-18.3
: System MUST store and display user bookmarks with job titles and material titles.

FREQ-18.4
: System MUST be an option to delete the bookmark.

FREQ-18.5
: System MAY be an option to make folders of bookmarks.

FREQ-18.6
: When accessing bookmarked content, the system MUST check if the content has been updated, changed or removed.

---

#### FREQ-19 - Reporting (Citizen Current Occupation)

City managers SHALL be able to view a report on aggregated data of citizens' current occupation.

##### System Requirements

FREQ-19.1
: The system SHALL retrieve current occupation data of citizens from the existing database.

FREQ-19.2
: The system SHALL aggregate occupation data of citizens.

FREQ-19.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens per occupation.

FREQ-19.4
: The system SHALL generate a bar chart and/or pie chart based on the aggregated occupation data.

FREQ-19.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-19.6
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-19.7
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-19.8
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

#### FREQ-20 - Reporting (Citizen Location)

City managers SHALL be able to view a report on aggregated data of citizens' general location.

##### System Requirements

FREQ-20.1
: The system SHALL retrieve location data of citizens from the existing database.

FREQ-20.2
: The system SHALL aggregate location data of citizens.

FREQ-20.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens in a given location.

FREQ-20.4
: The system SHALL generate a map chart based on the aggregated location data.

FREQ-20.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-20.6
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-20.7
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-20.8
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

#### FREQ-21 - Reporting (Citizen Job Goals)

City managers SHALL be able to view a report on aggregated data of citizens' selected job goals.

##### System Requirements

FREQ-21.1
: The system SHALL retrieve selected job goals of citizens from the existing database.

FREQ-21.2
: The system SHALL aggregate job goals data of citizens.

FREQ-21.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens per job goal.

FREQ-21.4
: The system SHALL generate a bar chart and/or pie chart based on the aggregated job goal data.

FREQ-21.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-21.6
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-21.7
: The system SHALL include a feature for city managers to export the aggregated data to an Excel sheet format.

FREQ-21.8
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

#### FREQ-22 - Reporting (Citizen Current Occupation based on Location)

City managers SHALL be able to view a report on aggregated data of citizens' selected current occupation based on their locations.

##### System Requirements

FREQ-22.1
: The system SHALL retrieve both location and selected occupation data of citizens from the existing database.

FREQ-22.2
: The system SHALL aggregate occupation and location data of citizens.

FREQ-22.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of occupation for a given location and vice versa.

FREQ-22.4
: The system SHALL generate a heatmap based on the aggregated occupation data by location.

FREQ-22.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-22.6
: The system SHALL allow city managers to filter and sort the aggregated data by different occupation and location categories.

FREQ-22.7
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-22.8
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-22.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

#### FREQ-23 - Reporting (Citizen Goal Job based on Location)

City managers SHALL be able to view a report on aggregated data of citizens' selected job goals based on their locations.

##### System Requirements

FREQ-23.1
: The system SHALL retrieve both location and selected goal job data of citizens from the existing database.

FREQ-23.2
: The system SHALL aggregate job goals and location data of citizens.

FREQ-23.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of job goals for a given location and vice versa.

FREQ-23.4
: The system SHALL generate a heatmap based on the aggregated job goals data by location.

FREQ-23.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-23.6
: The system SHALL allow city managers to filter and sort the aggregated data by different job goals and location categories.

FREQ-23.7
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-23.8
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-23.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

#### FREQ-24 - Reporting (Citizen Job Goal based on Current Occupation)

City managers SHOULD be able to view a report on aggregated data of selected job goals of citizens based on their current occupation.

##### System Requirements

FREQ-24.1
: The system SHALL retrieve both current occupation and selected goal job data of citizens from the existing database.

FREQ-24.2
: The system SHALL aggregate job goals and current occupation data of citizens.

FREQ-24.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of job goals for a given occupation and vice versa.

FREQ-24.4
: The system SHALL generate a heatmap based on the aggregated job goals data by occupation.

FREQ-24.5
: The system SHALL provide city managers with access to these reports through a dedicated dashboard.

FREQ-24.6
: The system SHALL allow city managers to filter and sort the aggregated data by different job goals and current occupation categories.

FREQ-24.7
: The system SHALL ensure data privacy by anonymizing individual citizens' data in the aggregated reports.

FREQ-24.8
: The system SHALL allow city managers to export the aggregated data to an Excel sheet format.

FREQ-24.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

#### FREQ-25 - Reporting (Content Engagement between Job Listings and Occupation)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's occupation.

##### System Requirements

FREQ-25.1
: The system SHALL capture and log clickstream data that includes the job listing viewed whenever a citizen views job listing information.

FREQ-25.2
: The system SHALL aggregate the collected data.

FREQ-25.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by occupation.

FREQ-25.4
: The system SHALL generate a heatmap based on the aggregated data.

#### FREQ-26 - Reporting (Content Engagement between Job Listings and Citizen Location)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's general location.

##### System Requirements

FREQ-26.1
: The system SHALL capture and log clickstream data that includes the job listing viewed and the citizen's location whenever a citizen views job listing information.

FREQ-26.2
: The system SHALL aggregate the collected data.

FREQ-26.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by citizen location.

FREQ-26.4
: The system SHALL generate a heatmap based on the aggregated data.

#### FREQ-27 - Reporting (Content Engagement between Job Listings and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's selected goal job.

##### System Requirements

FREQ-27.1
: The system SHALL capture and log clickstream data that includes the job listing viewed and the citizen's selected goal job whenever a citizen views job listing information.

FREQ-27.2
: The system SHALL aggregate the collected data.

FREQ-27.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by selected goal job.

FREQ-27.4
: The system SHALL generate a heatmap based on the aggregated data.

---

#### FREQ-28 - Reporting (Content Engagement between News Content and Occupation)

City managers SHALL be able to view engagement analytics of the news content viewed by citizens based on the citizen's occupation.

##### System Requirements

FREQ-28.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's occupation whenever a citizen views news content.

FREQ-28.2
: The system SHALL aggregate the collected data.

FREQ-28.3
: The system SHALL generate reports which include analytics on the type of news content viewed by occupation.

FREQ-28.4
: The system SHALL generate a heatmap based on the aggregated data.

#### FREQ-29 - Reporting (Content Engagement between News Content and Citizen Location)

City managers SHALL be able to view engagement analytics of the news content viewed by citizens based on the citizen's general location.

##### System Requirements

FREQ-29.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's location whenever a citizen views news content.

FREQ-29.2
: The system SHALL aggregate the collected data.

FREQ-29.3
: The system SHALL generate reports which include analytics on the type of news content viewed by citizen location.

FREQ-29.4
: The system SHALL generate a heatmap based on the aggregated data.

#### FREQ-30 - Reporting (Content Engagement between News Content and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the news content viewed by citizens based on the citizen's selected goal job.

##### System Requirements

FREQ-30.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's selected goal job whenever a citizen views news content.

FREQ-30.2
: The system SHALL aggregate the collected data.

FREQ-30.3
: The system SHALL generate reports which include analytics on the type of news content viewed by selected goal job.

FREQ-30.4
: The system SHALL generate a heatmap based on the aggregated data.

---

#### FREQ-31 - Reporting (Content Engagement between Certifications and Occupation)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's occupation.

##### System Requirements

FREQ-31.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's occupation whenever a citizen views certification information.

FREQ-31.2
: The system SHALL aggregate the collected data.

FREQ-31.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by occupation.

FREQ-31.4
: The system SHALL generate a heatmap based on the aggregated data.

#### FREQ-32 - Reporting (Content Engagement between Certifications and Citizen Location)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's general location.

##### System Requirements

FREQ-32.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's location whenever a citizen views certification information.

FREQ-32.2
: The system SHALL aggregate the collected data.

FREQ-32.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by citizen location.

FREQ-32.4
: The system SHALL generate a heatmap based on the aggregated data.

#### FREQ-33 - Reporting (Content Engagement between Certifications and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's selected goal job.

##### System Requirements

FREQ-33.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's selected goal job whenever a citizen views certification information.

FREQ-33.2
: The system SHALL aggregate the collected data.

FREQ-33.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by selected goal job.

FREQ-33.4
: The system SHALL generate a heatmap based on the aggregated data.

---

#### FREQ-34 - Content Filter

User MUST be able to filter content based on occupation

##### System Requirements

FREQ-34.1 
 : User MUST be able to filter content hierarchially using major groups, minor groups, broad occupations, and detailed occupations as defined in the 2018 SOC standard.

FREQ-34.2 
 : User MUST be able to filter content by typing in an occupation name or title.

FREQ-34.3 
 : User MUST be able to filter content by typing in an occupation SOC code.

#### FREQ-35 - Certification Filter

User MUST be able to search for certifications using the filter described in FREQ-34

#### FREQ-36 - Certification

User MUST be able to view information on a specific certification

##### System Requirements

FREQ-36.1
 : The system MUST provide a unique URL for each certification to allow for browser capabilities such as bookmarking and history to function.

#### FREQ-37 - Learning Material Filter

User MUST be able to search for online learning material using the filter described in FREQ-1

#### FREQ-38 - Learning Material Information

User MUST be able to view information on a specific piece of learning material

##### System Requirements

FREQ-38.1 
 : The system MUST provide a unique URL for each piece of learning material to allow for browser capabilities such as bookmarking and history to function.

#### FREQ-39 - News Filter

User MUST be able to search for news using the filter described in FREQ-1

#### FREQ-40 - Certification Loading

Smart city managers MUST be able to create, update, and delete certifications from the system.

##### System Requirements

FREQ-40.1 
 : Smart city managers SHOULD be able to attach files and videos to a certification

FREQ-40.2 
 : System SHOULD display the creation and update timestamp for each certification

#### FREQ-41 - Learning Material Loading
Smart city managers MUST be able to create, update, and delete online learning material from the system.

##### System Requirements

FREQ-41.1 
 : Smart city managers SHOULD be able to attach files and videos to learning material

FREQ-41.2 
 : System SHOULD display the creation and update timestamp for each piece of learning material

#### FREQ-42 News Data

System MUST be able to aggregate news from various sources and associate it with its related occupation / SOC codes.

##### System Requirements

FREQ-42.1 
 : System SHOULD display the date each news article was posted to its original source

---

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

#### NREQ-16 - SOC Occupation Description

The system MUST provide functionality to load SOC occupation definitions and descriptions from a government dataset

## System Architecture

![High level Diagram](/diagrams/PBL3-2024-system-context-diagram.svg)

## System Requirements

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

![C4 System Container Diagram](/diagrams/PBL3-2024-system-container-diagram.svg)

## System Evolution

### Assumptions

### Anticipated Changes

## Appendix A: References

* [2018 Standard Occupational Classification System (SOC)](https://www.bls.gov/soc/2018/)
* [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/)
* [MDN Web Docs - Responsive Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
* [MDN Web Docs - Responsive Images](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)

