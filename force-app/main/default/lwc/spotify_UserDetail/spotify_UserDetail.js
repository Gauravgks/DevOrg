import { LightningElement } from 'lwc';
import getUserDetail from '@salesforce/apex/Spotify_HttpCallouts.getUserDetail'
import getDeviceDetails from '@salesforce/apex/Spotify_HttpCallouts.getDeviceDetails'

export default class Spotify_login extends LightningElement {

    spotifyUser;
    imageUrl;
    country;
    Subscription;
    Email;
    DevicesName;
    DevicesType
    connectedCallback() {
        getUserDetail()
            .then((result) => {
                let parsedData = JSON.parse(result);
                console.log("Log Value ~ Spotify_login ~ .then ~ parsedData:", result);

                this.spotifyUser = parsedData.display_name;
                this.imageUrl = parsedData.images[1].url;
                this.country = parsedData.country;
                this.Subscription = parsedData.product;
                this.Email = parsedData.email;
            })
            .catch((error) => {
                console.log('##Error ' + JSON.stringify(error));
            });

        getDeviceDetails()
        .then((result)=>{
            let deviceData = JSON.parse(result);
            console.log("Log Value ~ Spotify_login ~ .then ~ result:", result)
            if(result != 'No Device'){
                this.DevicesName = deviceData.devices[0].name;
                this.DevicesType = deviceData.devices[0].type;
            }
            else{

                this.DevicesName = "No Active Device";
                this.DevicesType = "No Active DeviceType ";
            }
           
        })
        .catch((error) =>{
            console.log('## Device Error' + error);
        });
}
}