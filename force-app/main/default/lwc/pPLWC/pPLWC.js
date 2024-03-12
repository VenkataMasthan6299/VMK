import { LightningElement,api } from 'lwc';

export default class PPLWC extends LightningElement {
    message = 'Public Property';
    @api recordId;
}