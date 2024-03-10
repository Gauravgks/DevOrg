import { LightningElement, api } from 'lwc';
import {notifyRecordUpdateAvailable} from 'lightning/uiRecordApi';
import {
    subscribe,
    unsubscribe,
    onError,
    setDebugFlag,
    isEmpEnabled,
} from 'lightning/empApi';


export default class DisplayRefreshMessage extends LightningElement {
    @api channelName = '/data/AccountChangeEvent';
    isDisplayMsg = false;

    subscription = {};
    @api recordId;
     // Initializes the component
     connectedCallback() {
        this.handleSubscribe();
        // Register error listener
        this.registerErrorListener();
    }

    handleSubscribe() {
        // Callback invoked whenever a new event message is received
        const messageCallback =  (response) => {
            console.log('New message received: ', JSON.stringify(response));
            // Response contains the payload of the new message received
            this.handleChangeEventResponse(response);
        };

        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, messageCallback).then((response) => {
            // Response contains the subscription information on subscribe call
            console.log(
                'Subscription request sent to: ',
                JSON.stringify(response.channel)
            );
            this.subscription = response;
        });
    }

    disconnectedCallback(){
        this.handleUnsubscribe();
    }

    handleUnsubscribe() {
        // Invoke unsubscribe method of empApi
        unsubscribe(this.subscription, (response) => {
            console.log('unsubscribe() response: ', JSON.stringify(response));
            // Response is true for successful unsubscribe
        });
    }

    registerErrorListener() {
        // Invoke onError empApi method
        onError((error) => {
            console.log('Received error from server: ', JSON.stringify(error));
            // Error contains the server-side error
        });
    }

    handleChangeEventResponse(response){
        if(response.hasOwnProperty("data")){
            let jsonObj = response.data;
            if(jsonObj.hasOwnProperty("payload")){
                let payLoad = response.data.payload;
                const isRecordFound = payLoad.ChangeEventHeader.recordIds.find(currItem => currItem == this.recordId);
                if(isRecordFound != undefined){
                    this.isDisplayMsg = true;
                }
            
            }
        }
    }

   async refreshPage(){
      await  notifyRecordUpdateAvailable([{recordId: this.recordId}]);
      this.isDisplayMsg = false;
    }
}