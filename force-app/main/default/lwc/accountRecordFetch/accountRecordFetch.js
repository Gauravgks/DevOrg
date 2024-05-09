import { LightningElement, wire } from 'lwc';
import accountsById from '@salesforce/apex/getChildRecords.accountsById'

const columns = [
    { label: 'Account Name', fieldName: 'Name' },
    { label: 'Account Industry', fieldName: 'Industry'},
    { label: 'Account Rating', fieldName: 'Rating'},
];

export default class AccountRecordFetch extends LightningElement {
   //Property Type
    columns = columns;
    @wire(accountsById) accounts;

    //Function Type (Saving the Data in a JS Obj)
    

}