import { LightningElement, api } from 'lwc';

export default class PractiseLWCChild extends LightningElement {
    @api childData;
    sendBackTheBall() {
        this.dispatchEvent(
          new CustomEvent("sendbacktheball", {
            detail: "Data from Child"
          })
        );
      }
    
}