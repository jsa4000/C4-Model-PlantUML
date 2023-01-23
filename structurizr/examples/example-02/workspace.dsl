workspace "Fake Transport Company Architecture Sample" "This is a sample architecture model of FTC Software System " {

    model {

        driver = person "Driver" "Truck driver"

        tripAdmin = person "Admin" "Assign trips"

        ftc = softwareSystem "FTC" {

            !docs docs

            mobile = container "FTCMobile" "FTC Mobile App" "Xamarin.Forms" "Mobile App" {
                apiLibrary = component "FTCAPILibrary" "Library for API access" "HTTP"
                tripHelper = component "TripHelper" "Show trip information" "C#"
            }

            api = container "FTCAPI" "FTC API" "Asp.NET Core" {
                tripManager = component "TripManager" "Manage trip related information" "C#"
                persistenceManager = component "PersistenceManager" "Library for SQL database access" "TSQL"
                authManager = component "AuthManager" "Manage Authentication/Authorization" "C#"
            }

            web = container "FTCWeb" "FTC Web App" "Asp.NET Core" "Web App"
        }

        # External services
        aad = softwareSystem "Azure Active Directory" "Store users information" "External Service"
        asql = softwareSystem "Azure SQL Database" "Store business information" "Database"

        # Relations
        driver -> mobile "Get trip information and inform progress"
        tripAdmin -> web "Manage trip planification"
        
        apiLibrary -> api "Consume API"
        web -> api "Consume API"
        
        authManager -> aad "Read/Write user information"
        persistenceManager -> asql "Read/Write business information"

        tripHelper -> apiLibrary "Read/Write trip information"

        tripManager -> persistenceManager "Access business information"
        persistenceManager -> authManager "Get token for SQL access"
    }

    views {

        systemContext ftc "FTC" {
            include *
            autoLayout
        }

        container ftc "FTCMobile" "Mobile Application" {
            include *
            autoLayout
        }

        component mobile "Mobile" "Xamarin Mobile App General Component Diagram" {
            include *
            autoLayout
        }

        component api "API" "FTC API General Component Diagram" {
            include *
            autoLayout
        }

        theme default

        styles {

            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            
            element "Web App" {
                shape WebBrowser
            }

            element "External Service" {
                shape Component
                background #999999
            }

            element "Database"{
                shape Cylinder
                background #999999
            }

        }

    }

}