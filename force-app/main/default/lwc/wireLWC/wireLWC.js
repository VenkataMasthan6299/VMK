import { LightningElement,api,wire } from 'lwc';

import { getRecord,getFieldValue} from 'lightning/uiRecordApi';
const FIELDS=[
             'Account.Name',
             'Account.Phone',
            ];

export default class WireLWC extends LightningElement {
    @api recordId;
    @wire(getRecord,{recordId:'$recordId',fields:FIELDS})
    record;
    get name(){
        return this.record.data.fields.Name.value;
    }
    get phone(){
        return this.record.data.fields.Phone.value;
    }
}