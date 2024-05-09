import { LightningElement , api} from 'lwc';

export default class DisplayData extends LightningElement {

    @api displayData;
    showDataTable;
}