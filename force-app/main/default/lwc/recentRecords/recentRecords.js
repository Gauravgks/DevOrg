import { LightningElement,api,track,wire } from 'lwc';
import WordCloudJS from "@salesforce/resourceUrl/WordCloudJS";
import {loadScript} from "lightning/platformResourceLoader";
import getRecentRecords from '@salesforce/apex/RecentRecordctlr.getRecentRecords';

export default class RecentRecords extends LightningElement {
    @api objectName;
    @api numRecords;

    get cardLabel(){
        return `Value from LWC ${this.objectName}`;
    }

    @track objList;
    @track error;
    @wire(getRecentRecords) getRecords({error, data}){
        if(data){
            this.objList = data;
            console.log('Data-------->'+data);
        }
        if(error){
            this.error = error;
            console.log('error-------->'+error);
        }
    }
    /*renderedCallback(){
        if(this.rendered)
            return;

        this.rendered = true;
        loadScript(this, WordCloudJS).then(() => {
            let list = [['A', 30],['B', 50]];
            console.log(WordCloud(this.template.querySelector(".wc"),{list: list}));
          });
    }*/
}