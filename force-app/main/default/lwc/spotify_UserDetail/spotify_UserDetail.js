import { LightningElement, track } from 'lwc';
import getUserDetail from '@salesforce/apex/Spotify_HttpCallouts.getUserDetail'
import getDeviceDetails from '@salesforce/apex/Spotify_HttpCallouts.getDeviceDetails'
import getCurrentPlayingSong from '@salesforce/apex/Spotify_HttpCallouts.getCurrentPlayingSong'
export default class Spotify_login extends LightningElement {

    spotifyUser;
    imageUrl;
    country;
    Subscription;
    Email;
    DevicesName = []
    DevicesType = []
    @track likeState
    currentSong
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
            .then((result) => {
                let deviceData = JSON.parse(result);
                if (result !== 'No Device') {
                    let availableDevices = deviceData.devices;
                    availableDevices.forEach(element => {
                        this.DevicesName.push(element.name);
                        this.DevicesType.push(element.type);

                    });
                }
                else {

                    this.DevicesName = "No Active Device";
                    this.DevicesType = "No Active DeviceType ";
                }

            })
            .catch((error) => {
                console.log('## Device Error' + error);
            });
    }
    // handleLikeButtonClick() {
    //     this.likeState = !this.likeState;
    // }


    handleClick() {
        getCurrentPlayingSong().then((result) => {

            let parsedData = JSON.parse(result);

            this.currentSong = parsedData.item.name;
            console.log("Log Value ~ Spotify_login ~ .then ~ current song details:", parsedData);

        })
    }
}