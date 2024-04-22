import { LightningElement } from 'lwc';
import getUserDetail from '@salesforce/apex/Spotify_HttpCallouts.getUserDetail'

export default class Spotify_login extends LightningElement {

    spotifyUser;
    imageUrl;
    connectedCallback(){
        getUserDetail()
            .then((result) => {
                let parsedData = JSON.parse(result);
                this.spotifyUser = parsedData.display_name;
               this.imageUrl = parsedData.images[0].url;

            })
            .catch((error) => {
                console.log('##Error '+ JSON.stringify(error));
            });
    }
}