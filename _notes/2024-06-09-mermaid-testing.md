---
title: 2024-06-09 Mermaid Testing
author: Andy
---



classDiagram
    class Root {
        LanguageCode: string
        SearchParameters: object
        SearchResult: object
    }
    
    class SearchResult {
        SearchResultCount: int
        SearchResultCountAll: int
        SearchResultItems: list
    }
    
    class SearchResultItem {
        MatchedObjectId: string
        MatchedObjectDescriptor: object
    }

    class MatchedObjectDescriptor {
        PositionID: string
        PositionTitle: string
        PositionURI: string
        ApplyURI: list
        PositionLocationDisplay: string
        PositionLocation: list
        OrganizationName: string
        DepartmentName: string
        JobCategory: list
        JobGrade: list
        PositionSchedule: list
        PositionOfferingType: list
        QualificationSummary: string
        PositionRemuneration: list
        PositionStartDate: string
        PositionEndDate: string
        PublicationStartDate: string
        ApplicationCloseDate: string
        PositionFormattedDescription: list
        UserArea: object
    }
    
    class PositionLocation {
        LocationName: string
        CountryCode: string
        CountrySubDivisionCode: string
        CityName: string
        Longitude: float
        Latitude: float
    }
    
    class JobCategory {
        Name: string
        Code: string
    }
    
    class JobGrade {
        Code: string
    }
    
    class PositionSchedule {
        Name: string
        Code: string
    }
    
    class PositionOfferingType {
        Name: string
        Code: string
    }
    
    class PositionRemuneration {
        MinimumRange: float
        MaximumRange: float
        RateIntervalCode: string
        Description: string
    }
    
    class PositionFormattedDescription {
        Label: string
        LabelDescription: string
    }
    
    class UserArea {
        Details: object
    }
    
    class Details {
        JobSummary: string
        WhoMayApply: object
        LowGrade: string
        HighGrade: string
        PromotionPotential: string
        OrganizationCodes: string
        Relocation: string
        HiringPath: list
        TotalOpenings: string
        AgencyMarketingStatement: string
        TravelCode: string
        ApplyOnlineUrl: string
        DetailStatusUrl: string
        MajorDuties: list
        Education: string
        Requirements: string
        Evaluations: string
        HowToApply: string
        WhatToExpectNext: string
        RequiredDocuments: string
        Benefits: string
        BenefitsUrl: string
        BenefitsDisplayDefaultText: bool
        OtherInformation: string
    }
    
    class WhoMayApply {
        Name: string
        Code: string
    }
    
    Root --> SearchResult
    SearchResult --> SearchResultItem
    SearchResultItem --> MatchedObjectDescriptor
    MatchedObjectDescriptor --> PositionLocation
    MatchedObjectDescriptor --> JobCategory
    MatchedObjectDescriptor --> JobGrade
    MatchedObjectDescriptor --> PositionSchedule
    MatchedObjectDescriptor --> PositionOfferingType
    MatchedObjectDescriptor --> PositionRemuneration
    MatchedObjectDescriptor --> PositionFormattedDescription
    MatchedObjectDescriptor --> UserArea
    UserArea --> Details
    Details --> WhoMayApply
