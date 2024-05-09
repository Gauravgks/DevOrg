import { LightningElement } from 'lwc';

export default class RenderListDemo extends LightningElement {

    Alphabets = ['A', 'B', 'C', 'D', 'E', 'F']

    contactList = [
        {
            id: 1,
            firstname: 'Marc',
            lastname: 'Benioff'
        },
        {
            id: 2,
            firstname: 'Elon',
            lastname: 'Musk'
        },
        {
            id: 3,
            firstname: 'Steves',
            lastname: 'Jobs'
        },
        {
            id: 4,
            firstname: 'Tim',
            lastname: 'Cook'
        }
    ];
}