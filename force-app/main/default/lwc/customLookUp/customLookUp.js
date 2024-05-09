/* eslint-disable no-unused-vars */
/* eslint-disable @lwc/lwc/no-async-operation */
import { LightningElement, wire } from 'lwc';
import searchRecords from '@salesforce/apex/customLookupController.searchRecords'

const Delay = 300;

export default class CustomLookUp extends LightningElement {

    apiName = "Account";
    searchValue = "A";
    objectLabel = "Account";
    iconName = "standard:account"
    delayTimeout; 
    selectedRecord = {
        selectedId : "",
        selectedName : ""
    }
    //displayOptions = false

    get isRecordSelected(){
        return this.selectedRecord.selectedId === "" ?  false : true;
    }

    @wire(searchRecords, { objectApiName: "$apiName", searchKey: "$searchValue" }) outputs;


    changeHandler(event) {
        window.clearTimeout()
        let enteredValue = event.target.value;
        //debouncing - DO not update the reactive property as long as this function is
        //being called within a certain time
        let delayTimeout = setTimeout(() => {
            this.searchValue = enteredValue
           // this.displayOptions = true
        }, Delay);
    }

    clickHandler(event){
        let selectedId = event.currentTarget.dataset.item;
        let outputRecord = this.outputs.data.find((currItem) => currItem.Id === selectedId);
        this.selectedRecord = {
            selectedId : outputRecord.Id,
            selectedName : outputRecord.Name
        };
       // this.displayOptions = false
    }

    removalSelectionHandler(event){

        this.selectedRecord = {
            selectedId : "",
            selectedName : ""
        };
       
    }
}