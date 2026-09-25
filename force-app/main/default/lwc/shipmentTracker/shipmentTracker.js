import { LightningElement, api, track } from 'lwc';
// Uvozimo našu Apex metodu u JavaScript
import getLiveTrackingDetails from '@salesforce/apex/ShipmentCalloutService.getLiveTrackingDetails';

export default class ShipmentTracker extends LightningElement {
    @api recordId; // Salesforce automatski puni ovaj ID na osnovu stranice paketa gde se komponenta nalazi
    
    @track location;
    @track arrivalTime;
    @track errorMessage;
    @track isLoading = false;

    // Funkcija koja se pokreće kada korisnik klikne na dugme
    handleRefresh() {
        this.isLoading = true;
        this.errorMessage = '';
        
        // Pozivam Apex metodu i prosledjujem joj ID trenutnog paketa
        getLiveTrackingDetails({ shipmentId: this.recordId })
            .then(result => {
                if (result.status === 'Success') {
                    this.location = result.currentLocation;
                    this.arrivalTime = result.estimatedArrival;
                } else {
                    this.errorMessage = result.message;
                }
                this.isLoading = false;
            })
            .catch(error => {
                this.errorMessage = 'Greška pri pozivanju servera: ' + error.body.message;
                this.isLoading = false;
            });
    }
}
