import { LightningElement, wire } from 'lwc';
import accountsById from '@salesforce/apex/getChildRecords.accountsById'

export default class WireMethodAsFunction extends LightningElement {
    accounts;
    @wire(accountsById) accountFunction({ data, error }) {

        if (data) {
           console.log();
           let accountData = data.map(curritem =>{
            let updatedobject = {};
                if(!Object.prototype.hasOwnProperty.call(curritem, "Rating")){
                    updatedobject = {...curritem,Rating : 'Warm'};
                }
                else{
                    updatedobject = {...curritem};
                }
                return updatedobject;
           });
           console.log('accountData', accountData);
           this.accounts = [...accountData];
        }

        else if (error) {
            console.log(error)
        }

    }
}