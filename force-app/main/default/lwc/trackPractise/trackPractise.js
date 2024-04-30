import { LightningElement, track } from 'lwc';

export default class TrackPractise extends LightningElement {

    greeting = 'Hello'
    @track welcome = 'Hello from Track decorator'

    @track name = {fname: 'Gaurav', lname: 'Singh'}

    clickHandle(event){
        this.greeting = 'Changed greeting value after Button Click'
        this.welcome = 'Changed welcome value after Button Click'
    }

    clickHandleName(event){
        this.name.fname = 'ABC'
    }
}