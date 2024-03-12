import { LightningElement, track} from 'lwc';

export default class Calculate2Numbers extends LightningElement {
@track resultValue
number1;
number2;
callme(event)
{
    const evtname=event.target.name;
    if(evtname=='aval')
    {
        this.number1=event.target.value;
    }
    else{
        this.number2=event.target.value;
    }
}
show()
{
    const n1=parseInt(this.number1);
    const n2=parseInt(this.number2);
    this.resultValue='Sum of Aval : '+n1+' and Bval : '+n2+' is: '+(n1+n2);
}
}