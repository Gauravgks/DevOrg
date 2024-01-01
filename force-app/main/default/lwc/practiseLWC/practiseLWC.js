import { LightningElement, api } from 'lwc';

export default class PractiseLWC extends LightningElement {
    childData1;
    childgreeting = 'Parent to Child Hello World'

    handleChildData(event){
        this.childData1 = event.detail;
    }
}