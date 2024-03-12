import { LightningElement,api } from 'lwc';

export default class PPDemo extends LightningElement {
    message='Public Property';
    @api recordId;
}