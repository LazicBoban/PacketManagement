# Packet Management - Salesforce Project

An end-to-end cloud and mobile-ready logistics solution built on the Salesforce platform. This project addresses real-world delivery management challenges by combining low-code automation, programmatic backend logic, integration with external REST APIs, and a modern reactive user interface.

##  Key Business Features & Solutions

*   **Automated Driver Assignment (Apex Trigger):** Eliminates manual paperwork for field drivers. Upon shipment creation via mobile or desktop, a `before insert` trigger automatically logs the current authenticated user as the designated driver.
*   **Real-Time External Tracking Integration (LWC + Apex Callout):** Allows dispatchers to fetch live package location updates with a single click. A custom Lightning Web Component securely connects to an external REST API via Apex HTTP services.
*   **Crisis & Delay Management (Record-Triggered Flow):** Automatically handles exceptions. If a shipment's status shifts to `Delayed`, a low-code automated flow instantly creates a high-priority escalation Task for the logistics manager to mitigate customer impact.

##  Technical Architecture & Tools

*   **Frontend:** Lightning Web Components (LWC), HTML5, JavaScript (ES6+), Salesforce Lightning Design System (SLDS).
*   **Backend & Logic:** Apex Triggers (Bulkified Handler Architecture), Apex Classes, SOQL.
*   **Integration:** REST API HTTP Callouts, Remote Site Settings (secure endpoint authorization).
*   **Automation:** Salesforce Record-Triggered Flows (optimized for Actions and Related Records).
*   **Development Workflow:** VS Code, Salesforce CLI, Git, GitHub.

##  Metadata Structure

The core architecture developed in this repository includes:
*   `force-app/main/default/objects/Shipment__c` - Custom object data model and schema fields.
*   `force-app/main/default/classes/ShipmentCalloutService.cls` - Apex service class managing external HTTP requests and payload mapping.
*   `force-app/main/default/lwc/shipmentTracker` - Reactive UI component implementing user interaction and lifecycle tracking hooks.
*   `force-app/main/default/triggers/ShipmentTrigger.trigger` - Lean trigger architecture delegating execution to handler classes.

---
*Developed as a standalone showcase of advanced Salesforce Development capabilities.* 
